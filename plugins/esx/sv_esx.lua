-- OVERIDE some esx function for backward compatibility using ox_inventory
DoesPlayerHaveItem = function(item,src)
	local hasitem = false
	local data = exports.ox_inventory:Search(src, 'slots', item)
    if data then
        for k,v in pairs(data) do
            hasitem = true
        end
    end
	return hasitem
end

DoesItemHasMetaDatas = function(item,value,slot,src,weapon)
	local hasmeta = false
	local data = exports.ox_inventory:Search(src, 'slots', item:lower())
    if data then
        for k,v in pairs(data) do
			if not weapon then
				if v.slot == slot and v.metadata.components then
					for k,v in pairs(v.metadata.components) do
						if value == v then
							hasmeta = true
						end
					end
				end
			else
				for k,v in pairs(data) do
					for k,v in pairs(v) do
						if value == v then
							hasmeta = true
						end
					end
				end
			end
        end
    end
	return hasmeta
end

SetItemMetaData = function(item,meta,value,slot,src)
	local data = exports.ox_inventory:Search(src, 'slots', item:lower())
	for k, v in pairs(data) do
		for k,v in pairs(v) do
			if v.slot == tonumber(slot) then
				data = v
			end
		end
	end
	if not data.metadata[meta] then data.metadata[meta] = {} end
	data.metadata[meta] = value
	exports.ox_inventory:SetMetadata(src, data.slot, data.metadata)
end

GetItemMetaData = function(item,meta,slot,src)
	local data = exports.ox_inventory:Search(src, 'slots', item:lower())
	if data then
		for k, v in pairs(data) do
			for k,v in pairs(v) do
				data = v
			end
		end
	end
	return data.metadata[meta] or {}
end

GetPlayerFromIdentifier = function(identifier)
	local self = ESX.GetPlayerFromIdentifier(identifier)
	return self and GetPlayerFromId(self.source)
end

GetPlayerFromId = function(src)
	local self = ESX.GetPlayerFromId(src)
	if self.hasWeapon == nil then
		self.hasWeapon = function(weapon)
			return DoesPlayerHaveItem(weapon,src)
		end
	end
	self.addWeaponComponent = function(weapon, components, slot)
		local weapon = weapon
		local components = components
		local slot = slot
		local data = GetItemMetaData(weapon,'components',slot,src)
		local add = true
		if data then
			for k,v in pairs(data) do
				if v == components.name then
					add = false
				end
			end
		end
		if add then
			table.insert(data,components.name)
			SetItemMetaData(weapon,'components',data,slot,src)
			GiveWeaponComponentToPed(GetPlayerPed(self.source), weapon, components.hash)
		end
	end
	self.hasWeaponComponent = function(weapon, components, slot)
		return DoesItemHasMetaDatas(weapon, components, slot, src, true)
	end
	self.removeWeaponComponent = function(weapon, components, slot)
		local weapon = weapon
		local components = components
		local slot = slot
		-- trigger client native weapon remove component?
		local data = GetItemMetaData(weapon,'components',slot,src)
		local add = false
		local newdata = {}
		if data then
			for k,v in pairs(data) do
				if v == components.name then
					add = true
					data[k] = nil
				end
			end
		end
		if add then
			for k,v in pairs(data) do
				table.insert(newdata,v)
			end
			SetItemMetaData(weapon,'components',newdata,slot,src)
			RemoveWeaponComponentFromPed(GetPlayerPed(self.source), weapon, components.hash)
		end
	end
	self.getLoadout = function()
		local items = self.getInventory()
		local weapons = {}
		for k,v in pairs(items) do
			if string.find(v.name:upper(), "WEAPON_") then
				weapons[v.name] = v
			end
		end
		return weapons
	end
	self.addWeapon = function(weapon,ammo)
		exports.ox_inventory:AddItem(src,weapon:lower(),1,nil, false, function(success, data)
			print(data.slot,data[1].slot)
		end)
	end
	self.removeWeapon = function(weapon)
		local item = exports.ox_inventory:GetItem(src, weapon:lower(), nil, false)
		for i = 1, item.count do
			exports.ox_inventory:RemoveItem(src, weapon:lower(), 1, nil)
		end
	end
	return self
end