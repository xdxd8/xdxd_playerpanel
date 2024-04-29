fx_version 'bodacious'
game 'gta5'

author 'xd.xd'
version '1.0.0'

ui_page 'html/main.html'

files {
    'html/*.*',
}

client_script 'client/client.lua'
server_script 'server/server.lua'
shared_scripts {
    'config/shared.lua',
    '@es_extended/imports.lua'
}

