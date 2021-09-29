
--- https://github.com/jonassvensson4/jsfour-idcard COPYRIGHT
-- TriggerServerEvent('cuff', GetPlayerServerId(closestPlayer))
RegisterNetEvent('checkid')
AddEventHandler('checkid', function(current)
    local multimenu = {}
    local firstmenu = {}
    local openmenu = false
	local elements = {
		{label = 'Check your ID', value = 'checkID'},
		{label = 'Show your ID', value = 'showID'},
		{label = 'Check your driver license', value = 'checkDriver'},
		{label = 'Show your driver license', value = 'showDriver'},
		{label = 'Check your firearms license', value = 'checkFirearms'},
		{label = 'Show your firearms license', value = 'showFirearms'},
	}
	for i,t in ipairs(elements) do
		if multimenu['checkid'] == nil then multimenu['checkid'] = {} end
		multimenu['checkid'][t.value] = {
			['title'] = t.label:upper(),
			['fa'] = '<i class="fad fa-id-card"></i>',
			['type'] = 'event', -- event / export
			['content'] = 'showid',
			['variables'] = {server = false, send_entity = false, onclickcloseui = true, custom_arg = {t.value}, arg_unpack = true},
		}
		openmenu = true
	end
	if openmenu then
		TriggerEvent('renzu_contextmenu:close')
		Wait(200)
		TriggerEvent('renzu_contextmenu:insertmulti',multimenu,"Check ID",false,"<i class='fas fa-id-card'></i> Check ID")
		TriggerEvent('renzu_contextmenu:show')
	end
end)

RegisterNetEvent('showid')
AddEventHandler('showid', function(val)
	print(val)
	if val == 'checkID' then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
	elseif val == 'checkDriver' then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
	elseif val == 'checkFirearms' then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
	else
		local player, distance = ESX.Game.GetClosestPlayer()
		
		if distance ~= -1 and distance <= 3.0 then
			if val == 'showID' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
			elseif val == 'showDriver' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
			elseif val == 'showFirearms' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
			end
		else
		  ESX.ShowNotification('No players nearby')
		end
	end
end)