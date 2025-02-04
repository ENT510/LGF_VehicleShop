local Client   = {}
local Config   = require "modules.client.cl-config"
local Utils    = require "modules.client.cl-utils"
local Cam      = require "modules.client.cl-cam"
local Shared   = require "shared"

VehiclePrewiew = nil


local function getIconForClass(className)
    local icons = Config.IconClass
    return icons[className] or "car"
end

function Client.openMenuZone(zoneID)
    local vehicles = Config.Zones[zoneID].ShopVehicles
    local groupedVehicles = Client.groupVehiclesByClass(vehicles)
    Client.createClassMenu(groupedVehicles, zoneID)
end

function Client.deleteVehiclePrew()
    if VehiclePrewiew and DoesEntityExist(VehiclePrewiew) then
        DeleteEntity(VehiclePrewiew)
        VehiclePrewiew = nil
    end
end

function Client.groupVehiclesByClass(vehicles)
    local groupedVehicles = {}
    for _, vehicle in ipairs(vehicles) do
        local className = vehicle.Class
        if not groupedVehicles[className] then
            groupedVehicles[className] = {}
        end
        table.insert(groupedVehicles[className], vehicle)
    end
    return groupedVehicles
end

function Client.createClassMenu(groupedVehicles, zoneID)
    local classOptions = {}

    for className, _ in pairs(groupedVehicles) do
        local icon = getIconForClass(className)
        classOptions[#classOptions + 1] = {
            id = ('class_%s'):format(className),
            title = className,
            icon = icon,
            description = ('%s class'):format(className),
            metadata = {
                TotalCount = #_,
                className = className,
                zoneID = zoneID,

            },
            onSelect = function()
                Client.createVehicleMenu(groupedVehicles[className], className, zoneID)
            end
        }
    end

    local contextClass = exports.LGF_UiPack:registerContextMenu({
        id = 'vehicle-class-menu',
        title = 'Select Vehicle Class',
        options = classOptions,
        enableCloseButton = true,
    })
    exports.LGF_UiPack:displayContextMenu(contextClass)
end

function Client.createVehicleMenu(vehiclesInClass, className, zoneID)
    local vehicleOptions = {}
    local vehicleCount = #vehiclesInClass

    for _, vehicle in ipairs(vehiclesInClass) do
        vehicleOptions[#vehicleOptions + 1] = {
            id = ('vehicle_%s'):format(vehicle.Label),
            title = ("%s - Price: %s$"):format(vehicle.Label, vehicle.Price),
            icon = getIconForClass(vehicle.Class),
            description = ("%s"):format(vehicle.Description),
            metadata = {
                image = vehicle.Image or ("https://docs.fivem.net/vehicles/%s.webp"):format(vehicle.Hash)
            },
            onSelect = function()
                Client.createVehicleActionMenu(vehicle, zoneID)
            end
        }
    end

    local context_id = exports.LGF_UiPack:registerContextMenu({
        id = ('vehicle-class-%s'):format(className),
        title = ('Select a vehicle (%d Total)'):format(vehicleCount),
        options = vehicleOptions,
        enableCloseButton = false,
        onBack = function()
            Client.deleteVehiclePrew()

            if Cam.ExistCam() then Cam.DestroyCamera() end
        end
    })

    exports.LGF_UiPack:displayContextMenu(context_id)
end

function Client.handleTestDrive(vehicle, data)
    Client.deleteVehiclePrew()
    if Cam.ExistCam() then Cam.DestroyCamera() end
    exports.LGF_UiPack:hideContextMenu()

    local vehicleInstance = Utils.createVehicle({
        model = vehicle.Hash,
        position = data.Position,
        networked = true,
        invincible = false,
        freeze = false
    })

    Wait(200)
    TaskWarpPedIntoVehicle(cache.ped, vehicleInstance, -1)

    SetTimeout(data.Duration, function()
        DeleteEntity(vehicleInstance)
        SetEntityCoords(cache.ped, data.Position.x, data.Position.y, data.Position.z, false, false, false, false)
    end)
end

function Client.handleVehiclePrev(vehicle, spawnPosition)
    Client.deleteVehiclePrew()
    VehiclePrewiew = Utils.createVehicle({
        model = vehicle.Hash,
        position = spawnPosition,
        networked = true,
        invincible = true,
        freeze = true
    })
    if Cam.ExistCam() then return end
    Cam.StartCamera(VehiclePrewiew, 6.0, 0.7, true)
end

function Client.handleBuyVehicle(vehicle, spawnPos, zoneID)
    local zoneData = Config.Zones[zoneID]

    local result = exports.LGF_UiPack:registerAlert({
        title = "Confirm Vehicle Purchase",
        message = ("Are you sure you want to buy the %s for $%d?"):format(vehicle.Label, vehicle.Price),
        type = "info",
        confirmLabel = ("Buy %s"):format(vehicle.Label),
        cancelLabel = "Deny Action",
        icon = "cash-register",
        offset = { x = 450, y = 300 }
    })

    if not result then
        return
    end

    Client.deleteVehiclePrew()

    if Cam.ExistCam() then
        Cam.DestroyCamera()
    end

    local vehiclePrice = vehicle.Price
    local vehicleBuyed = Utils.createVehicle({
        model = vehicle.Hash,
        position = spawnPos,
        networked = true,
        invincible = false,
        freeze = false
    })

    exports.LGF_UiPack:hideContextMenu()

    local success = lib.callback.await("LGF_VehicleShop.Query.BuyVehicle", false, {
        price = vehiclePrice,
        props = lib.getVehicleProperties(vehicleBuyed),
        class = GetVehicleClass(vehicleBuyed),
        shopCoords = zoneData.PedZone.Position,
        netID = NetworkGetNetworkIdFromEntity(vehicleBuyed)
    })

    if success then
        TaskWarpPedIntoVehicle(cache.ped, vehicleBuyed, -1)

        Shared.notify("Success", "You have successfully purchased the vehicle!", "success")
    else
        DeleteEntity(vehicleBuyed)
    end
end

function Client.createVehicleActionMenu(vehicle, zoneID)
    local zoneData = Config.Zones[zoneID]
    local haveMoney = exports.ox_inventory:GetItemCount("money") >= vehicle.Price

    local vehicleType = Utils.getVehicleType(vehicle.Hash)

    local actionOptions = {
        {
            id = 'test_drive',
            title = 'Test Drive',
            icon = 'car',
            description = 'Test the vehicle in a temporary environment.',
            onSelect = function()
                local spawnPosTestDrive = zoneData.SpawnPosition.TestDrive[vehicleType]

                Client.handleTestDrive(vehicle, spawnPosTestDrive)
            end
        },
        {
            id = 'preview',
            title = 'Preview',
            icon = 'eye',
            description = 'Preview the vehicle without buying it.',
            onSelect = function()
                local spawnPosPreview = zoneData.SpawnPosition.VehiclePrewiew[vehicleType]
                Client.deleteVehiclePrew()

                Client.handleVehiclePrev(vehicle, spawnPosPreview)
            end
        },
        {
            id = 'buy',
            title = 'Buy',
            icon = 'money',
            disabled = not haveMoney,
            description = 'Buy the vehicle for your collection.',
            onSelect = function()
                local spawnPosBuy = zoneData.SpawnPosition.VehicleBuyed[vehicleType]


                Client.handleBuyVehicle(vehicle, spawnPosBuy, zoneID)
            end
        }
    }

    local context = exports.LGF_UiPack:registerContextMenu({
        id = ('vehicle-action-%s'):format(vehicle.Label),
        title = ('Action for %s'):format(vehicle.Label),
        options = actionOptions,
        enableCloseButton = false,
    })

    exports.LGF_UiPack:displayContextMenu(context)
end

return Client
