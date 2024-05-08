fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'HenkW'
description 'Simple scrapyard script for collecting items'
version '0.1.8'

files {
    'locales/*.json'
}

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
    '@ox_lib/init.lua'
}

dependencies {
    'es_extended',
    'ox_lib'
}
