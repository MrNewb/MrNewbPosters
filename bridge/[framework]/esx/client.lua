if Config.framework ~= "esx" then return end

local ESX = exports["es_extended"]:getSharedObject()

if Config.debug then print(Config.framework) end

AddEventHandler('esx:playerLoaded',function()
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

AddEventHandler('esx:onPlayerLogout',function()
	LocalPlayer.state:set('posterjob', false, true)
end)

function DrawText3Ds(coords, text, size, font)
	return ESX.Game.Utils.DrawText3D(coords, text, size, font)
end