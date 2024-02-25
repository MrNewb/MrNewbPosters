fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'
name "MrNewbPosterJob"
author "MrNewb"
version "1.5.0"
shared_scripts {
	'@ox_lib/init.lua', --- comment this out if you dont for some reason use it?
	'config.lua'
}

client_scripts {
	'bridge/**/client.lua',
	'client/*.lua',
}

server_scripts {
	'bridge/**/server.lua',
	'server/*.lua',
}