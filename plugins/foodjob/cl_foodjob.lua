Citizen.CreateThread(function()
    Wait(2000)
    while PlayerData.job == nil do Wait(10) end

	while Plugins.EnableFoodjob do
		local job = PlayerData.job.name
        local coord = GetEntityCoords(PlayerPedId())
		if Plugins.Job[job] and Plugins.Job[job].Tasks then
			for k,v in pairs(Plugins.Job[job].Tasks) do
				if #(GetEntityCoords(PlayerPedId()) - vector3(v.coord.x,v.coord.y,v.coord.z)) < 1.2 then
					DrawMarkerInput(vector3(v.coord.x,v.coord.y,v.coord.z),v.label,v.event,false,v.require,k,1.2,true)
				end
			end
		end
		Wait(1000)
	end
end)

RegisterNetEvent('tasks')
AddEventHandler('tasks', function(data)
	local player = PlayerPedId()
	ESX.TriggerServerCallback("haveitem",function(ret)
        if ret then
			ExecuteCommand('e '..data.command)
			local ret = exports.renzu_lockgame:CreateGame(3,{},true)
			if ret then
				TriggerServerEvent('convertitem',data)
			end
			setjob = true
			cancel = true
			Wait(1000)
			setjob = false
		end
    end,data)
end)

Citizen.CreateThread(function()
    Wait(2000)
    while PlayerData.job == nil do Wait(10) end

	while Plugins.EnableFoodjob do
		local job = PlayerData.job.name
        local coord = GetEntityCoords(PlayerPedId())
		if Plugins.Job[job] and Plugins.Job[job].Proccess then
			for k,v in pairs(Plugins.Job[job].Proccess) do
				if #(GetEntityCoords(PlayerPedId()) - vector3(v.coord.x,v.coord.y,v.coord.z)) <= 1.2 then
					DrawMarkerInput(vector3(v.coord.x,v.coord.y,v.coord.z),v.label,v.event,false,{},k,1.2,true)
				end
			end
		end
		Wait(1000)
	end
end)

function Ingredients(data)
	local text = ''
	for k,v in pairs(data) do
		text = text.. v.count..'x - '..v.label..', '
	end
	return text
end

RegisterNetEvent('openrecipes')
AddEventHandler('openrecipes', function()
	local job = PlayerData.job.name
	local multimenu = {}
    local firstmenu = {}
    local openmenu = false
	for k,v in pairs(Plugins.Job[job].Recipes) do
		if multimenu[v.label] == nil then multimenu[v.label] = {} end
		multimenu[v.label][v.label] = {
			['title'] = v.label..' Ingredients: <br> <span style="font-size:12px; margin-top:2px;">'..Ingredients(v.ingredients)..'</span>',
			['fa'] = '<i class="fad fa-hat-chef"></i>',
			['type'] = 'event', -- event / export
			['content'] = 'proccess',
			['variables'] = {
				server = false, 
				send_entity = false, 
				onclickcloseui = true, 
				custom_arg = {meal = k, data = v.ingredients, command = 'mechanic'}, 
				arg_unpack = false
			},
		}
		openmenu = true
	end
	if openmenu then
		TriggerEvent('renzu_contextmenu:insertmulti',multimenu,"Open Recipes",false,"<i class='fad fa-hat-chef'></i> Recipes")
		TriggerEvent('renzu_contextmenu:show')
	end
end)

RegisterNetEvent('proccess')
AddEventHandler('proccess', function(data)
	local player = PlayerPedId()
	ESX.TriggerServerCallback("haveitems",function(ret)
        if ret then
			ExecuteCommand('e '..data.command)
			local ret = exports.renzu_lockgame:CreateGame(3,{},true)
			if ret then
				TriggerServerEvent('convert_to_meal',data)
			end
			setjob = true
			cancel = true
			Wait(1000)
			setjob = false
		end
    end,data.data)
end)