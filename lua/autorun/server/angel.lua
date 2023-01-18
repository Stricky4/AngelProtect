AngelProtect = include("config.lua")
hook.Add('InitPostEntity','angel:Init',function()
    if AngelProtect.AutoUpdate then
        HTTP({
            url			= "url",
            method		= "get",
            headers		= header or {},
    
            success = function( code, body, headers )
    
                if ( !onsuccess ) then return end
    
                onsuccess( body, body:len(), headers, code )
    
            end,
    
            failed = function( err )
    
                if ( !onfailure ) then return end
    
                onfailure( err )
    
            end
        })
    end
end)