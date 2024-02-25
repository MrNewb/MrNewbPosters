if Config.framework ~= "qb" then return end

local QBCore = exports['qb-core']:GetCoreObject()

if Config.debug then print(Config.framework) end

function RemoveItemFromInventory(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.CustomPlateName
    Player.Functions.RemoveItem(item, 1)
end

function AddMoneyToAccount(src, total)
    local Player = QBCore.Functions.GetPlayer(src)
    local payrate = 1000 * total
    if Config.Logs then 
        logs(src, "Player "..src.."has been paid for placing posters. Total: "..payrate)
    end
    Player.Functions.AddMoney('bank', payrate, 'Poster Job Paymeant')
end
