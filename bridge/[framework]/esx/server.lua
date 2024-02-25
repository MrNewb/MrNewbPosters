if Config.framework ~= "esx" then return end

local ESX = exports["es_extended"]:getSharedObject()

if Config.debug then print(Config.framework) end

function AddMoneyToAccount(src, total)
    local xPlayer = ESX.GetPlayerFromId(src)
    local payrate = 1000 * total
    if Config.Logs then 
        logs(src, "Player "..src.."has been paid for placing posters. Total: "..payrate)
    end
    xPlayer.addAccountMoney('bank', payrate)
end