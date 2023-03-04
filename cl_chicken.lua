local QBCore = exports['qb-core']:GetCoreObject()

--BLIP THREAD
CreateThread(function()
    local blip = AddBlipForCoord(vector3(-72.09, 6259.89, 31.09))
    SetBlipSprite(blip, 615)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Chicken Factory")
    EndTextCommandSetBlipName(blip)
end)

--COLLECTING CHICKEN
RegisterNetEvent('kng-chicken:client:collectChicken', function()
    QBCore.Functions.Progressbar('alive_chicken', 'Collecting Chicken', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('kng-chicken:server:collectChicken')
        QBCore.Functions.Notify('You collected Chicken', 'primary', 5000)
        ClearPedTasks(PlayerPedId())
    end)
end)

--KILLING CHICKEN
RegisterNetEvent('kng-chicken:client:killChicken', function()
    local hasItem = QBCore.Functions.HasItem('alive_chicken')
    local hasItem2 = QBCore.Functions.HasItem('weapon_knife')
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar('dead_chicken', 'Killing Chicken', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-chicken:server:killChicken')
            QBCore.Functions.Notify('You killed a chicken', 'primary', 5000)
            QBCore.Functions.Notify('You have blood on your hands', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have any alive chicken or a knife', 'error', 5000)
    end
end)

--PLUCKING CHICKEN
RegisterNetEvent('kng-chicken:client:pluckChicken', function()
    local hasItem = QBCore.Functions.HasItem('dead_chicken')
    if hasItem then
        QBCore.Functions.Progressbar('plucked_chicken', 'Plucking Chicken', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-chicken:server:pluckChicken')
            QBCore.Functions.Notify('You plucked a Chicken', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have any dead chicken', 'error', 5000)
    end
end)

--CUTTING CHICKEN
RegisterNetEvent('kng-chicken:client:cutChicken', function()
    local hasItem = QBCore.Functions.HasItem('plucked_chicken')
    local hasItem2 = QBCore.Functions.HasItem('weapon_knife')
    if hasItem and hasItem2 then
        QBCore.Functions.Progressbar('chicken_meat', 'Cutting Chicken', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mini@repair',
            anim = 'fixing_a_ped',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('kng-chicken:server:cutChicken')
            QBCore.Functions.Notify('You cut a chicken', 'primary', 5000)
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify('You do not have any plucked chickens or a knife', 'error', 5000)
    end
end)

--CHICKEN SELLING
RegisterNetEvent('kng-chicken:client:chickenVendor', function()
    local hasItem = QBCore.Functions.HasItem('chicken_filet')
    if hasItem then
        TriggerServerEvent('kng-chicken:server:chickenVendor')
    else
        QBCore.Functions.Notify('You do not have any chicken filet', 'error', 5000)
    end
end)

--THREADS
CreateThread(function()
    --COLLECTING LOCATIONS
    exports['qb-target']:AddBoxZone("Collect1", vector3(-66.7, 6235.48, 31.09), 2, 2, {
        name = "Collect1",
        heading = 355,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:collectChicken",
                icon = "fas fa-bird",
                label = "Collect Chicken",
            },
        },
        distance = 1.5
        })

    exports['qb-target']:AddBoxZone("Collect2", vector3(-68.98, 6249.34, 31.08), 2, 2, {
        name = "Collect2",
        heading = 35,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:collectChicken",
                icon = "fas fa-bird",
                label = "Collect Chicken",
            },
        },
        distance = 1.5
    })

    --KILLING LOCATION
    exports['qb-target']:AddBoxZone("Kill", vector3(-78.81, 6228.92, 31.09), 2, 1, {
        name = "Kill",
        heading = 30,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:killChicken",
                icon = "fas fa-bird",
                label = "Slaughter Chicken",
            },
        },
        distance = 1.5
    })

    --PLUCKING LOCATION
    exports['qb-target']:AddBoxZone("Pluck", vector3(-89.46, 6234.78, 31.09), 8, 1, {
        name = "Pluck",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:pluckChicken",
                icon = "fas fa-bird",
                label = "Pluck Chicken",
            },
        },
        distance = 1.5
    })

    --CUTTING LOCATION
    exports['qb-target']:AddBoxZone("Cut", vector3(-102.63, 6209.67, 31.03), 8, 1, {
        name = "Cut",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:cutChicken",
                icon = "fas fa-bird",
                label = "Cut Chicken",
            },
        },
        distance = 1.5
    })

    --VENDOR LOCATION
    exports['qb-target']:AddBoxZone("Vendor", vector3(-68.84, 6256.48, 31.09), 8, 1, {
        name = "Vendor",
        heading = 315,
        debugpoly = false,
    }, {
        options = {
            {
                event = "kng-chicken:client:chickenVendor",
                icon = "fas fa-bird",
                label = "Sell Chicken",
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
    ChickenVendorPed = CreatePed(2, `s_f_y_factory_01`, vector4(-68.84, 6256.48, 30.09, 163.1), false, false)
    SetPedFleeAttributes(ChickenVendorPed, 0, 0)
    SetPedDiesWhenInjured(ChickenVendorPed, false)
    TaskStartScenarioInPlace(ChickenVendorPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(ChickenVendorPed, true)
    SetBlockingOfNonTemporaryEvents(ChickenVendorPed, true)
    SetEntityInvincible(ChickenVendorPed, true)
    FreezeEntityPosition(ChickenVendorPed, true)
end)
