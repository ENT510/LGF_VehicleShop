local Utils = {}


function Utils.createPed(data)
    local modelHash = lib.requestModel(data.model)
    local ped = CreatePed(4, modelHash, data.position.x, data.position.y, data.position.z, data.heading, false, true)
    SetEntityHeading(ped, data.position.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)

    if data.scenario then
        TaskStartScenarioInPlace(ped, data.scenario, 0, true)
    end

    SetBlockingOfNonTemporaryEvents(ped, true)
    SetModelAsNoLongerNeeded(modelHash)
    return ped
end

function Utils.getVehicleType(vehicleHash)
    local vehicleClass = GetVehicleClassFromName(vehicleHash)
    local vehicleType = "normal"

    if vehicleClass == 16 or vehicleClass == 15 then
        vehicleType = "aircraft"
    elseif vehicleClass == 14 then
        vehicleType = "boat"
    end

    return vehicleType
end

function Utils.createVehicle(data)
    local modelHash = lib.requestModel(data.model)

    local vehicle = CreateVehicle(
        modelHash,
        data.position.x, data.position.y, data.position.z,
        data.position.w,
        data.networked,
        false
    )

    SetEntityHeading(vehicle, data.position.w)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityInvincible(vehicle, data.invincible or false)
    FreezeEntityPosition(vehicle, data.freeze or false)
    SetModelAsNoLongerNeeded(modelHash)

    if data.networked then
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(vehicle), true)
    end

    return vehicle
end


return Utils
