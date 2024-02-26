if Config.Interact ~= "ox" then return end

if Config.debug then print("Using ox_target for interaction") end

local sphereZones = {}

function CreateActiveSpot(data)
    if not data then return end
    local parameters = {
        name = "ActivePosterCoords",
        coords = data.coords,
        radius = 3.0,
        debug = Config.debug,
        drawSprite = true,
        options = {
            {
                --name = 'sphere',
                --event = 'ox_target:debug',
                icon = 'fa-solid fa-circle',
                label = 'Place Poster',
                onSelect = function()
                    placeScene()
                end,
            }
        }
    }

    local zoneId = exports.ox_target:addSphereZone(parameters)
    table.insert(sphereZones, zoneId)
end

function RemoveActiveSpot(data)
    if not data then return end
    for _, zoneId in ipairs(sphereZones) do
        exports.ox_target:removeZone(zoneId)
    end
    sphereZones = {}
end
