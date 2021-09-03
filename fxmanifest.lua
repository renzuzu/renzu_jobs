fx_version 'cerulean'
-- Renzu Jobs Util
-- MADE BY Renzuzu
game 'gta5'

lua54 'on'
-- is_cfxv2 'yes'
-- use_fxv2_oal 'true'

ui_page {
    'html/index.html',
}

client_scripts {
	"@es_extended/locale.lua",
  	"@es_extended/locales/en.lua",
	"weaponconfig.lua",
	"config.lua",
	"weapons.lua",
	"client.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"config.lua",
	"server.lua"
}

files {
	'html/index.html',
	'html/script.js',
	'html/*.css',
	'html/img/**/*.png',
}