ESX = exports["es_extended"]:getSharedObject()
local searchedLocations = {}

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

local function sendNotification(playerId, message, type, position)
    TriggerClientEvent('hw_scrapyard:displayNotification', playerId, message, type, position)
end

function SelectItem()
    local rnd = math.random(1, 100)
    local cumulative = 0
    for itemName, itemData in pairs(Config.Items) do
        cumulative = cumulative + itemData.probability
        if rnd <= cumulative then
            return itemName, itemData.amount or 1
        end
    end
    return nil, 0
end

RegisterServerEvent('hw_scrapyard:collectScrap')
AddEventHandler('hw_scrapyard:collectScrap', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local selectedItem, amount = SelectItem()
    if Config.Debug then
        print("^0[^1DEBUG^0] ^5Selecting an item based on configured probabilities...")
    end
    if selectedItem then
        local canReceive = true
        if canReceive then
            xPlayer.addInventoryItem(selectedItem, amount)
            if Config.Debug then
                print("^0[^1DEBUG^0] ^5Player ^3" .. GetPlayerName(source) .. "^5 has collected ^3" .. amount .. " " .. selectedItem .. "^5.")
            end
            SendDiscordLog("Scrapyard Log", "Player " .. GetPlayerName(source) .. " collected " .. amount .. "x " .. selectedItem .. ".")
        end
    end
end)

