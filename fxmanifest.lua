fx_version 'cerulean'
game 'gta5'

author 'KNG'
description 'kng-slaughterhouse a script for collecting, processing and selling chicken and beef to make a little bit of cash.'
version '1.0'

dependencies {
	'qb-target',
	'qb-iventory' --CHANGE TO THE INVENTORY SCRIPT YOU USE
    --'ox-inventory'
    --'lj-inventory'
}

client_scripts {
    'cl_chicken.lua',
    'cl_beef.lua'
}

server_scripts {
    'sv_chicken.lua',
    'sv_beef.lua'
}
