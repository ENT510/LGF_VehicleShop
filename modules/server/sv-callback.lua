local Framework = require "modules.bridge.server.server"
local Config    = require "modules.server.sv-config"

lib.callback.register("LGF_VehicleShop.Query.BuyVehicle", function(source, data)

    local ShopCoords = data.shopCoords
    local PlayerCoords = GetEntityCoords(GetPlayerPed(source))
    local netID = data.netID
    if not source or not data then return false  end

    local distance = #(PlayerCoords - vector3(ShopCoords.x, ShopCoords.y, ShopCoords.z))
    if distance > 3.0 then return false end

    exports.ox_inventory:RemoveItem(source, "money", data.price)

    local success = Framework.giveVehicle(source, data.props, 0, data.class or "")

    if success and Config.addKeyOnBuy then
        Config.exportAddVehicleKey(netID, data.props.plate)
    end

    return success
end)
