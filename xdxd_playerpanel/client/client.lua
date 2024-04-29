local antiSpam = false
local clientTimeout = nil

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    Citizen.Wait(100)
    SendNUIMessage({
        action = 'setupHudColor',
        colors = Config.ColorHUD
    })
    if Config.EnableAdminsOnline then
        SendNUIMessage({
            action = 'enableAdminsOnline'
        })
    end
    if Config.AutoHide then
        SendNUIMessage({
            action = 'setupAutoHide',
            seconds = Config.HideSeconds
        })
    end
    if Config.ShowServerName then
        SendNUIMessage({
            action = 'enableServerName',
            name = Config.ServerName,
            color = Config.ServerNameColor
        })
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Citizen.Wait(100)
    SendNUIMessage({
        action = 'setupHudColor',
        colors = Config.ColorHUD
    })
    if Config.EnableAdminsOnline then
        SendNUIMessage({
            action = 'enableAdminsOnline'
        })
    end
    if Config.AutoHide then
        SendNUIMessage({
            action = 'setupAutoHide',
            seconds = Config.HideSeconds
        })
    end
    if Config.ShowServerName then
        SendNUIMessage({
            action = 'enableServerName',
            name = Config.ServerName,
            color = Config.ServerNameColor
        })
    end
end)

RegisterNetEvent('xdxd_playerpanel:update')
AddEventHandler('xdxd_playerpanel:update', function(playersData)
    if playersData ~= nil then
        SendNUIMessage({
            action = 'updatePlayersData',
            data = playersData
        })
    end
end)

RegisterNUICallback('getOnlinePlayers', function(data, cb)
    if Config.AntiSpamEvent then
        if antiSpam then
            cb('notok')
            return
        end
    end
    ESX.TriggerServerCallback('xdxd_playerpanel:getOnlinePlayers', function(playersData)
        if playersData then
            cb(playersData)
            if Config.AntiSpamEvent then
                if not antiSpam then
                    startAntiSpamEvent()
                end
            end
        else
            cb(false)
        end
    end, 'ok')
end)

RegisterCommand(Config.Command, function()
    SendNUIMessage({
        action = 'toggleScoreBoard'
    })
end)

RegisterKeyMapping(Config.Command, 'xdxd_playerpanel', 'keyboard', Config.ScoreBoardKey)

function startAntiSpamEvent()
    antiSpam = true
    clientTimeout = ESX.SetTimeout(Config.TimeoutEvent*1000, function() antiSpam = false clientTimeout = nil end)
end