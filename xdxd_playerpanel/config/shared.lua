Config = {}

Config.Command = "playerpanel" -- Player Panel command || Player Panel parancs
Config.ColorHUD = { r = 255, g = 0, b = 0 } --> Default color is red || Alap szín a piros
Config.AutoHide = true
Config.HideSeconds = 5
Config.EnableAdminsOnline = true
Config.PoliceJobs = {
    "police",
    --"sheriff", --Example || Példa
}
Config.AmbulanceJobs = {
    "ambulance",
    --"doctor" --Example || Példa
}
Config.MechanicJobs = {
    "mechanic",
    --"mechanic2" --Example || Példa
}
Config.TaxiJob = "taxi"
Config.TaxiJobs = {
    "taxi",
    --"uber", --Example || Példa
}
Config.ScoreBoardKey = "F9"
Config.ShowServerName = true
Config.ServerName = "Server Name Here"
Config.ServerNameColor = "white" --> CSS colors -> rgb, hex, name. || CSS színek -> rgb, hex, name
Config.onlineText = 'Online'
Config.offlineText = 'Offline'

-- AntiSpam Config
Config.AntiSpamEvent = false --> [ IMPROVE PERFORMANCE FOR BIG SERVERS ] | May cause more than 0.4ms on server side without AntiSpamEvent || [ NAGY SZERVEREK TELJESÍTMÉNYE JAVÍTÁSA ] | Több mint 0,4 ms-ot okozhat a szerver oldalon AntiSpamEvent nélkül
Config.TimeoutEvent = 30 --> Seconds to prevent spam event (getOnlinePlayers) / Seconds to refresh client cache of players online || Másodpercek a spamesemények megelőzésére (getOnlinePlayers) / Másodpercek az online játékosok kliens gyorsítótárának frissítésére