--- https://github.com/esx-framework/esx-legacy/blob/main/%5Besx_addons%5D/esx_policejob/client/main.lua COPYRIGHT
RegisterNetEvent('cuff')
AddEventHandler('cuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('cuff', target)
	else
		print(('esx_policejob: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
	end
end)