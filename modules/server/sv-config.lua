local Config = {}

Config.addKeyOnBuy = true

Config.exportAddVehicleKey = function(netid, plate)
    local vehicle = NetworkGetEntityFromNetworkId(netid)
    local plate = plate
end

return Config
