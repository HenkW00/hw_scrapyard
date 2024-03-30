fx_version 'cerulean'
game 'gta5'

author 'HenkW'
description 'Simple scrapyard script for collecting items'
version '0.0.5'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua',
    'server/version.lua'
}

shared_scripts {
    'config.lua',
    '@es_extended/locale.lua',
    '@es_extended/imports.lua',
    'locales/en.lua'
}

dependency 'es_extended'