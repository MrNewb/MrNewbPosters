local cachedData = {}

local function GetCountBySource(src)
	return cachedData[src] or 0
end

local function RemoveDataBySource(src)
	cachedData[src] = nil
end

RegisterNetEvent("MrNewbPosters:verifycount", function(count)
	local src = source
	if not count then return print("Cheater pinging event ID# ", src) end
	cachedData[src] = (cachedData[src] or 0) + count
	local total = GetCountBySource(src)
	if total >= 10 then
		TriggerEvent("MrNewbPosters:endposterJob", 10)
	end
	--print(json.encode(GetCountBySource(src)))
end)

RegisterNetEvent("MrNewbPosters:startjob", function()
	local src = source
	local player = src
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
	local dstCheck = #(playerCoords - Config.StartPosition)
	if dstCheck <= 9.0 then
		NotifyPlayer(src, 'Head to the marked location to place a poster.', "inform")
		TriggerClientEvent("MrNewbPosters:jobstarted", src)
	end
end)

RegisterNetEvent("MrNewbPosters:endposterJob", function(total)
	local src = source
	if not total or total < 1 then return end
	AddMoneyToAccount(src, total)
	RemoveDataBySource(src)
end)