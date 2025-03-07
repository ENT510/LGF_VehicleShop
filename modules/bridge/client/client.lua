local Framework = {}
local ESX = GetResourceState('es_extended'):find('start') and exports['es_extended']:getSharedObject() or nil
local QB = GetResourceState('qb-core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local Legacy = GetResourceState('LEGACYCORE'):find('start') and exports.LEGACYCORE:GetCoreData() or nil
local Ox = GetResourceState('ox_core'):find('start') and require '@ox_core/lib/init' or nil
local QBX = GetResourceState('qbx_core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local Ndcore = GetResourceState('ND_Core'):find('start') and exports["ND_Core"]:GetCoreObject() or nil

function Framework.getPlayer()
    if Legacy then
        local Player = Legacy.DATA:GetPlayerObject()
        if not Player then return nil end
        return Player
    elseif ESX then
        local Player = ESX.GetPlayerData()
        if not Player then return nil end
        return Player
    elseif QB then
        local Player = QB.Functions.GetPlayerData()
        if not Player then return nil end
        return Player
    elseif QBX then
        local Player = exports.qbx_core:GetPlayerData()
        if not Player then return nil end
        return Player
    elseif Ox then
        local OxPlayer = Ox.GetPlayer()
        if not OxPlayer then return nil end
        return OxPlayer
    elseif Ndcore then
        local Player = Ndcore.getPlayer()
        if not Player then return nil end
        return Player
    end
end

function Framework.getPlayerJobAndGrade()
    local playerData = Framework.getPlayer()
    if not playerData then return nil end
    local data = { JobName = nil, JobGrade = nil }


    if Legacy then
        if playerData.JobName and playerData.JobGrade then
            data.JobName = playerData.JobName
            data.JobGrade = playerData.JobGrade
        end
    elseif ESX then
        if playerData.job then
            data.JobName = playerData.job.name
            data.JobGrade = playerData.job.grade
        end
    elseif QB or QBX then
        if playerData.job then
            data.JobName = playerData.job.name
            data.JobGrade = playerData.job.grade
        end
    elseif Ox then
        local activeGroup = playerData.get('activeGroup')
        if not activeGroup then return end
        local JobName = activeGroup
        local JobGrade = playerData.getGroup(activeGroup)
        if JobName and JobGrade then
            data.JobName = JobName
            data.JobGrade = JobGrade
        end
    elseif Ndcore then
        if playerData.job and playerData.jobInfo then
            data.JobName = playerData.job
            data.JobGrade = playerData.jobInfo.rank
        end
    end


    return data
end

return Framework
