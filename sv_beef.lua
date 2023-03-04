local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kng-beef:server:collectCarcass', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
    local collect2item = 'beef_carcass'

    Player.Functions.AddItem(collect2item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[collect2item], "add")
end)

RegisterNetEvent('kng-beef:server:skinCarcass', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local collect2item = 'beef_carcass'
    local skinitem = 'skinned_carcass'

    if skinitem ~= nil then
        Player.Functions.RemoveItem(collect2item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[collect2item], "remove")

        Wait(1)

        Player.Functions.AddItem(skinitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[skinitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any carcasses', 'error')
    end
end)

RegisterNetEvent('kng-beef:server:cutBeef', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local skinitem = 'skinned_carcass'
    local cuttingitem = 'cut_beef'

    if cuttingitem ~= nil then
        Player.Functions.RemoveItem(skinitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[skinitem], "remove")

        Wait(1)

        Player.Functions.AddItem(cuttingitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cuttingitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any skinned carcasses', 'error')
    end
end)

RegisterNetEvent('kng-beef:server:packageBeef', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cuttingitem = 'cut_beef'
    local packageitem = 'packaged_beef'

    if packageitem ~= nil then
        Player.Functions.RemoveItem(cuttingitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cuttingitem], "remove")

        Wait(1)

        Player.Functions.AddItem(packageitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[packageitem], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any cut beef', 'error')
    end
end)

RegisterNetEvent('kng-beef:server:beefVendor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local packageitem = 'packaged_beef'
    local price = math.random(20, 25)
    local currency = 'cash'

    if packageitem ~= nil then
        Player.Functions.RemoveItem(packageitem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[packageitem], "remove")

        Wait(1)

        Player.Functions.AddMoney(currency, price)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have any packaged beef to sell', 'error')
    end
end)