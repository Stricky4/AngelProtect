if game.SinglePlayer() then return end
if !AngelProtect or !AngelProtect.Key then return  "[AngelProtect]: invalid key" end
AngelProtect.BypassId = AngelProtect.BypassId or {}
gameevent.Listen( "player_connect" )
AngelProtect.PlayerConnect = function( data )
    if AngelProtect.Key and data.bot == 1 or AngelProtect.BypassId[data.networkid] then return end
    HTTP({
        url			= "url",
		method		= "post",
		parameters	= {key = AngelProtect.Key,ip = data.address,steamid = data.networkid},
		headers		= {},
		success = function( c, b )
            if b == "Invalid Key" then AngelProtect.Key = nil return print("[AngelProtect]: invalid key") end
            if b == "1" then
                return game.KickID(data.networkid,"  [AngelProtect]: Your are banner!\nError?: https://discord.gg/89Ge2yPNPQ")
            end
            AngelProtect.PlayerConnect(data)
		end,
        failed = function( e )print( "[AngelProtect] Error: ",e )end
    })
end
hook.Add("player_connect", "AngelProtect:PlayerConnected", AngelProtect.PlayerConnect)