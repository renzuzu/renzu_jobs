ESX = exports['es_extended']:getSharedObject()
local open = false
local loaded = false
PlayerData = {}
inv_type = nil
cancel = true
clothingopen = false
local setjob = false
local lastSkin, cam, isCameraActive
local firstSpawn, zoomOffset, camOffset, heading, skinLoaded = true, 0.0, 0.0, 90.0, false
local clothes = {}
shopindex = 1
Citizen.CreateThread(function()
    Wait(111)
    local conf = lib.callback.await('renzu_jobs:getConfig', false)
    config = conf
    config.success = true
    Wait(2000)
    PlayerData = ESX.GetPlayerData()
    CreateJobThreads()
end)

RegisterNetEvent('esx:setJob', function(job)
	PlayerData.job = job
    if config.Oxlib then
        CreateJobThreads()
    end
    setjob = true
    Wait(2000)
    setjob = false
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    playerloaded = true
    if config.Oxlib then
        CreateJobThreads()
    end
end)

local playercache = {}
function OpenBossMenu()
    lib.callback("renzu_jobs:playerlist", false, function(data,count,admin,myimage,myjob,jobmoney,jobdata,online)
        playercache = data
        SendNUIMessage({
            type = 'show',
            content = {money = jobmoney, myjob = myjob, jobdata = jobdata, players = data, logo = config.logo, online = online}
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
    if config.useOxInventory then
        local stash = lib.callback.await('renzu_jobs:AddStash', false, job, type)
        if type == 'Personal' then
            type = PlayerData.identifier
        end
        TriggerEvent('ox_inventory:openInventory', 'stash', {id = ''..job..'_'..type..'', name = ''..job..'_'..type..'', slots = 70, weight = 1000000, coords = GetEntityCoords(cache.ped)})
    else
        lib.callback('renzu_jobs:getPlayerInventory', false, function(inventory)
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
end

function OpenWeaponMenu()
    local configweapon = Config.Weapons
    --if Weapons[PlayerData.job.name] == nil then print("JOB IS NOT REGISTER TO weaponconfig.lua") end
    for k,v in pairs(configweapon) do
        if Weapons[PlayerData.job.name] ~= nil and Weapons[PlayerData.job.name][v.name] then
            v.mingrade = Weapons[PlayerData.job.name][v.name].mingrade
        end
    end
    local weapons = {}
    lib.callback('renzu_jobs:getPlayerWeapons', false, function(weapon)
        local weapon = weapon
        for k,v in pairs(configweapon) do
            v.owned = false
            v.name = k
            local components = {}
            if PlayerData.job.grade and Weapons[PlayerData.job.name] and Weapons[PlayerData.job.name][k] and Weapons[PlayerData.job.name][k].mingrade <= PlayerData.job.grade then
                for k2,v2 in pairs(weapon) do
                    if v2.name == k then
                        v.owned = true
                        v.slot = v2.slot
                        v.install_components = {}
                        for k3,v3 in pairs(Config.Components) do
                            if v3.client then
                                for k,v4 in pairs(v3.client.component) do
                                    if DoesWeaponTakeWeaponComponent(GetHashKey(v.name), v4) then
                                        v.install_components[v4] = true
                                        if not components[k3] then
                                            components[k3] = {}
                                        end
                                        components[k3].name = k3
                                        components[k3].label = v3.label
                                    end
                                end
                            end
                        end
                    end
                end
                weapons[k] = v
                weapons[k].components = components
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

RegisterNetEvent('renzu_jobs:openweapons', function(job)
	OpenWeaponMenu()
end)

RegisterNetEvent('renzu_jobs:opengarage', function(job)
    if IsPedInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped)
        local plate = GetVehicleNumberPlateText(vehicle)
        local prop = ESX.Game.GetVehicleProperties(vehicle)
        lib.callback("renzu_jobs:storevehicle", false, function(a)
            SetNuiFocus(false,false)
            SetNuiFocusKeepInput(false)
            TaskLeaveVehicle(cache.ped,GetVehiclePedIsIn(cache.ped),1)
            Wait(2000)
            CheckWanderingVehicle(plate)
            cancel = true
        end,plate,prop)
    else
	    OpenGarage()
    end
end)

function OpenGarage()
    local job = PlayerData.job.name
    lib.callback("renzu_jobs:getvehicles", false, function(data,vehiclesdb)
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

RegisterNetEvent('renzu_jobs:openvehicleshop', function()
    OpenVehicleShop()
end)

RegisterNUICallback('buyvehicle', function(data, cb)
    lib.callback("renzu_jobs:buyvehicle", false, function(a)
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
    lib.callback("renzu_jobs:returnvehicle", false, function(a)
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
    lib.callback("renzu_jobs:takeoutvehicle", false, function(a)
        local coord = config.Jobs[job]['garage']['spawn']
        SetNuiFocus(false,false)
        SetNuiFocusKeepInput(false)
        local props = data.prop
        CheckWanderingVehicle(data.plate)
        Wait(100)
        local hash = tonumber(props.model)
        local count = 0
        lib.requestModel(hash)
        v = CreateVehicle(hash,vector3(coord.x,coord.y,coord.z), coord.w, 1, 1)
        ESX.Game.SetVehicleProperties(v, data.prop)
        NetworkFadeInEntity(v,1)
        TaskWarpPedIntoVehicle(cache.ped, v, -1)
    end,data.plate)
end

RegisterNUICallback('spawnvehicle', function(data, cb)
    SpawnVehicle(data)
    cb(true)
end)



RegisterNetEvent('renzu_jobs:openshop', function(shop,job,public,shopindex)
	OpenShop(shop,job,public,shopindex)
end)

local currentshop = nil
function OpenShop(shop,job,public,shopindex)
    if public and #(GetEntityCoords(cache.ped) - config.Jobs[job]['shop'][shopindex].coord) < 3 or not public and #(GetEntityCoords(cache.ped) - config.Jobs[job]['shop'][shopindex].coord) < 3 and job == PlayerData.job.name then
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
end

RegisterNUICallback('buyitem', function(data, cb)
    lib.callback("renzu_jobs:buyitem", false, function(a)
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
    lib.callback("renzu_jobs:kick", false, function(a)
        cb(a)
    end,data.id)
    cb(true)
end)

RegisterNUICallback('getweapon', function(data, cb)
    lib.callback("renzu_jobs:getweapon", false, function(a)
        OpenWeaponMenu()
        cb(a)
    end,data.weapon)
end)

RegisterNUICallback('setcomponents', function(data, cb)
    local weapon = GetSelectedPedWeapon(cache.ped)
    print(weapon)
    if weapon ~= GetHashKey(data.weapon) then
        exports.ox_inventory:useSlot(tonumber(data.slot))
        Wait(1000)
    end
    local componenthash = nil
    local components = Config.Components[data.component] and Config.Components[data.component].client.component
    for k,v4 in pairs(components) do
        if DoesWeaponTakeWeaponComponent(GetHashKey(data.weapon), v4) then
            componenthash = v4
        end
    end
    local t = {hash = componenthash, name = data.component}
    lib.callback("renzu_jobs:setweaponcomponents", false, function(a)
        --OpenWeaponMenu()
        print(data.slot)
        cb(a)
    end,data.weapon,t,data.slot)
    print(data.weapon,t,data.slot,data.component,componenthash, type(t))
end)

RegisterNUICallback('changesalary', function(data, cb)
    local grade = data.grade
    local amount = data.amount
    lib.callback("renzu_jobs:changesalary", false, function(a)
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
    lib.callback("renzu_jobs:sendbonus", false, function(a)
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
    lib.callback("renzu_jobs:itemfunc", false, function(a)
        local job = PlayerData.job.name
        OpenInventory(job,inv_type)
        cb(a)
    end,type,amount,item,inv_type,slot)
end)

RegisterNUICallback('withdraw_deposit', function(data, cb)
    local type = data.type
    local amount = data.amount
    local money_type = data.money_type
    lib.callback("renzu_jobs:withdraw_deposit", false, function(a)
        cb(a)
    end,type,amount,money_type)
end)

RegisterNetEvent('renzu_jobs:updatemoney', function(data)
    SendNUIMessage({
        type  = 'update',
        data = data
    })
end)

RegisterNetEvent('renzu_jobs:openinventory', function(type)
    local job = PlayerData.job.name
    OpenInventory(job,type)
end)

RegisterNetEvent('renzu_jobs:openbossmenu', function()
    local grade = PlayerData.job.grade
    OpenBossMenu(grade)
end)

RegisterNUICallback('setjob', function(data, cb)
    lib.callback("renzu_jobs:setjob", false, function(a)
        cb(a)
    end,data.grade,data.id)
    close()
end)

RegisterNetEvent('renzu_jobs:opencrafting', function(type)
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
    lib.callback("renzu_jobs:craftitem", false, function(a)
        cb(a)
    end,data.item,data.amount,data.type)
end)

RegisterNetEvent('renzu_jobs:duty', function(name,job,offduty)
    if job == PlayerData.job.name or PlayerData.job.name == offduty then
        OpenDuty(job,offduty)
    end
end)

RegisterNUICallback('duty', function(data, cb)
    TriggerServerEvent('renzu_jobs:duty',data.job,data.state)
    cb(true)
end)

function OpenDuty(job,offduty)
    SendNUIMessage({
        type = 'Duty',
        content = {duty = {job = PlayerData.job.name, off = config.Jobs[job]['duty'].offdutyname,jobname = job} ,logo = config.logo, img = config.inventoryImageUrl}
    })
    Wait(50)
    SetNuiFocus(true,true)
    SetNuiFocusKeepInput(false)
end

local markers = {}

OxlibTextUi = function(msg)
	lib.showTextUI(msg, {
		position = "left-center",
		icon = 'car',
		style = {
			borderRadius = 5,
			backgroundColor = '#212121',
			color = 'white'
		}
	})
end

JobZone = {}
JobZone.Spheres = {}
JobZone.__index = {}
JobZone.Add = function(coord,msg,event,server,var,job)
	if not config.Oxlib then return end
	function onEnter(self)
		CreateThread(function() -- create thread to suport multi zones
			local self = self
			local msg = msg
            OxlibTextUi("Press [E] "..msg)
		end)
    end
    
    function onExit(self)
        lib.hideTextUI()
    end

    function inside()
        if IsControlJustReleased(0,38) then
            if server then
                TriggerServerEvent(event,table.unpack(var))
            else
                TriggerEvent(event,table.unpack(var))
            end
        end
    end

    local sphere = lib.zones.sphere({ coords = coord, radius = dist or 2, debug = false, inside = inside, onEnter = onEnter, onExit = onExit })
    table.insert(JobZone.Spheres,sphere)
end

RegisterNetEvent('renzu_jobs:washroom', function(string)
	DoScreenFadeOut(500)
    print(string,'gago')
    Wait(1000)
    SetEntityCoords(cache.ped,config.moneywashcoord[string])
    Wait(500)
    while not HasCollisionLoadedAroundEntity(cache.ped) do Wait(0) end
    DoScreenFadeIn(500)
end)

RegisterNetEvent('renzu_jobs:moneywash', function(id)
    currentwash = id
    if not config.MoneyWash[id].inuse then
        lib.callback("renzu_jobs:getBlackMoney", false, function(blackmoney)
            SendNUIMessage({
                type = 'Wash',
                content = {wash = blackmoney}
            })
            SetNuiFocus(true,true)
        end)
    end
end)

RegisterNUICallback('moneywash', function(data, cb)
    lib.callback("renzu_jobs:washmoney", false, function(a)
        if a == true then
            TriggerEvent('renzu_notify:Notify', 'info','Customs', 'Money is being Washed')
            SetNuiFocus(false,false)
            cb(a)
        elseif a == 'notenough' then
            SetNuiFocus(true,true)
            cb(false)
        else
            TriggerEvent('renzu_notify:Notify', 'error','Customs', 'Machine already in use')
            SetNuiFocus(false,false)
            cb(a)
        end
    end,data.amount,currentwash)
end)

RegisterNetEvent('renzu_jobs:washuse', function(id, bool)
    config.MoneyWash[id].inuse = bool
    if bool then
        Citizen.CreateThread(function()
            local count = 0
            while count < 60 do
                count = count + 1
                print(count)
                Wait(1000)
            end
        end)
    end
end)

-- JOB INTERACTIONS

CreateJobThreads = function()
    Wait(1000)
    if PlayerData.job == nil then return end
    for k,v in pairs(JobZone.Spheres) do
        v:remove()
    end
    local job = PlayerData.job.name
    local grade = PlayerData.job.grade
    local jobtable = config.Jobs[job]
    local coord = GetEntityCoords(cache.ped)
    local invehicle = IsPedInAnyVehicle(cache.ped)
    if jobtable ~= nil then
        for k,v in pairs(jobtable) do
            --print(k ~= 'max_salary' , not invehicle , jobtable[k] ~= nil , jobtable[k].coord ~= nil , jobtable[k].coord , coord , grade , jobtable[k].grade)
            if k ~= 'public_inventory' and k ~= 'max_salary' and not invehicle and jobtable[k] ~= nil and jobtable[k].coord ~= nil and grade >= jobtable[k].grade then
                JobZone.Add(jobtable[k].coord,jobtable[k].label,jobtable[k].event,false,{k})
            elseif k ~= 'public_inventory' and k == 'garage' and invehicle and jobtable[k] ~= nil and jobtable[k].spawn ~= nil and grade >= jobtable[k].grade then
                JobZone.Add(vector3(jobtable[k].spawn.x,jobtable[k].spawn.y,jobtable[k].spawn.z),jobtable[k].label,jobtable[k].event,false,{k})
            end
        end
        for k,v in pairs(jobtable['inventory']) do
            if k ~= 'max_salary' and v ~= nil and v.coord ~= nil and grade >= v.grade then
                JobZone.Add(v.coord,v.label,v.event,false,{k})
            end
        end
    end

    -- PUBLIC Zones

    for k2,data in pairs(config.Jobs) do
        if data['public_inventory'] then
            for k,v in pairs(data['public_inventory']) do
                JobZone.Add(v.coord,v.label,v.event,false,{k,k2})
            end
        end
        if data['shop'] then
            for k,v in ipairs(data['shop']) do
                JobZone.Add(v.coord,v.label,v.event,false,{'shop',k2,v.public,k})
            end
        end
        if data['duty'] then
            JobZone.Add(data['duty'].coord,data['duty'].label,data['duty'].event,false,{'duty',k2,data['duty'].offdutyname})
        end
        for k,v in pairs(config.moneywashcoord) do
            local ent = config.moneywashcoord['entrance']
            local ex = config.moneywashcoord['exit']
            if k == 'entrance' then
                JobZone.Add(ent,'Enter Washroom','renzu_jobs:washroom',false,{'exit'})
            elseif k == 'exit' then
                JobZone.Add(ex,'Enter Washroom','renzu_jobs:washroom',false,{'entrance'})
            end
        end
        for k,v in pairs(config.MoneyWash) do
            JobZone.Add(vector3(v.coord.x,v.coord.y,v.coord.z),'Wash Money','renzu_jobs:moneywash',false,{k})
        end
    end
end

RegisterNetEvent('renzu_jobs:openwardrobe', function(job)
    if config.renzu_Clothes then
        exports.renzu_clothes:OpenClotheInventory()
    else
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
    end
end)

local maxcolor = {}
local variantcache = {}
function OpenClotheMenu(submitCb, cancelCb, restrict) -- Credits: basecode esx_skin
    clothingopen = true
    local playerPed = cache.ped
    confirm = false
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
    lib.callback("renzu_jobs:getPlayerWardrobe", false, function(data)
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
    lib.callback("renzu_jobs:saveclothes", false, function(a)
        confirm = a
        cb(a)
    end,clothename,currentskin)
    cb(true)
end)

RegisterNUICallback('selectclothes', function(data, cb)
    if clothes[data.name] ~= nil then
        confirm = true
        TriggerEvent('skinchanger:loadSkin', clothes[data.name])
        lib.callback("renzu_jobs:selectclothe", false, function(a)
        end,clothes[data.name])
        cb(true)
    end
end)

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end

    local playerPed = cache.ped

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
                local playerPed = cache.ped
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

function OxMenuInteraction()
    local firstmenu = {}
    local tablenum = {}
    if config.Jobs[PlayerData.job.name] and config.Jobs[PlayerData.job.name]['interaction'] then
        for k2,v in pairs(config.Jobs[PlayerData.job.name]['interaction']) do
            for k,v in pairs(v) do
                if not tablenum[k2] then
                    tablenum[k2] = 0
                end
                tablenum[k2] = tablenum[k2] + 1
            end
        end
    end
    --if c > 0 then
        for title,data in pairs(config.Jobs[PlayerData.job.name]['interaction']) do
            local hasmenu = false
            local menus = {}
            if tablenum[title] and tablenum[title] > 0 then
                table.insert(firstmenu,{label = title, description = 'Enter to See All Interactions', args = {event = 'gago', server = false, val = title, }, icon = title == 'Citizen Interaction' and 'people-arrows' or 'car'})
                for k,v in pairs(data) do
                    local title = config[v.type][v.index].label
                    local event = config[v.type][v.index].name
                    local icon = config[v.type][v.index].icons
                    print(icon)
                    hasmenu = true
                    table.insert(menus,{label = title, description = config[v.type][v.index].description, args = {event = event, server = false, val = 'ulol'},  icon = icon})
                end
            end
            if hasmenu then
                lib.registerMenu({
                    id = title,
                    title = title,
                    position = 'top-right',
                    disableInput = false,
                    onSideScroll = function(selected, scrollIndex, args)
                        print(selected, scrollIndex, args)
                    end,
                    onSelected = function(selected, scrollIndex, args)
                        print(selected, scrollIndex, args,2)
                    end,
                    onClose = function()
                        print('Menu closed')
                        lib.showMenu('some_menu_id')
                    end,
                    options = menus
                }, function(selected, scrollIndex, args)
                    TriggerEvent(args.event,args.val)
                    print(selected, scrollIndex, args,'entered')
                end)
            end
        end
        if firstmenu[1] then
            lib.registerMenu({
                id = 'oxmenu',
                title = 'Interactions',
            position = 'top-right',
            disableInput = false,
                onSideScroll = function(selected, scrollIndex, args)
                    print(selected, scrollIndex, args)
                end,
                onSelected = function(selected, scrollIndex, args)
                    print(selected, scrollIndex, args,2)
                end,
                onClose = function()
                    print('Menu closed')
                end,
                options = firstmenu
            }, function(selected, scrollIndex, args)
                --TriggerEvent(args.event,args.val)
                lib.showMenu(args.val)
                print(selected, scrollIndex, args,'entered')
            end)
            lib.showMenu('oxmenu')
        end
    --end
end

Citizen.CreateThread(function()
    while not config.success do Wait(1) end
    RegisterKeyMapping(config.commands, 'Interaction Menu', 'keyboard', config.keybinds)
    RegisterCommand(config.commands, function(source, args, rawCommand)
        OxMenuInteraction()
    end)
end)