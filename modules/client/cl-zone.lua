local Config    = require "modules.client.cl-config"
local Utils     = require "modules.client.cl-utils"
local Client    = require "modules.client.cl-main"
local Cam       = require "modules.client.cl-cam"
local Framework = require "modules.bridge.client.client"
local Shared    = require "shared"
local Points    = {}
local Zone      = {}
Peds            = {}

function Zone.createZone(zoneID)
    local zoneData = Config.Zones[zoneID]
    if zoneData then
        local pedZone = zoneData.PedZone
        Zone.initializeZone(zoneID, pedZone)

        local blipData = zoneData.Blip
        if blipData and blipData.Enable then
            Utils.createBlip({
                coords = { x = pedZone.Position.x, y = pedZone.Position.y, z = pedZone.Position.z },
                sprite = blipData.Sprite,
                name = blipData.Label,
                scale = blipData.Scale,
                color = blipData.Color,
            })
        end
    end
end

function Zone.initializeZone(zoneID, pedZone)
    local point = lib.points.new({
        coords = pedZone.Position,
        distance = 5.0,
        onEnter = function() Zone.onEnter(zoneID, pedZone) end,
        onExit = function() Zone.onExit(zoneID) end,

        nearby = function(self)
            if Config.InteractionSystem == "textui" then
                Zone.nearby(zoneID, self)
            end
        end,
    })
    Points[zoneID] = point
end

function Zone.openShop(zoneID)
    if Config.Zones[zoneID].Jobs.OnlyJob then
        local playerJobData = Framework.getPlayerJobAndGrade()
        if not playerJobData then return end

        local playerJob = playerJobData.JobName
        local playerJobGrade = playerJobData.JobGrade
        local requiredJob = Config.Zones[zoneID].Jobs.RequiredJob
        local requiredGrade = Config.Zones[zoneID].Jobs.RequiredGradeJob

        if playerJob == requiredJob and tonumber(playerJobGrade) >= tonumber(requiredGrade) then
            Client.openMenuZone(zoneID)
        else
            Shared.notify("Access Denied",
                "You do not have the required job or grade to access this shop.", "error")
        end
    else
        Client.openMenuZone(zoneID)
    end
end

function Zone.addInteraction(zoneID, ped)
    if Config.InteractionSystem == "ox_target" then
        exports.ox_target:addLocalEntity(ped, {
            {
                icon = 'fa-solid fa-handcuffs',
                label = 'Open Vehicle Shop',
                drawSprite = true,
                onSelect = function(data)
                    local coordsCheck = #(GetEntityCoords(cache.ped) - vector3(data.coords.x, data.coords.y, data.coords.z))

                    if coordsCheck > 3 then
                        print("Probably cheater: Too far to access the shop")
                        return
                    end

                    Zone.openShop(zoneID)
                end,
            }
        })
    elseif Config.InteractionSystem == "textui" then
        exports.LGF_UiPack:showTextUi({
            title = "Open Vehicle Shop",
            message = "Press to open the vehicle shop",
            binder = "E",
            position = "right",
            backgroundColor = "rgba(31, 41, 55, 0.9)"
        })
    end
end

function Zone.removeInteraction(ped)
    if Config.InteractionSystem == "ox_target" then
        exports.ox_target:removeLocalEntity(ped)
    elseif Config.InteractionSystem == "textui" then
        exports.LGF_UiPack:hideTextUi()
    end
end

function Zone.onEnter(zoneID, pedZone)
    local ped = Utils.createPed({
        model = pedZone.Model,
        position = pedZone.Position,
        scenario = pedZone.Scenario,
    })

    Peds[zoneID] = ped
    if not DoesEntityExist(ped) then return end
    Zone.addInteraction(zoneID, ped)
end

function Zone.onExit(zoneID)
    if Peds[zoneID] then
        Zone.removeInteraction(Peds[zoneID])

        DeleteEntity(Peds[zoneID])
        Peds[zoneID] = nil
    end
end

if Config.InteractionSystem == "textui" then
    function Zone.nearby(zoneID, self)
        if self.currentDistance < 3 and IsControlJustReleased(0, 38) then
            Zone.openShop(zoneID)
            if LocalPlayer.state.textuiBusy then
                exports.LGF_UiPack:hideTextUi()
            end
        end
    end
end


function Zone.initializeAllZones()
    for zoneID, _ in pairs(Config.Zones) do
        Zone.createZone(zoneID)
    end
end

Zone.initializeAllZones()


AddEventHandler("onResourceStop", function(res)
    if cache.resource == res then
        for zoneID, ped in pairs(Peds) do
            Zone.removeInteraction(Peds[zoneID])
            DeleteEntity(ped)
            Peds[zoneID] = nil
        end

        for zoneID, point in pairs(Points) do
            point:remove()
            Points[zoneID] = nil
        end

        if LocalPlayer.state.contextBusy then
            exports.LGF_UiPack:hideContextMenu()
        end

        if LocalPlayer.state.textuiBusy then
            exports.LGF_UiPack:hideTextUi()
        end

        if Cam.ExistCam() then
            Cam.DestroyCamera()
        end

        Client.deleteVehiclePrew()
    end
end)

return Zone
