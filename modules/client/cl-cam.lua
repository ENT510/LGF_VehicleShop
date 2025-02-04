local Cam = {}
local camera

function Cam.StartCamera(vehicle, distance, height, pointEntity, offset)
    offset = offset or -1.0
    local camCoords = GetOffsetFromEntityInWorldCoords(vehicle, offset, distance, height)
    local newCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(newCam, camCoords.x, camCoords.y, camCoords.z)

    pointEntity = pointEntity or false


    local camRotation = GetEntityHeading(vehicle) + 180
    SetCamRot(newCam, 0.0, 0.0, camRotation)

    if pointEntity then
        PointCamAtEntity(newCam, vehicle, offset, 0.0, 0.0, true)
    end


    local coords = GetCamCoord(newCam)
    SetCamFov(newCam, 38.0)

    if Cam.ExistCam() then
        local transitionDuration = 1000
        SetCamActiveWithInterp(newCam, camera, transitionDuration, 1, 1)
        Wait(transitionDuration)
        DestroyCam(camera, false)
    else
        SetCamActive(newCam, true)
    end

    camera = newCam
    RenderScriptCams(true, true, 1350, 1, 0)

    SetCamUseShallowDofMode(newCam, true)
    SetCamNearDof(newCam, 1.2)
    SetCamFarDof(newCam, 22.0)
    SetCamDofStrength(newCam, 1.0)
    SetCamDofMaxNearInFocusDistance(newCam, 22.0)

    SetFocusEntity(vehicle)
    SetFocusArea(coords.x, coords.y, coords.z, 1.0, 1.0)


    ClearFocus()

    CreateThread(function()
        repeat
            SetUseHiDof()
            Wait(0)
        until not DoesCamExist(newCam)
    end)
end

function Cam.DestroyCamera()
    if camera then
        RenderScriptCams(false, true, 1250, 1, 0)
        DestroyCam(camera, false)
        ClearTimecycleModifier()
        camera = nil
    end
end

function Cam.ExistCam()
    return camera ~= nil
end

return Cam
