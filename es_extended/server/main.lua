--
-- Add this to es_extended/server/main.lua
-- THIS is Optional if you want to refresh jobs after adding via ingame admin commands
-- else without adding this, you can just restart the whole server for the new jobs to applied

RegisterNetEvent('esx:updatejobs')
AddEventHandler('esx:updatejobs', function(src,jobs)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if source == '' or source == nil then source = 0 end
	if source == 0 and xPlayer.getGroup() == 'superadmin' or source == 0 and xPlayer.getGroup() == 'admin' then
		ESX.Jobs = jobs
		ESX.RefreshJobs()
		print('[^2INFO^7] ESX ^5Legacy^0 Job Refreshed')
	end
end)