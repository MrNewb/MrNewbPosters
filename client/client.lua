local onActiveJob = LocalPlayer.state.onActiveJob
local posterCount = LocalPlayer.state.posterCount
local posterLocationBlip = {}
local activeCoords = Config.StartPosition
local PosterModel = Config.PosterModels[1]

RegisterNetEvent('MrNewbPosters:jobstarted', function()
	onActiveJob = true
	getPosterCoord()
end)

local function removePosterCoord()
	RemoveBlip(posterLocationBlip)
	getPosterCoord()
end

local function updateState()
	onActiveJob = false
	posterCount = 0
	removePosterCoord()
end

local function verifyPlacement()
	if not onActiveJob and posterCount >= 0 then return NotifyPlayer('You havent put up enough posters.', "inform") end
	TriggerServerEvent('MrNewbPosters:verifycount', posterCount)
	if posterCount >= 10 then onActiveJob = false end
end

function getPosterCoord()
	if posterCount >= 10 then return updateState() end
	if posterCount <= 9 then
		math.randomseed(GetGameTimer())
		local randomizer = math.random(11)
		activeCoords = Config.PosterCoords[randomizer]

		posterLocationBlip = AddBlipForCoord(activeCoords.x, activeCoords.y, activeCoords.z)
		SetBlipSprite(posterLocationBlip, 1)
		SetBlipScale(posterLocationBlip, 0.9)
		SetBlipColour(posterLocationBlip, 26)
		SetBlipDisplay(posterLocationBlip, 2)
		SetBlipAsShortRange(posterLocationBlip, false)
		SetBlipRoute(posterLocationBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Poster Wall")
		EndTextCommandSetBlipName(posterLocationBlip)
	end
end

function placeScene()
	print("Model ",PosterModel)
	print("Active Coords ",activeCoords)
	local ped = PlayerPedId()
	local animDict = "anim@amb@nightclub@poster@"
	RequestAnimDict(animDict)
	RequestModel(PosterModel)

	while not HasAnimDictLoaded(animDict) or not HasModelLoaded(PosterModel) do
		Wait(100)
	end

	local targetPosition, targetRotation = vector3(activeCoords.x, activeCoords.y, activeCoords.z), vector3(0.0, 0.0, activeCoords.h)

	local animPos, targetHeading = GetAnimInitialOffsetPosition(animDict, "poster_placement", targetPosition, targetRotation, 0, 2), 52.8159
	TaskGoStraightToCoord(ped, animPos, 0.025, 5000, targetHeading, 0.05)

	Wait(1000)
	FreezeEntityPosition(ped, true)

	local netScene = NetworkCreateSynchronisedScene(targetPosition, targetRotation, 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "poster_placement", 1.5, -4.0, 1, 16, 1148846080, 0)

	local poster = CreateObjectNoOffset(GetHashKey(PosterModel), targetPosition, 1, 1, 0)
	NetworkAddEntityToSynchronisedScene(poster, netScene, animDict, "poster_poster_placement", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(netScene)

	FreezeEntityPosition(ped, false)
	Wait(5000)
	verifyPlacement()
	NotifyPlayer('Payment sent for placing poster', "inform")
	removePosterCoord()
	Wait(20000)
	DeleteEntity(poster)
	Wait(1000)
end

CreateThread(function()
	while true do
		local sleep = 2000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = #(pedCoords - Config.StartPosition)
		if dstCheck <= 8.0 and not onActiveJob then
			sleep = 0
			DrawText3Ds(Config.StartPosition, Config.LanguageText.StartJobLang, 0.4)
			if dstCheck <= 2 and IsControlJustReleased(0, 38) then
				onActiveJob = true
				Wait(1000)
				posterCount = 0
				TriggerServerEvent('MrNewbPosters:startjob', pedCoords)
			end
		end
		Wait(sleep)
	end
end)


CreateThread(function()
	while true do
		local sleep = 2000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local activeVector = vector3(activeCoords.x, activeCoords.y, activeCoords.z)
		local dstCheck = #(pedCoords - activeVector)
		if dstCheck <= 6.5 and onActiveJob then
			sleep = 0
			DrawText3Ds(activeVector, Config.LanguageText.PlacePoster, 0.4)
			if dstCheck <= 1.5 and onActiveJob and IsControlJustReleased(0, 38) then
				local randomizer = math.random(4)
				PosterModel = Config.PosterModels[randomizer]
				print(PosterModel)
				posterCount = posterCount + 1
				placeScene()
			end
		end
		Wait(sleep)
	end
end)