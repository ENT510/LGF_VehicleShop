local Framework = {}
local ESX = GetResourceState('es_extended'):find('start') and exports['es_extended']:getSharedObject() or nil
local QB = GetResourceState('qb-core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local Legacy = GetResourceState('LEGACYCORE'):find('start') and exports.LEGACYCORE:GetCoreData() or nil
local Ox = GetResourceState('ox_core'):find('start') and require '@ox_core/lib/init' or nil
local QBX = GetResourceState('qbx_core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local Ndcore = GetResourceState('ND_Core'):find('start') and require '@ND_Core/init.lua' or nil


function Framework.getPlayerData(src)
    if Legacy then
        local PlayerData = Legacy.DATA:GetPlayerDataBySlot(src)
        if PlayerData then
            return PlayerData
        end
    elseif ESX then
        local PlayerData = ESX.GetPlayerFromId(src)
        if PlayerData then
            return PlayerData
        end
    elseif QB then
        local PlayerData = QB.Functions.GetPlayer(src).PlayerData
        if PlayerData then
            return PlayerData
        end
    elseif QBX then
        local PlayerData = exports.qbx_core:GetPlayer(src).PlayerData
        if PlayerData then
            return PlayerData
        end
    elseif Ox then
        local OxPlayer = Ox.GetPlayer(src)
        if not OxPlayer then return end
        return OxPlayer
    elseif Ndcore then
        local NdPlayer = Ndcore.getPlayer(src)
        if not NdPlayer then return end
        return NdPlayer
    end
end

function Framework.getIdentifier(src)
    local PlayerData = Framework.getPlayerData(src)
    if Legacy then
        return PlayerData.identifier
    elseif ESX then
        return PlayerData.identifier
    elseif QB or QBX then
        return PlayerData.license
    elseif Ndcore then
        return PlayerData.getLicense("identifier")
    end
end

function Framework.giveVehicle(src, props, stored, class)
    local playerData = Framework.getPlayerData(src)
    local identifier = Framework.getIdentifier(src)
    if ESX then
        MySQL.insert('INSERT INTO `owned_vehicles` (owner, plate, vehicle, stored) VALUES (?, ?, ?, ?)',
            { identifier, props.plate, json.encode(props), stored })
        return true
    elseif QB then
        MySQL.insert(
            'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            { identifier, playerData.citizenid, props.model, GetHashKey(props.model), json.encode(props), props.plate,
                stored, "A" })
        return true
    elseif Legacy then
        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, garage, stored) VALUES (?, ?, ?, ?,?)',
            { identifier, props.plate, json.encode(props), "A", stored })
        return true
    elseif Ox then
        props.plate   = Ox.GenerateVehiclePlate()
        local vin     = Ox.GenerateVehicleVin(props.model)
        local xPlayer = Ox.GetPlayer(src)

        MySQL.insert(
            'INSERT INTO `vehicles` (plate, vin, owner, model, class, data, stored) VALUES (?, ?, ?, ?, ?, ?, ?)',
            { props.plate, vin, xPlayer.charId, props.model, class, json.encode(props), "A" })
        return true
    elseif Ndcore then
        local nd_p = Framework.getPlayerData(src)
        nd_p.setVehicleOwned(src, props, stored)
        return true
    end
end

return Framework
