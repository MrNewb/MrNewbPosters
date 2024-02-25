if Config.framework ~= "qb" then return print("qb SS Off") end

local QBCore = exports['qb-core']:GetCoreObject()

if Config.debug then print(Config.framework) end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local blip = AddBlipForCoord(Config.StartPosition.x, Config.StartPosition.y, Config.StartPosition.z)
	SetBlipSprite(blip, Config.BlipSettings.Sprite)
	SetBlipDisplay(blip, Config.BlipSettings.Display)
	SetBlipScale(blip, Config.BlipSettings.Scale)
	SetBlipColour(blip, Config.BlipSettings.Colour)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(Config.LanguageText.BlipName)
	EndTextCommandSetBlipName(blip)
end)

AddEventHandler("QBCore:Client:OnPlayerUnload", function()
    LocalPlayer.state:set('posterjob', false, true)
end)

function DrawText3Ds(pos, text)
	local descript = text
	local coords = pos
	return QBCore.Functions.DrawText3D(coords.x, coords.y, coords.z, descript)
end