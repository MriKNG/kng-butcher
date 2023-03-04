local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kng-chicken:server:collectChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
    local collectitem = 'alive_chicken'

    Player.Functions.AddItem(collectitem, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[collectitem], "add")
end)

RegisterNetEvent('kng-chicken:server:killChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local collectitem = 'alive_chicken'
    local killitem = 'dead_chicken'

    if killitem ~= nil then
        Player.Functions.RemoveItem(collectitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[collectitem], "remove")

        Wait(1)

        Player.Functions.AddItem(killitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[killitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any chicken', 'error')
    end
end)

RegisterNetEvent('kng-chicken:server:pluckChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local killitem = 'dead_chicken'
    local pluckitem = 'plucked_chicken'

    if pluckitem ~= nil then
        Player.Functions.RemoveItem(killitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[killitem], "remove")

        Wait(1)

        Player.Functions.AddItem(pluckitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[pluckitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any slaugtered chickens', 'error')
    end
end)

RegisterNetEvent('kng-chicken:server:cutChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local pluckitem = 'plucked_chicken'
    local cutitem = 'chicken_filet'

    if cutitem ~= nil then
        Player.Functions.RemoveItem(pluckitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[pluckitem], "remove")

        Wait(1)

        Player.Functions.AddItem(cutitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cutitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any plucked chickens', 'error')
    end
end)

RegisterNetEvent('kng-chicken:server:chickenVendor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutitem = 'chicken_filet'
    local price = math.random(10, 15)
    local currency = 'cash'

    if cutitem ~= nil then
        Player.Functions.RemoveItem(cutitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cutitem], "remove")

        Wait(1)

        Player.Functions.AddMoney(currency, price)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any chicken filet to sell', 'error')
    end
end)