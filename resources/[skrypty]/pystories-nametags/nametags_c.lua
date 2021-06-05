--[[
    @author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
    @copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
    @license MIT
    @poprawił bover.
]]--

local sx, sy = guiGetScreenSize()

local nametag = {
    font = dxCreateFont("f/droid-sans.ttf", 10) or 'default-bold',
    scale = 1.10,
}

function nametag:render()
    local x, y, z = getElementPosition(localPlayer)
    for _, v in ipairs(getElementsWithinRange(x, y, z, 35, 'player', getElementInterior(localPlayer), getElementDimension(localPlayer))) do 
        local bonex, boney, bonez = getPedBonePosition(v, 8)
        local scx, scy, scz = getWorldFromScreenPosition(scx, scy, scz + 0.5)

        local fX, fY = math.floor(sx), math.floor(sy)

        local admin = tonumber(getElementData(v, 'player:level'))
        local premium = tonumber(getElementData(v, 'premium:level'))
        local mute = getElementData(v, 'mute:player')

        if admin == 1 then 
            rank = '[#01bf34Moderator#ffffff]'
        elseif admin == 2 then 
            rank = '[#ff0000Administrator#ffffff]'
        elseif admin == 3 then 
            rank = '[#a31303ROOT#ffffff]'
        elseif admin == 4 then 
            rank = '[#8F00FFPracownik Techniczny#ffffff]'
        elseif premium == 1 then 
            rank = '[#C0FF00Premium#ffffff]'
        elseif mute then 
            rank = '[#FFFF00Wyciszony#ffffff]'
        else 
            rank = '[Gracz]'
        end

        dxDrawText('#FFFFFF[#FFFFFF'..getElementData(player, 'id')..'#FFFFFF] #FFFFFF'..getPlayerName(player):gsub('#%x%x%x%x%x%x','')..'', fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametag.scale, nametag.font, 'center', 'center',false, false, false, true, true) -- ,false,true
		dxDrawText(rank, fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametag.scale, nametag.font, 'center', 'center', false, false, false, true, true)
    end
end

addEventHandler('onClientResourceStart', resourceRoot, function()
    for _, v in ipairs(getElementsByType('player')) do 
        setPlayerNametagShowing(v, false)
    end
end)

addEventHandler('onClientPlayerJoin', root, function()
    setPlayerNametagShowing(source, false)
end)
