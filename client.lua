ESX = nil
local open = false
local loaded = false
PlayerData = nil
inv_type = nil
cancel = true
clothingopen = false
local setjob = false
local lastSkin, cam, isCameraActive
local firstSpawn, zoomOffset, camOffset, heading, skinLoaded = true, 0.0, 0.0, 90.0, false
local clothes = {}
shopindex = 1
Citizen.CreateThread(function()
    Wait(100)
	while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end
    while ESX.GetPlayerData().job == nil do Wait(0) end
    ESX.PlayerData = ESX.GetPlayerData()
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    TriggerServerEvent('renzu_jobs:updatejob',PlayerData)
    setjob = true
    Wait(2000)
    setjob = false
end)

local playercache = {}
function OpenBossMenu()
    ESX.TriggerServerCallback("renzu_jobs:playerlist",function(data,jobs,count,admin,myimage,myjob,jobmoney,jobdata)
        playercache = data
        SendNUIMessage({
            type = 'show',
            content = {money = jobmoney, myjob = myjob, jobdata = jobdata, players = data, logo = config.logo}
        })
        Wait(50)
        SetNuiFocus(true,true)
        SetNuiFocusKeepInput(false)
    end)
end

local invcache = {}
local jobinvcache = {}
function OpenInventory(job,type)
    local job = PlayerData.job.name
    ESX.TriggerServerCallback('renzu_jobs:getPlayerInventory', function(inventory)
        SendNUIMessage({
            type = 'showinv',
            content = {inventory = inventory.playerinventory, job_inventory = inventory.inventory, logo = config.logo, img = config.inventoryImageUrl}
        })
        inv_type = type
        Wait(50)
        invcache = inventory.playerinventory
        jobinvcache = inventory.inventory
        SetNuiFocus(true,true)
        SetNuiFocusKeepInput(false)
    end,job,type)
end

function OpenWeaponMenu()
    local configweapon = Config.Weapons
    if Weapons[PlayerData.job.name] == nil then print("JOB IS NOT REGISTER TO weaponconfig.lua") end
    for k,v in pairs(configweapon) do
        if Weapons[PlayerData.job.name] ~= nil and Weapons[PlayerData.job.name][v.name] then
            v.mingrade = Weapons[PlayerData.job.name][v.name].mingrade
        end
    end
    local weapons = {}
    ESX.TriggerServerCallback('renzu_jobs:getPlayerWeapons', function(weapon)
        local weapon = weapon
        for k,v in pairs(configweapon) do
            v.owned = false
            if PlayerData.job.grade >= v.mingrade then
                for k,v2 in pairs(weapon) do
                    if v2.name == v.name then
                        v.owned = true
                        v.install_components = {}
                        for k3,v3 in pairs(v2.components) do
                            v.install_components[v3] = true
                        end
                    end
                end
                weapons[v.name] = v
            end
        end
        SendNUIMessage({
            type = 'Weapons',
            content = {weapons = weapons ,logo = config.logo, img = config.inventoryImageUrl}
        })
        Wait(50)
        SetNuiFocus(true,true)
        SetNuiFocusKeepInput(false)
    end)
end

RegisterNetEvent('renzu_jobs:openweapons')
AddEventHandler('renzu_jobs:openweapons', function(job)
	OpenWeaponMenu()
end)

RegisterNetEvent('renzu_jobs:opengarage')
AddEventHandler('renzu_jobs:opengarage', function(job)
    if IsPedInAnyVehicle(PlayerPedId()) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local plate = GetVehicleNumberPlateText(vehicle)
        local prop = ESX.Game.GetVehicleProperties(vehicle)
        ESX.TriggerServerCallback("renzu_jobs:storevehicle",function(a)
            SetNuiFocus(false,false)
            SetNuiFocusKeepInput(false)
            TaskLeaveVehicle(PlayerPedId(),GetVehiclePedIsIn(PlayerPedId()),1)
            Wait(2000)
            CheckWanderingVehicle(plate)
            cancel = true
            cb(a)
        end,plate,prop)
    else
	    OpenGarage()
    end
end)

function OpenGarage()
    local job = PlayerData.job.name
    ESX.TriggerServerCallback("renzu_jobs:getvehicles",function(data,vehiclesdb)
        local vehicles = {}
        for k,v in pairs(data) do
            local prop = json.decode(v.vehicle)
            local name = 'not found'
            local modelname = GetDisplayNameFromVehicleModel(prop.model)
            for k,v in pairs(vehiclesdb) do
                if prop.model == GetHashKey(v.model) then
                    name = v.name
                    modelname = v.model
                    break
                end
            end
            if name == 'not found' then
                name = GetLabelText(GetDisplayNameFromVehicleModel(prop.model))
            end
            table.insert(vehicles, {
                label = name,
                class = GetVehicleClassnamemodel(prop.model),
                type  = v.type,
                prop = prop,
                name = prop.model,
                plate = prop.plate,
                image = config.vehicleimage..''..modelname:lower()..'.jpg',
                stored = v.stored
            })
        end
        SendNUIMessage({
            type = 'Garage',
            content = {garagedata = vehicles ,logo = config.logo, img = config.inventoryImageUrl}
        })
        Wait(50)
        SetNuiFocus(true,true)
        SetNuiFocusKeepInput(false)
    end)
end

RegisterNetEvent('renzu_jobs:openvehicleshop')
AddEventHandler('renzu_jobs:openvehicleshop', function()
    OpenVehicleShop()
end)

RegisterNUICallback('buyvehicle', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:buyvehicle",function(a)
        SetNuiFocus(false,false)
        SetNuiFocusKeepInput(false)
        close()
        cb(a)
    end,data.model)
end)

function OpenVehicleShop()
    local job = PlayerData.job.name
    local vehicles = {}
    for k,v in pairs(config.Jobs[job]['vehicleshop'].vehicles) do
        local modelname = v.model
        table.insert(vehicles, {
            label = v.label,
            name = v.model,
            class = GetVehicleClassnamemodel(GetHashKey(v.model)),
            value = v.value,
            image = config.vehicleimage..''..modelname:lower()..'.jpg',
        })
    end
    SendNUIMessage({
        type = 'VehicleShop',
        content = {vehicleshop = vehicles ,logo = config.logo, img = config.inventoryImageUrl}
    })
    Wait(50)
    SetNuiFocus(true,true)
    SetNuiFocusKeepInput(false)
end

function GetAllVehicleFromPool()
    local list = {}
    for k,vehicle in pairs(GetGamePool('CVehicle')) do
        table.insert(list, vehicle)
    end
    return list
end

function CheckWanderingVehicle(plate)
    local result = nil
    local gameVehicles = GetAllVehicleFromPool()
    for i = 1, #gameVehicles do
        local vehicle = gameVehicles[i]
        if DoesEntityExist(vehicle) then
            local otherplate = string.gsub(tostring(GetVehicleNumberPlateText(vehicle)), '^%s*(.-)%s*$', '%1'):upper()
            local plate = string.gsub(tostring(plate), '^%s*(.-)%s*$', '%1'):upper()
            if otherplate:len() > 8 then
                otherplate = otherplate:sub(1, -2)
            end
            if plate:len() > 8 then
                plate = plate:sub(1, -2)
            end
            if plate == otherplate then
                ReqAndDelete(vehicle)
            end
        end
    end
end

function ReqAndDelete(object, detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		local attempt = 0
		while not NetworkHasControlOfEntity(object) and attempt < 100 and DoesEntityExist(object) do
			NetworkRequestControlOfEntity(object)
			Citizen.Wait(11)
			attempt = attempt + 1
		end
		--if detach then
			DetachEntity(object, 0, false)
		--end
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

RegisterNUICallback('returnvehicle', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:returnvehicle",function(a)
        if a then
            SpawnVehicle(data)
            cb(a)
        else
            cb(false)
        end
    end)
    cb(true)
end)

function SpawnVehicle(data)
    local job = PlayerData.job.name
    ESX.TriggerServerCallback("renzu_jobs:takeoutvehicle",function(a)
        local coord = config.Jobs[job]['garage']['spawn']
        SetNuiFocus(false,false)
        SetNuiFocusKeepInput(false)
        local props = data.prop
        CheckWanderingVehicle(data.plate)
        Wait(100)
        local hash = tonumber(props.model)
        local count = 0
        if not HasModelLoaded(hash) then
            RequestModel(hash)
            while not HasModelLoaded(hash) and count < 1111 do
                count = count + 10
                Citizen.Wait(10)
                if count > 1000 then
                return
                end
            end
        end
        v = CreateVehicle(hash,vector3(coord.x,coord.y,coord.z), coord.w, 1, 1)
        ESX.Game.SetVehicleProperties(v, data.prop)
        NetworkFadeInEntity(v,1)
        TaskWarpPedIntoVehicle(PlayerPedId(), v, -1)
        cb(a)
    end,data.plate)
end

RegisterNUICallback('spawnvehicle', function(data, cb)
    SpawnVehicle(data)
    cb(true)
end)



RegisterNetEvent('renzu_jobs:openshop')
AddEventHandler('renzu_jobs:openshop', function(shop,job)
	OpenShop(shop,job)
end)

local currentshop = nil
function OpenShop(shop,job)
    local job = job
    SendNUIMessage({
        type = 'Shop',
        content = {shop = config.Jobs[job]['shop'][shopindex]['items'] ,logo = config.logo, img = config.inventoryImageUrl}
    })
    currentshop = job
    Wait(50)
    SetNuiFocus(true,true)
    SetNuiFocusKeepInput(false)
end

RegisterNUICallback('buyitem', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:buyitem",function(a)
        if not a then
            close()
        end
        cb(a)
    end,data.item,data.amount,currentshop,shopindex)
end)

function close()
    SendNUIMessage({
        type  = 'close'
    })
    SetNuiFocus(false,false)
    SetNuiFocusKeepInput(false)
    cancel = true
end

local confirm = false
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false,false)
    SetNuiFocusKeepInput(false)
    open = not open
    cancel = true
    if clothingopen then
        clothingopen = false
        if not confirm then
            TriggerEvent('skinchanger:loadSkin', lastSkin)
        end
        DeleteSkinCam()
    end
    cb(true)
end)

RegisterNUICallback('getinfo', function(data, cb)
    cb(playercache)
end)

RegisterNUICallback('refresh', function(data, cb)
    OpenBossMenu()
    cb(true)
end)

RegisterNUICallback('kick', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:kick",function(a)
        cb(a)
    end,data.id)
    cb(true)
end)

RegisterNUICallback('getweapon', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:getweapon",function(a)
        OpenWeaponMenu()
        cb(a)
    end,data.weapon)
end)

RegisterNUICallback('setcomponents', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:setweaponcomponents",function(a)
        --OpenWeaponMenu()
        cb(a)
    end,data.weapon,data.component)
end)

RegisterNUICallback('changesalary', function(data, cb)
    local grade = data.grade
    local amount = data.amount
    ESX.TriggerServerCallback("renzu_jobs:changesalary",function(a)
        cb(a)
    end,grade,amount)
end)

RegisterNUICallback('sendbonus', function(data, cb)
    local id = nil
    local amount = 0
    for k,v in pairs(data.t) do 
        if v.name == 'id' then
            id = v.value
        end
        if v.name == 'amount' then
            amount = v.value
        end
    end
    ESX.TriggerServerCallback("renzu_jobs:sendbonus",function(a)
        cb(a)
    end,id,amount)
end)

RegisterNUICallback('itemfunc', function(data, cb)
    local type = data.type
    local amount = data.amount
    local item = data.item
    local weapon = false
    local slot = nil
    if string.find(item:upper(), "WEAPON_") then
        for k,v in pairs(invcache) do
            if v.name == item then
                amount = v.ammo
                slot = v.slot
            end
        end
    end
    if type == 0 then
        for k,v in pairs(jobinvcache) do
            if v.name == item then
                slot = v.slot
            end
        end
    end
    ESX.TriggerServerCallback("renzu_jobs:itemfunc",function(a)
        local job = PlayerData.job.name
        OpenInventory(job,inv_type)
        cb(a)
    end,type,amount,item,inv_type,slot)
end)

RegisterNUICallback('withdraw_deposit', function(data, cb)
    local type = data.type
    local amount = data.amount
    local money_type = data.money_type
    ESX.TriggerServerCallback("renzu_jobs:withdraw_deposit",function(a)
        cb(a)
    end,type,amount,money_type)
end)

RegisterNetEvent('renzu_jobs:updatemoney')
AddEventHandler('renzu_jobs:updatemoney', function(data)
    SendNUIMessage({
        type  = 'update',
        data = data
    })
end)

RegisterNetEvent('renzu_jobs:openinventory')
AddEventHandler('renzu_jobs:openinventory', function(type)
    local job = PlayerData.job.name
    OpenInventory(job,type)
end)

RegisterNetEvent('renzu_jobs:openbossmenu')
AddEventHandler('renzu_jobs:openbossmenu', function()
    local grade = PlayerData.job.grade
    OpenBossMenu(grade)
end)

RegisterNUICallback('setjob', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:setjob",function(a)
        cb(a)
    end,data.grade,data.id)
end)

RegisterNetEvent('renzu_jobs:opencrafting')
AddEventHandler('renzu_jobs:opencrafting', function(type)
    local job = PlayerData.job.name
    OpenCrafting(job)
end)

function OpenCrafting()
    local job = PlayerData.job.name
    SendNUIMessage({
        type = 'Crafting',
        content = {crafting = config.Jobs[job]['crafting']['craftable'] ,logo = config.logo, img = config.inventoryImageUrl}
    })
    Wait(50)
    SetNuiFocus(true,true)
    SetNuiFocusKeepInput(false)
end

RegisterNUICallback('craftitem', function(data, cb)
    ESX.TriggerServerCallback("renzu_jobs:craftitem",function(a)
        cb(a)
    end,data.item,data.amount,data.type)
end)

RegisterNetEvent('renzu_jobs:duty')
AddEventHandler('renzu_jobs:duty', function(name,job)
    OpenDuty(job)
end)

RegisterNUICallback('duty', function(data, cb)
    TriggerServerEvent('renzu_jobs:duty',data.job,data.state)
    cb(true)
end)

function OpenDuty(job)
    SendNUIMessage({
        type = 'Duty',
        content = {duty = {job = PlayerData.job.name, off = config.Jobs[job]['duty'].offdutyname,jobname = job} ,logo = config.logo, img = config.inventoryImageUrl}
    })
    Wait(50)
    SetNuiFocus(true,true)
    SetNuiFocusKeepInput(false)
end

local markers = {}

function ShowFloatingHelpNotification(msg, coords)
    AddTextEntry('FloatingHelpNotification', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('FloatingHelpNotification')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

function DrawMarkerInput(vec,msg,event,server,name,job)
    if markers[name] == nil and not config.usePopui or markers[name] == nil and config.showmarker and config.usePopui then
        markers[name] = true
        CreateThread(function()
            cancel = false
            local ped = PlayerPedId()
            local coord = GetEntityCoords(ped)
            while #(vec - coord) <= 7 and not cancel and not setjob do
                Citizen.Wait(5)
                coord = GetEntityCoords(ped)
                if config.showmarker then
                    DrawMarker(22, vec ,0,0,0,0,0,1.0,1.0,1.0,1.0,255, 255, 220,200,0,0,0,1)
                end
                if not config.usePopui and #(vec - coord) < 1.5 then
                    ShowFloatingHelpNotification("Press [E] "..msg,vec)
                    if IsControlJustReleased(0,38) then
                        if not server then
                            TriggerEvent(event,name,job)
                        else
                            TriggerServerEvent(event,name,job)
                        end
                        Wait(100)
                        while #(vec - coord) < 3 and not cancel and not setjob do coord = GetEntityCoords(ped) Wait(100) end
                        markers[name] = nil
                        break
                    end
                end
            end
            markers[name] = nil
            return
        end)
    end
end

-- PUBLIC SHOPS && DUTY
Citizen.CreateThread(function()
    Wait(2000)
    while PlayerData == nil do Wait(10) end
	while true do
        local job = PlayerData.job.name
        local coord = GetEntityCoords(PlayerPedId())
        for k2,shop in pairs(config.Jobs) do
            if shop['shop'] then
                for k,v in ipairs(shop['shop']) do
                    local k = tonumber(k)
                    if v.public and #(GetEntityCoords(PlayerPedId()) - v.coord) < 7 or not v.public and #(GetEntityCoords(PlayerPedId()) - v.coord) < 7 and job == k2 then
                        shopindex = k
                        DrawMarkerInput(v.coord,v.label,v.event,false,'shop',k2)
                        if config.usePopui then
                            local dist = #(coord - v.coord)
                            if dist < 3 then
                                local table = {
                                    ['key'] = 'E', -- key
                                    ['event'] = 'renzu_jobs:openshop',
                                    ['title'] = 'Press [E] Open '..v.label,
                                    ['server_event'] = false, -- server event or client
                                    ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                    ['fa'] = '<i class="fal fa-store"></i>',
                                    ['custom_arg'] = {'shop',k2}, -- example: {1,2,3,4}
                                }
                                TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                                cancel = false
                                while dist < 3 and not cancel do
                                    coord = GetEntityCoords(PlayerPedId())
                                    dist = #(coord - v.coord)
                                    Wait(500)
                                end
                                TriggerEvent('renzu_popui:closeui')
                            end
                        end
                    end
                end
            end
            local v = shop
            if v['duty'] and #(GetEntityCoords(PlayerPedId()) - v['duty'].coord) < 7 and job == k2 or v['duty'] and #(GetEntityCoords(PlayerPedId()) - v['duty'].coord) < 7 and job == v['duty'].offdutyname then
                DrawMarkerInput(v['duty'].coord,v['duty'].label,v['duty'].event,false,'duty',k2)
                if config.usePopui then
                    local dist = #(coord - v['duty'].coord)
                    if dist < 3 then
                        local table = {
                            ['key'] = 'E', -- key
                            ['event'] = 'renzu_jobs:duty',
                            ['title'] = 'Press [E] Open '..v['duty'].label,
                            ['server_event'] = false, -- server event or client
                            ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                            ['fa'] = '<i class="fal fa-medal"></i>',
                            ['custom_arg'] = {'shop',k2}, -- example: {1,2,3,4}
                        }
                        TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                        cancel = false
                        while dist < 3 and not cancel do
                            coord = GetEntityCoords(PlayerPedId())
                            dist = #(coord - v['duty'].coord)
                            Wait(500)
                        end
                        TriggerEvent('renzu_popui:closeui')
                    end
                end
            end
        end
        Wait(1000)
    end
end)

-- JOB INTERACTIONS
Citizen.CreateThread(function()
    Wait(1000)
    while PlayerData == nil do Wait(10) end
	while true do
		Citizen.Wait(1000)
        local job = PlayerData.job.name
        local grade = PlayerData.job.grade
        local jobtable = config.Jobs[job]
        local coord = GetEntityCoords(PlayerPedId())
        local invehicle = IsPedInAnyVehicle(PlayerPedId())
        if jobtable ~= nil then
            for k,v in pairs(jobtable) do
                --print(k ~= 'max_salary' , not invehicle , jobtable[k] ~= nil , jobtable[k].coord ~= nil , jobtable[k].coord , coord , grade , jobtable[k].grade)
                if k ~= 'max_salary' and not invehicle and jobtable[k] ~= nil and jobtable[k].coord ~= nil and #(jobtable[k].coord - coord) < 7 and grade >= jobtable[k].grade then
                    DrawMarkerInput(jobtable[k].coord,jobtable[k].label,jobtable[k].event,false,k)
                elseif k == 'garage' and invehicle and jobtable[k] ~= nil and jobtable[k].spawn ~= nil and #(vector3(jobtable[k].spawn.x,jobtable[k].spawn.y,jobtable[k].spawn.z) - coord) < 7 and grade >= jobtable[k].grade then
                    DrawMarkerInput(vector3(jobtable[k].spawn.x,jobtable[k].spawn.y,jobtable[k].spawn.z),jobtable[k].label,jobtable[k].event,false,k)
                end
            end
            for k,v in pairs(jobtable['inventory']) do
                if k ~= 'max_salary' and v ~= nil and v.coord ~= nil and #(v.coord - coord) < 7 and grade >= v.grade then
                    DrawMarkerInput(v.coord,v.label,v.event,false,k)
                end
            end
            local boss_dist = #(coord - jobtable['bossmenu'].coord) -- boss menus
            --local inv = #(coord - jobtable['inventory'])
            if boss_dist < 3 and grade >= jobtable['bossmenu'].grade and config.usePopui then
                local table = {
                    ['key'] = 'E', -- key
                    ['event'] = 'renzu_jobs:openbossmenu',
                    ['title'] = 'Press [E] Open '..jobtable['bossmenu'].label,
                    ['server_event'] = false, -- server event or client
                    ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                    ['fa'] = '<i class="fas fa-archive"></i>',
                    ['custom_arg'] = {}, -- example: {1,2,3,4}
                }
                TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                cancel = false
                while boss_dist < 3 and not cancel do
                    coord = GetEntityCoords(PlayerPedId())
                    boss_dist = #(coord - jobtable['bossmenu'].coord)
                    Wait(500)
                end
                TriggerEvent('renzu_popui:closeui')
            end
            if jobtable['inventory'] and config.usePopui then
                for k,v in pairs(jobtable['inventory']) do -- inventario
                    if grade ~= nil and grade >= v.grade then
                        local dist = #(coord - v.coord)
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:openinventory',
                                ['title'] = 'Press [E] Open '..v.label,
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['fa'] = '<i class="fas fa-archive"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - v.coord)
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end

            if jobtable['weapon_armory'] and config.usePopui  then
                for k,v in pairs(jobtable['weapon_armory']) do -- weapon armory
                    if grade ~= nil and grade >= jobtable['weapon_armory']['grade'] then
                        local dist = #(coord - jobtable['weapon_armory']['coord'])
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:openweapons',
                                ['title'] = 'Press [E] Open '..jobtable['weapon_armory']['label'],
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['fa'] = '<i class="fal fa-swords"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - jobtable['weapon_armory']['coord'])
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end

            if jobtable['wardrobe'] and config.usePopui then
                for k,v in pairs(jobtable['wardrobe']) do -- wardrobe
                    if grade ~= nil and grade >= jobtable['wardrobe']['grade'] then
                        local dist = #(coord - jobtable['wardrobe'].coord)
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:openwardrobe',
                                ['title'] = 'Press [E] Open '..jobtable['wardrobe'].label,
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['fa'] = '<i class="fal fa-tshirt"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - jobtable['wardrobe'].coord)
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end

            if jobtable['garage'] and config.usePopui then
                for k,v in pairs(jobtable['garage']) do -- shop
                    if grade ~= nil and grade >= jobtable['garage']['grade'] then
                        local dist = #(coord - jobtable['garage'].coord)
                        if IsPedInAnyVehicle(PlayerPedId()) then
                            dist = #(coord - vector3(jobtable['garage'].spawn.x,jobtable['garage'].spawn.y,jobtable['garage'].spawn.z))
                        end
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:opengarage',
                                ['title'] = 'Press [E] Open '..jobtable['garage'].label,
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['invehicle_title'] = '[E] Store Vehicle', -- title to show instead of the ['title']
                                ['fa'] = '<i class="fal fa-garage"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - jobtable['garage'].coord)
                                if IsPedInAnyVehicle(PlayerPedId()) then
                                    dist = #(coord - vector3(jobtable['garage'].spawn.x,jobtable['garage'].spawn.y,jobtable['garage'].spawn.z))
                                end
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end

            if jobtable['vehicleshop'] and config.usePopui then
                for k,v in pairs(jobtable['vehicleshop']) do -- shop
                    if grade ~= nil and grade >= jobtable['vehicleshop']['grade'] then
                        local dist = #(coord - jobtable['vehicleshop'].coord)
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:openvehicleshop',
                                ['title'] = 'Press [E] Open '..jobtable['vehicleshop'].label,
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['invehicle_title'] = '[E] Store Vehicle', -- title to show instead of the ['title']
                                ['fa'] = '<i class="fal fa-car"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - jobtable['vehicleshop'].coord)
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end

            if jobtable['crafting'] and config.usePopui then
                for k,v in pairs(jobtable['crafting']) do -- shop
                    if grade ~= nil and grade >= jobtable['crafting']['grade'] then
                        local dist = #(coord - jobtable['crafting'].coord)
                        if dist < 3 then
                            local table = {
                                ['key'] = 'E', -- key
                                ['event'] = 'renzu_jobs:opencrafting',
                                ['title'] = 'Press [E] Open '..jobtable['crafting'].label,
                                ['server_event'] = false, -- server event or client
                                ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                                ['fa'] = '<i class="fal fa-tools"></i>',
                                ['custom_arg'] = {k}, -- example: {1,2,3,4}
                            }
                            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                            cancel = false
                            while dist < 3 and not cancel do
                                coord = GetEntityCoords(PlayerPedId())
                                dist = #(coord - jobtable['crafting'].coord)
                                Wait(500)
                            end
                            TriggerEvent('renzu_popui:closeui')
                        end
                    end
                end
            end
        end
	end
end)

RegisterNetEvent('renzu_jobs:openwardrobe')
AddEventHandler('renzu_jobs:openwardrobe', function(job)
	OpenClotheMenu(false,false,{
		'tshirt_1', 'tshirt_2',
		'torso_1', 'torso_2',
		'decals_1', 'decals_2',
		'arms',
		'pants_1', 'pants_2',
		'shoes_1', 'shoes_2',
        'bags_1', 'bags_2',
		'chain_1', 'chain_2',
		'helmet_1', 'helmet_2',
		'glasses_1', 'glasses_2'
	})
end)

local maxcolor = {}
local variantcache = {}
function OpenClotheMenu(submitCb, cancelCb, restrict) -- Credits: basecode esx_skin
    clothingopen = true
    local playerPed = PlayerPedId()
    confirm = false
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
    ESX.TriggerServerCallback("renzu_jobs:getPlayerWardrobe",function(data)
        TriggerEvent('skinchanger:getData', function(components, maxVals)
            local elements = {}
            local _components = {}

            -- Restrict menu
            if restrict == nil then
                for i=1, #components, 1 do
                    _components[i] = components[i]
                end
            else
                for i=1, #components, 1 do
                    local found = false

                    for j=1, #restrict, 1 do
                        if components[i].name == restrict[j] then
                            found = true
                        end
                    end

                    if found then
                        table.insert(_components, components[i])
                    end
                end
            end
            -- Insert elements
            for i=1, #_components, 1 do
                local value = _components[i].value
                local componentId = _components[i].componentId

                if componentId == 0 then
                    value = GetPedPropIndex(playerPed, _components[i].componentId)
                end

                local data = {
                    label = _components[i].label,
                    name = _components[i].name,
                    value = value,
                    min = _components[i].min,
                    textureof = _components[i].textureof,
                    zoomOffset= _components[i].zoomOffset,
                    camOffset = _components[i].camOffset,
                    type = 'slider'
                }
                variantcache[_components[i].name] = data
                for k,v in pairs(maxVals) do
                    maxcolor[k] = v
                    if k == _components[i].name then
                        data.max = v
                        break
                    end
                end

                table.insert(elements, data)
            end

            CreateSkinCam()
            zoomOffset = _components[1].zoomOffset
            camOffset = _components[1].camOffset
            clothes = data
            SendNUIMessage({
                type = 'Clothes',
                content = {wardrobe = data, clothe = elements ,logo = config.logo, img = config.inventoryImageUrl, maxcolor = maxcolor}
            })
            SetNuiFocus(true,true)
            SetNuiFocusKeepInput(true)
        end)
    end)
end

RegisterNUICallback('changeclothes', function(data, cb)
    local name = data.name:gsub("_id", "")
    TriggerEvent('skinchanger:change', tostring(name), tonumber(data.value))
    if string.find(name, "_1") then
        local re = name:gsub("_1", "_2")
        local maxVals = 0
        Wait(0)
        TriggerEvent('skinchanger:getData', function(comp, max)
            components, maxVals = comp, max
        end)
        Wait(0)
        TriggerEvent('skinchanger:change', tostring(re), 0)
        SendNUIMessage({
            type  = 'updateclothe',
            clothe = {name = re, max = maxVals[re]}
        })
    end
    camOffset = variantcache[name].camOffset
    zoomOffset = variantcache[name].zoomOffset
    cb(true)
end)

RegisterNUICallback('saveclothes', function(data, cb)
    local clothename = data.newclothe or data.overwriteold
    local currentskin = {}
    TriggerEvent('skinchanger:getSkin', function(getSkin) currentskin = getSkin end)
    Wait(500)
    ESX.TriggerServerCallback("renzu_jobs:saveclothes",function(a)
        confirm = a
        cb(a)
    end,clothename,currentskin)
    cb(true)
end)

RegisterNUICallback('selectclothes', function(data, cb)
    if clothes[data.name] ~= nil then
        confirm = true
        TriggerEvent('skinchanger:loadSkin', clothes[data.name])
        ESX.TriggerServerCallback("renzu_jobs:selectclothe",function(a)
        end,clothes[data.name])
        cb(true)
    end
end)

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end

    local playerPed = PlayerPedId()

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)

    isCameraActive = true
    SetCamCoord(cam, GetEntityCoords(playerPed))
    SetCamRot(cam, 0.0, 0.0, 270.0, true)
    SetEntityHeading(playerPed, 0.0)

    Citizen.CreateThread(function()
        while isCameraActive do
            DisableControlAction(2, 30, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(2, 33, true)
            DisableControlAction(2, 34, true)
            DisableControlAction(2, 35, true)
            DisableControlAction(0, 25, true) -- Input Aim
            DisableControlAction(0, 24, true) -- Input Attack
            DisableControlAction(0, 177, true) -- ESC
            DisableControlAction(0, 200, true) -- ESC
            DisableControlAction(0, 245, true) -- T
            --ESX.ShowHelpNotification('use ~INPUT_VEH_FLY_ROLL_LEFT_ONLY~ and ~INPUT_VEH_FLY_ROLL_RIGHT_ONLY~ to rotate the view.')
            Wait(0)
        end
        return
    end)

    Citizen.CreateThread(function()
        Citizen.CreateThread(function()
            local sound = true
            while isCameraActive do
                ESX.ShowHelpNotification('use ~INPUT_VEH_FLY_ROLL_LEFT_ONLY~ and ~INPUT_VEH_FLY_ROLL_RIGHT_ONLY~ to rotate the view.',false,sound,5000)
                Wait(5000)
                sound = false
            end
            return
        end)
        while isCameraActive do
            Citizen.Wait(100)
    
            if isCameraActive then
                local playerPed = PlayerPedId()
                local coords    = GetEntityCoords(playerPed)
    
                local angle = heading * math.pi / 180.0
                local theta = {
                    x = math.cos(angle),
                    y = math.sin(angle)
                }
    
                local pos = {
                    x = coords.x + (zoomOffset * theta.x),
                    y = coords.y + (zoomOffset * theta.y)
                }
    
                local angleToLook = heading - 140.0
                if angleToLook > 360 then
                    angleToLook = angleToLook - 360
                elseif angleToLook < 0 then
                    angleToLook = angleToLook + 360
                end
    
                angleToLook = angleToLook * math.pi / 180.0
                local thetaToLook = {
                    x = math.cos(angleToLook),
                    y = math.sin(angleToLook)
                }
    
                local posToLook = {
                    x = coords.x + (zoomOffset * thetaToLook.x),
                    y = coords.y + (zoomOffset * thetaToLook.y)
                }
    
                SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
                PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
            end
        end
        return
    end)
    
    Citizen.CreateThread(function()
        local angle = 90
    
        while isCameraActive do
            Citizen.Wait(4)
    
            if isCameraActive then
                if IsControlPressed(0, 108) then
                    angle = angle - 1
                elseif IsControlPressed(0, 109) then
                    angle = angle + 1
                end
    
                if angle > 360 then
                    angle = angle - 360
                elseif angle < 0 then
                    angle = angle + 360
                end
    
                heading = angle + 0.0
            else
                Citizen.Wait(500)
            end
        end
        return
    end)
end

function DeleteSkinCam()
    isCameraActive = false
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    --cam = nil why need to remove cam? disable it only, or else you will have a buggy cam later,  cam index -1
end



function classlist(class)
    if class == '0' then
        name = 'Compacts'
    elseif class == '1' then
        name = 'Sedans'
    elseif class == '2' then
        name = 'SUV'
    elseif class == '3' then
        name = 'Coupes'
    elseif class == '4' then
        name = 'Muscle'
    elseif class == '5' then
        name = 'Sports Classic'
    elseif class == '6' then
        name = 'Sports'
    elseif class == '7' then
        name = 'Super'
    elseif class == '8' then
        name = 'Motorcycles'
    elseif class == '9' then
        name = 'Offroad'
    elseif class == '10' then
        name = 'Industrial'
    elseif class == '11' then
        name = 'Utility'
    elseif class == '12' then
        name = 'Vans'
    elseif class == '13' then
        name = 'Cycles'
    elseif class == '14' then
        name = 'Boats'
    elseif class == '15' then
        name = 'Helicopters'
    elseif class == '16' then
        name = 'Planes'
    elseif class == '17' then
        name = 'Service'
    elseif class == '18' then
        name = 'Emergency'
    elseif class == '19' then
        name = 'Military'
    elseif class == '20' then
        name = 'Commercial'
    elseif class == '21' then
        name = 'Trains'
    else
        name = 'CAR'
    end
    return name
end

function GetVehicleClassnamemodel(vehicle)
    local class = tostring(GetVehicleClassFromName(vehicle))
    return classlist(class)
end