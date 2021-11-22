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

shared_scripts {
	'/plugins/shared_*.lua'
}
client_scripts {
	"@es_extended/locale.lua",
  	"@es_extended/locales/en.lua",
	"weaponconfig.lua",
	"config.lua",
	"weapons.lua",
	"client.lua",
	'plugins/**/cl_*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"config.lua",
	"server.lua",
	'plugins/**/sv_*.lua',
}

files {
	'html/index.html',
	'html/script.js',
	'html/*.css',
	'html/img/**/*.png',
}