ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('MrNewbPosters:warm')
AddEventHandler('MrNewbPosters:warm', function()
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addAccountMoney('bank', 2000)
end)

RegisterServerEvent('MrNewbPosters:cold')
AddEventHandler('MrNewbPosters:cold', function()
    local src = source
	DropPlayer(src, 'Disconnecting cheater')
	print(src, 'is cheating')
end)

