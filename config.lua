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
    {x = 2426.45, y = 3123.14, z = 48.17},
    {x = 2417.75, y = 3124.24, z = 48.27},
    {x = 2409.56, y = 3123.42, z = 48.27},
    {x = 2410.66, y = 3118.09, z = 48.32},
    {x = 2418.69, y = 3115.75, z = 48.22},
    {x = 2413.06, y = 3088.09, z = 48.35},
    {x = 2399.77, y = 3090.6, z = 48.15},
    {x = 2399.38, y = 3080.23, z = 49.28},
    {x = 2379.79, y = 3091.34, z = 48.57},
    {x = 2405.37, y = 3150.54, z = 48.33},
}

--------------
----ITEMS-----
--------------
Config.Items = {
    ['metal'] = {
        probability = 60,
        amount = 3,
    },
    ['iron'] = {
        probability = 30,
        amount = 2,
    },
    ['steel'] = {
        probability = 10,
        amount = 2,
    },
}