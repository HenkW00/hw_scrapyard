ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function SendDiscordLog(username, content, color)
    local discordWebhook = Config.DiscordWebhook
    local embeds = {
        {
            ["title"] = "Scrapyard Logs",
            ["description"] = content,
            ["type"] = "rich",
            ["color"] = color or 65280,
            ["footer"] = {
                ["text"] = "HW Scripts | Scrapyard",
            },
        }
    }
    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({username = username, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

local searchedLocations = {}

function SelectItem()
    local rnd = math.random(1, 100)
    local cumulative = 0
    for itemName, itemData in pairs(Config.Items) do
        cumulative = cumulative + itemData.probability
        if rnd <= cumulative then
            return itemName
        end
    end
    return nil
end

RegisterServerEvent('hw_scrapyard:collectScrap')
AddEventHandler('hw_scrapyard:collectScrap', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local selectedItem = SelectItem()
    if Config.Debug then
        print("^0[^1DEBUG^0] ^5Selecting an item based on configured probabilities...")
    end
    if selectedItem then
        local canReceive = true
        if canReceive then
            xPlayer.addInventoryItem(selectedItem, 1)
            if Config.Debug then
                print("^0[^1DEBUG^0] ^5Player ^3" .. GetPlayerName(source) .. "^5 has collected ^3" .. selectedItem .. "^5.")
            end
            SendDiscordLog("Scrapyard Log", "Player " .. GetPlayerName(source) .. " collected " .. selectedItem .. ".")
        end
    end
end)

