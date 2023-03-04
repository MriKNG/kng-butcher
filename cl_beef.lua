local QBCore = exports['qb-core']:GetCoreObject()

--BLIP THREAD
CreateThread(function()
    local blip = AddBlipForCoord(vector3(964.49, -2185.15, 30.29))
    SetBlipSprite(blip, 615)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Slaughterhouse")
    EndTextCommandSetBlipName(blip)
end)

--COLLECTING CARCASS
RegisterNetEvent('kng-beef:client:collectCarcass', function()
    QBCore.Functions.Progressbar('beef_carcass', 'Collecting Carcass', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('kng-beef:server:collectCarcass')
        QBCore.Functions.Notify('You collected carcass', 'primary', 5000)
        ClearPedTasks(PlayerPedId())
    end)
end)

--SKINNING CARCASS
RegisterNetEvent('kng-beef:client:skinCarcass', function()
    local hasItem = QBCore.Functions.HasItem('beef_carcass')
    local hasItem2 = QBCore.Functions.HasItem('weapon_knife')
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar('skinned_carcass', 'Skinning Carcass', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-beef:server:skinCarcass')
            QBCore.Functions.Notify('You skinned the carcass', 'primary', 5000)
            QBCore.Functions.Notify('You have blood on your hands', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have carcasses or a knife', 'error', 5000)
    end
end)

--CUTTING CARCASS
RegisterNetEvent('kng-beef:client:cutBeef', function()
    local hasItem = QBCore.Functions.HasItem('skinned_carcass')
    local hasItem2 = QBCore.Functions.HasItem('weapon_knife')
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar('cut_beef', 'Cutting Meat', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-beef:server:cutBeef')
            QBCore.Functions.Notify('You cut the meat', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have a skinned carcass or a knife', 'error', 5000)
    end
end)

--PACKAGING BEEF
RegisterNetEvent('kng-beef:client:packageBeef', function()
    local hasItem = QBCore.Functions.HasItem('cut_beef')
    if hasItem then
        QBCore.Functions.Progressbar('packaged_beef', 'Packaging Beef', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-beef:server:packageBeef')
            QBCore.Functions.Notify('You packaged beef', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have any cut beef', 'error', 5000)
    end
end)

--BEEF SELLING
RegisterNetEvent('kng-beef:client:beefVendor', function()
    local hasItem = QBCore.Functions.HasItem('packaged_beef')
    if hasItem then
        TriggerServerEvent('kng-beef:server:beefVendor')
    else
        QBCore.Functions.Notify('You do not have any packaged beef', 'error', 5000)
    end
end)

--THREADS
CreateThread(function()
    --COLLECTING LOCATIONS
    exports['qb-target']:AddBoxZone("Collectbeef", vector3(997.23, -2105.33, 30.48), 2, 2, {
        name = "Collectbeef",
        heading = 355,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:collectCarcass",
                icon = "fas fa-cow",
                label = "Collect Carcass",
            },
        },
        distance = 1.5
        })

    exports['qb-target']:AddBoxZone("Collectbeef2", vector3(992.84, -2114.79, 30.48), 2, 2, {
        name = "Collectbeef2",
        heading = 35,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:collectCarcass",
                icon = "fas fa-cow",
                label = "Collect Carcass",
            },
        },
        distance = 1.5
    })

    --SKINNING LOCATION
    exports['qb-target']:AddBoxZone("Skin", vector3(984.65, -2112.66, 30.76), 2, 1, {
        name = "Skin",
        heading = 30,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:skinCarcass",
                icon = "fas fa-cow",
                label = "Skin Carcass",
            },
        },
        distance = 1.5
    })

    --CUTTING LOCATION
    exports['qb-target']:AddBoxZone("Cutbeef", vector3(985.69, -2117.27, 30.76), 8, 1, {
        name = "Cutbeef",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:cutBeef",
                icon = "fas fa-cow",
                label = "Cut Meat",
            },
        },
        distance = 1.5
    })

    --PACKAGE LOCATION
    exports['qb-target']:AddBoxZone("Package", vector3(953.93, -2123.41, 31.45), 8, 1, {
        name = "Package",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:packageBeef",
                icon = "fas fa-cow",
                label = "Package Meat",
            },
        },
        distance = 1.5
    })

    --VENDOR LOCATION
    exports['qb-target']:AddBoxZone("Vendorbeef", vector3(985.34, -2171.39, 30.2), 8, 1, {
        name = "Vendorbeef",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-beef:client:beefVendor",
                icon = "fas fa-cow",
                label = "Sell Beef",
            },
        },
        distance = 1.5
    })
end)

CreateThread(function()
    RequestModel(`s_f_y_factory_01`)
    while not HasModelLoaded(`s_f_y_factory_01`) do
        Wait(1)
    end
    beefVendorPed = CreatePed(2, `s_f_y_factory_01`, vector4(985.34, -2171.39, 29.3, 28.88), false, false)
    SetPedFleeAttributes(beefVendorPed, 0, 0)
    SetPedDiesWhenInjured(beefVendorPed, false)
    TaskStartScenarioInPlace(beefVendorPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(beefVendorPed, true)
    SetBlockingOfNonTemporaryEvents(beefVendorPed, true)
    SetEntityInvincible(beefVendorPed, true)
    FreezeEntityPosition(beefVendorPed, true)
end)
