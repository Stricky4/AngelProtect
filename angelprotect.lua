if game.SinglePlayer() then return end
if !AngelProtect or !AngelProtect.Key then return  "[AngelProtect]: invalid key" end
AngelProtect.BypassId = AngelProtect.BypassId or {}
gameevent.Listen( "player_connect" )
hook.Add("player_connect", "AngelProtect:PlayerConnected", function( data )
    if data.bot == 1 or AngelProtect.BypassId[data.networkid] then return end
    HTTP({
        url			= "url",
		method		= "post",
		parameters	= {
            key = 
            ip = data.address,
            steamid = data.networkid
        },
		headers		= {},

		success = function( c, b )
            if b == "1" then
                game.KickID(data.networkid,"  [AngelProtect]: Your are banner!\nError?: https://discord.gg/89Ge2yPNPQ")
            end

		end,
        failed = function( e )
            print( 'AngelProtectError: ',e )
        end
    })
end)