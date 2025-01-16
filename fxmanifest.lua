fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'mark'

-- ui_page_preload 'yes'
ui_page 'nui/index.html'

client_scripts {
    '@vrp/lib/utils.lua', -- Carrega a biblioteca do vRP
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua' -- Certifique-se de que este caminho está correto
}

-- client_script 'client.lua'

-- server_script 'server.lua'


files {
    'nui/index.html',
    'nui/script.js',
    'nui/style.css'
}
