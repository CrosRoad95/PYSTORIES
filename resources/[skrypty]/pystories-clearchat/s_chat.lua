--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local settings = {}
    settings.clearMessage = "* Chat został wyczyszczony przez %s, Powód: %s."
    settings.defaultMessage = "brak"

addCommandHandler("cc", function(player, _, ...)
    local isPlayerAdmin = getElementData(player, "player:admin")
    if not isPlayerAdmin then return false end
    local reason = table.concat({...}, " ")
    local reason = #reason > 0 and reason or settings.defaultMessage
    local playerName = getPlayerName(player):gsub("#%x%x%x%x%x%x", "")
    clearChatBox()
    if settings.clearMessage then
        local message = string.format(settings.clearMessage, playerName, reason)
        outputChatBox(message, getRootElement(), 255, 0, 0)
    end
end)