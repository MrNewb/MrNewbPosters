ESX = nil
on_job_delivery = false
posted_posted = false
randomCoords = vector3(0.0, 0.0, 0.0)
placed_posters = 0
isit_a_valid_situation = 0
local animDict = "anim@amb@nightclub@poster@"
local posterModeldefualt = "ba_prop_battle_poster_skin_01"
local posterl_ist = {[1] = 'ba_prop_battle_poster_skin_01', [2] = 'ba_prop_battle_poster_skin_02', [3] = 'ba_prop_battle_poster_skin_03', [4] = 'ba_prop_battle_poster_skin_04',}

PosterCoords = {
    [1] = {x = -1063.016, y = -2543.65, z = 20.62, h = 60.0},
    [2] = {x = 154.12, y = -1038.75, z = 29.82, h = 156.53},
    [3] = {x = 84.75, y = -764.99, z = 32.10, h = 337.62},
    [4] = {x = 72.33, y = -805.12, z = 31.90, h = 159.72},
    [5] = {x = -1205.33, y = -889.20, z = 13.52, h = 213.11},	 
    [6] = {x = 816.79, y = -1041.36, z = 27.19, h = 179.74},
    [7] = {x = 451.80, y = 82.23, z = 99.08, h = 160.20},
    [8] = {x = 929.08, y = 53.27, z = 81.56, h = 239.14},
    [9] = {x = 195.79, y = -1175.49, z = 29.85, h = 97.57},
    [10] = {x = 217.59, y = -1785.27, z = 29.35, h = 318.81},
    [11] = {x = -223.46, y = -932.15, z = 29.74, h = 70.50},
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

function DrawText3Ds(x, y, z, text, scale)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

  SetTextScale(scale, scale)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextEntry("STRING")
  SetTextCentre(true)
  SetTextColour(255, 255, 255, 215)
  AddTextComponentString(text)
  DrawText(_x, _y)
  
  local factor = (string.len(text)) / 700
  DrawRect(_x, _y + 0.0150, 0.06 + factor, 0.03, 41, 11, 41, 100)
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-1059.01, -240.40, 44.01)
	SetBlipSprite (blip, 184)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, 57)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Poster Company')
	EndTextCommandSetBlipName(blip)
end)

local putuptheshitonwalls = function()
	while true do
		local sleepThread = 2000
        local pedCoords = GetEntityCoords(PlayerPedId())
        local locationPos = vector3(-1059.40, -240.01, 44.01)
        local dstCheck = #(pedCoords - locationPos)
           	if dstCheck <= 8.0 and on_job_delivery == false then
               	sleepThread = 5
				DrawText3Ds(-1059.40, -240.01, 44.01, '~g~Press [E] to Start Poster Job.', 0.4)
				if dstCheck <= 1.5 and on_job_delivery == false and IsControlJustReleased(0, 38) then
					on_job_delivery = true
					placed_posters = 1
					Citizen.Wait(1000)
					GetRandomPosterSpot()
					--exports['mythic_notify']:SendAlert('inform', 'Head to the marked location to place a poster.', 6500)
					ESX.ShowNotification('Head to the marked location to place a poster.')
				end
			end
    	Citizen.Wait(sleepThread)
 	end
end

function GetRandomPosterSpot()
	if on_job_delivery == true and placed_posters <= 9 then
		local rolldashits = math.random(1, 11)
		local blipname = 
		math.randomseed(GetGameTimer())
		randomCoords = PosterCoords[rolldashits]

		poster_spot = AddBlipForCoord(randomCoords.x, randomCoords.y, randomCoords.z)
		SetBlipSprite(poster_spot, 1)
		SetBlipScale(poster_spot, 0.9)
		SetBlipColour(poster_spot, 26)
		SetBlipDisplay(poster_spot, 2)
		SetBlipAsShortRange(poster_spot, false)
		SetBlipRoute(poster_spot, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Poster Wall")
		EndTextCommandSetBlipName(poster_spot)
	elseif on_job_delivery == true and placed_posters >= 10 then
		stopJob()
	end
end

Citizen.CreateThread(function()
  while true do
		local playaaaaa = PlayerPedId()
        local pedCoords = GetEntityCoords(playaaaaa)
        local poster_location = vector3(randomCoords.x, randomCoords.y, randomCoords.z)
        local dstCheck = #(pedCoords - poster_location)
           	if dstCheck <= 6.5 and on_job_delivery == true and posted_posted == false then
               	sleepThread = 0
				DrawText3Ds(randomCoords.x, randomCoords.y, randomCoords.z, '~g~Press [E] to place the poster', 0.4)
				if dstCheck <= 1.5 and on_job_delivery == true and posted_posted == false and IsControlJustReleased(0, 38) then
					exports['mythic_progbar']:Progress({
						name = "MrNewb_poster_action",
						duration = 10500,
						label = "Applying Poster",
						useWhileDead = false,
						canCancel = false,
						controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						},
					})
					posted_posted = true
					local roll_da_posta = math.random(1, 4)
					posterModeldefualt = posterl_ist[roll_da_posta]
					placed_posters = placed_posters + 1
					placeposter()
				end
			else
				sleepThread = 2000
			end
    	Citizen.Wait(sleepThread)
 	end
end)

function placeposter()
	local playaaaaa = PlayerPedId()
	RequestAnimDict(animDict)
	RequestModel(posterModeldefualt)

	while not HasAnimDictLoaded(animDict) or not HasModelLoaded(posterModeldefualt) do
		Citizen.Wait(100)
	end

	local targetPosition, targetRotation = vec3(randomCoords.x, randomCoords.y, randomCoords.z), vec3(0.0, 0.0, randomCoords.h)

	local animPos, targetHeading = GetAnimInitialOffsetPosition(animDict, "poster_placement", targetPosition, targetRotation, 0, 2), 52.8159
	TaskGoStraightToCoord(playaaaaa, animPos, 0.025, 5000, targetHeading, 0.05)

	Citizen.Wait(1000)
	FreezeEntityPosition(playaaaaa, true)

	local netScene = NetworkCreateSynchronisedScene(targetPosition, targetRotation, 2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(playaaaaa, netScene, animDict, "poster_placement", 1.5, -4.0, 1, 16, 1148846080, 0)

	local poster = CreateObjectNoOffset(GetHashKey(posterModeldefualt), targetPosition, 1, 1, 0)
	NetworkAddEntityToSynchronisedScene(poster, netScene, animDict, "poster_poster_placement", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(netScene)

	FreezeEntityPosition(playaaaaa, false)
	

	PayForJob()
	ESX.ShowNotification('Payment sent for placing poster')
	RemoveBlip(poster_spot)

	GetRandomPosterSpot()
	Citizen.Wait(20000)
	print(posterModeldefualt)
	DeleteEntity(poster)
	print('deleted the poster, hopefully it worked though')
	posted_posted = false
	Citizen.Wait(1000)
	
end

function PayForJob()
	if on_job_delivery == true and placed_posters > 0 then
		TriggerServerEvent('MrNewbPosters:warm')
		--print('svr event triggered')
		--exports['mythic_notify']:SendAlert('inform', 'Payment recived for putting up the poster.', 6500)
	else
		TriggerServerEvent('NewbPosters:cold')
		--print('not sure why this posted leme know though MrNewb#6475')
	end
end

function stopJob()
	if on_job_delivery == true then
		ClearPedTasksImmediately(PlayerPedId())
		placed_posters = 1
		on_job_delivery = false
		RemoveBlip(poster_spot)
		--exports['mythic_notify']:SendAlert('inform', 'Damn dude on a roll, Im restocking the shop stop by when you want to do more.', 7500)
		ESX.ShowNotification('Damn dude on a roll, Im restocking the shop stop by when you want to do more.')
	else
		print('not sure why this posted leme know though MrNewb#6475')
	end
end

SetTimeout(500, putuptheshitonwalls)