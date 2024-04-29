ESX.RegisterServerCallback('xdxd_playerpanel:getOnlinePlayers', function(source, cb, nombre)
    local adminsOnline, policeOnline, emsOnline, mechanicOnline, taxiOnline, playersOnline = 0, 0, 0, 0, 0, 0
    for _, playerId in ipairs(GetPlayers()) do
        if ESX.GetPlayerFromId(playerId) then
            local xPlayer = ESX.GetPlayerFromId(playerId)
            local xPlayerGroup = xPlayer.getGroup()
            if xPlayerGroup ~= 'user' then
                adminsOnline=adminsOnline+1
            end
            local xPlayerJob = xPlayer.getJob().name
            if checkWhitelistedJobs(xPlayerJob, Config.PoliceJobs) then
                policeOnline=policeOnline+1
            elseif checkWhitelistedJobs(xPlayerJob, Config.AmbulanceJobs) then
                emsOnline=emsOnline+1
            elseif checkWhitelistedJobs(xPlayerJob, Config.MechanicJobs) then
                mechanicOnline=mechanicOnline+1
            elseif checkWhitelistedJobs(xPlayerJob, Config.TaxiJobs) then
                taxiOnline=taxiOnline+1
            end
        end
        playersOnline=playersOnline+1
    end
    local maxPlayersOnline = GetConvarInt("sv_maxclients", 0)
    local returnData = {
        adminsOnline, policeOnline, emsOnline, mechanicOnline, taxiOnline, playersOnline, maxPlayersOnline
    }
    cb(returnData)
end)

RegisterNetEvent('esx:setJob', function(player, job, lastJob)
    local isJobWhitelisted, isLastJobWhitelited = isWhitelistedJob(job.name), isWhitelistedJob(lastJob.name)
    if isJobWhitelisted or isLastJobWhitelited then
        local adminsOnline, policeOnline, emsOnline, mechanicOnline, taxiOnline, playersOnline = 0, 0, 0, 0, 0, 0
        for _, playerId in ipairs(GetPlayers()) do
            if ESX.GetPlayerFromId(playerId) then
                local xPlayer = ESX.GetPlayerFromId(playerId)
                local xPlayerGroup = xPlayer.getGroup()
                if xPlayerGroup ~= 'user' then
                    adminsOnline=adminsOnline+1
                end
                local xPlayerJob = xPlayer.getJob().name
                if checkWhitelistedJobs(xPlayerJob, Config.PoliceJobs) then
                    policeOnline=policeOnline+1
                elseif checkWhitelistedJobs(xPlayerJob, Config.AmbulanceJobs) then
                    emsOnline=emsOnline+1
                elseif checkWhitelistedJobs(xPlayerJob, Config.MechanicJobs) then
                    mechanicOnline=mechanicOnline+1
                elseif checkWhitelistedJobs(xPlayerJob, Config.TaxiJobs) then
                    taxiOnline=taxiOnline+1
                end
            end
            playersOnline=playersOnline+1
        end
        local returnData = {
            adminsOnline, policeOnline, emsOnline, mechanicOnline, taxiOnline, playersOnline
        }
        TriggerClientEvent("xdxd_playerpanel:update", -1, returnData)
    end
end)

function isWhitelistedJob(job)
    local jobs = { Config.PoliceJob, Config.AmbulanceJob, Config.Mechanic, Config.TaxiJob }
    local isWhitelisted = false
    for k,v in ipairs(jobs) do
        if v == job then
            isWhitelisted = true
            break
        end
    end
    return isWhitelisted
end

function checkWhitelistedJobs(job, jobsArray)
    for k,v in ipairs(jobsArray) do
        if v == job then
            return true
        end
    end
    return false
end