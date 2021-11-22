RegisterNetEvent('convertitem')
AddEventHandler('convertitem', function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(data.item)
	if item.count >= data.count then
		print(Plugins.Job[xPlayer.job.name].Convert[data.item])
		if Plugins.Job[xPlayer.job.name].Convert[data.item] then
			xPlayer.addInventoryItem(Plugins.Job[xPlayer.job.name].Convert[data.item],1,'Heated Buns')
			xPlayer.removeInventoryItem(data.item,1)
		end
	end
end)

ESX.RegisterServerCallback('haveitem',function(source, cb, data)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(data.item)
	cb(item.count >= data.count)
end)

ESX.RegisterServerCallback('haveitems',function(source, cb, data)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local have_ingredients = true
	local missing = ''
	for k,v in pairs(data) do
		local item = xPlayer.getInventoryItem(k)
		if item.count < v.count then
			have_ingredients = false
			missing = v.label
			break
		end
	end
	if not have_ingredients then
		TriggerClientEvent('renzu_notify:Notify', source, 'warning','Cook', 'Missing one of Ingredients '..missing)
	end
	cb(have_ingredients)
end)

RegisterNetEvent('convert_to_meal')
AddEventHandler('convert_to_meal', function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	local c = 0
	for k,v in pairs(data.data) do c = c + 1 end
	local toadd = 0
	local itemname = nil
	local missing = ''
	for k,v in pairs(data.data) do
		local item = xPlayer.getInventoryItem(k)
		if item.count >= v.count then
			toadd = toadd + 1
			itemname = data.meal
			missing = v.label
		end
	end
	if c == toadd then
		for k,v in pairs(data.data) do
			xPlayer.removeInventoryItem(k,1)
		end
		xPlayer.addInventoryItem(itemname,1,'Meal')
	else
		TriggerClientEvent('renzu_notify:Notify', source, 'warning','Cook', 'Missing one of Ingredients '..missing)
	end
end)