ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
-- end)

local searchedLocations = {}

function StartSearchAnimation(time)
    if Config.Debug then print("^0[^1DEBUG^0] ^5Starting search animation...") end
    TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true)
    Citizen.Wait(time)
    ClearPedTasks(PlayerPedId())
    if Config.Debug then print("^0[^1DEBUG^0] ^5Search animation finished.") end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for i, scrapLoc in ipairs(Config.ScrapLocations) do
            if not searchedLocations[i] and Vdist(playerCoords.x, playerCoords.y, playerCoords.z, scrapLoc.x, scrapLoc.y, scrapLoc.z) < 2 then
                ESX.ShowHelpNotification(_U('collect_scrap'))
                if IsControlJustReleased(0, 38) then 
                    ESX.ShowNotification(_U('while_searching'))
                    StartSearchAnimation(Config.SearchTime)
                    TriggerServerEvent('hw_scrapyard:collectScrap', i)
                    searchedLocations[i] = true
                    if Config.Debug then
                        print("^0[^1DEBUG^0] ^5Location ^3" .. i .. "^5 has been searched.")
                    end
                    Citizen.SetTimeout(Config.Timeout, function()
                        searchedLocations[i] = false
                        if Config.Debug then
                            print("^0[^1DEBUG^0] ^5Location ^3" .. i .. "^5 reset after cooldown.")
                        end
                    end)
                end
            end
        end
    end
end)

function CreateScrapBlips()
    for i=1, #Config.ScrapLocations, 1 do
        local scrapLoc = Config.ScrapLocations[i]

        local blip = AddBlipForCoord(scrapLoc.x, scrapLoc.y, scrapLoc.z)
        SetBlipSprite(blip, 365) 
        SetBlipDisplay(blip, 4) 
        SetBlipScale(blip, 0.7) 
        SetBlipColour(blip, 1) 
        SetBlipAsShortRange(blip, true) 

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Scrap Location")
        EndTextCommandSetBlipName(blip)
    end
end

CreateScrapBlips()