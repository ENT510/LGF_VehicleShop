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

function Utils.startTestDriveTimer(duration)
    local startTime = GetGameTimer()
    local endTime = startTime + duration

    local function x___timer()
        local currentTime = GetGameTimer()
        local timeLeft = math.max(0, endTime - currentTime)
        local secondsLeft = math.floor(timeLeft / 1000)


        exports.LGF_UiPack:showTextUi({
            title = "Test Drive Active",
            message = "Test the Vehicle before the time runs out.",
            binder = ("%02d"):format(secondsLeft),
            position = "right",
            backgroundColor = "rgba(31, 41, 55, 0.9)"
        })


        if timeLeft <= 0 then
            exports.LGF_UiPack:hideTextUi()
            return
        end


        SetTimeout(1000, x___timer)
    end

    x___timer()
end

function Utils.doScreenFade(type, time)
    if type == "in" then
        DoScreenFadeIn(time)
        while not IsScreenFadedIn() do Wait(10) end
    elseif type == "out" then
        DoScreenFadeOut(time)
        while not IsScreenFadedOut() do Wait(10) end
    end
end

return Utils
