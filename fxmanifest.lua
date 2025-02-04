fx_version 'adamant'
game 'gta5'
author 'ENT510'
version '1.0.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua',
}

client_scripts {
    -- Stuff
    'modules/client/cl-config.lua',
    'modules/client/cl-utils.lua',
    'modules/client/cl-cam.lua',

    --Vehicle Shop
    'modules/client/cl-zone.lua',
    'modules/client/cl-main.lua',

    -- Framework
    'modules/bridge/client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'modules/server/sv-config.lua',
    'modules/server/sv-callback.lua',

    'modules/bridge/server/*.lua',
}
