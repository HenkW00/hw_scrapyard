Config = {}

--------------
----LOCALE----
--------------
Config.Locale = 'en'

--------------
----ADMIN-----
--------------
Config.Debug = true
Config.checkForUpdates = true
Config.DiscordWebhook = "https://discord.com/api/webhooks/1223448144231010445/5HzRcvKtX-NK3nAhfGCjcTlTp3A8LxZEwEFfXbgMqXjKzB3kNf7vob0uyuRLDpCME2Go"

---------------
---SCRAPYARD---
---------------
Config.SearchTime = 5000 
Config.Timeout = 60000

---------------
---LOCATIONS---
---------------
Config.ScrapLocations = {
    {x = 2426.43, y = 3147.01, z = 48.15},
    {x = 2409.96, y = 3147.02, z = 48.24},
    {x = 2399.64, y = 3140.11, z = 48.17},
}

--------------
----ITEMS-----
--------------
Config.Items = {
    ['scrap_metal'] = {
        probability = 60,
    },
    ['iron'] = {
        probability = 30,
    },
    ['steel'] = {
        probability = 10,
    },
}