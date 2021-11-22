config = {}
-- MAIN CONFIG
config.Mysql = 'mysql-async' -- "ghmattisql", "mysql-async"
config.esx = '1.2' -- 1.1 or 1.2 , 1.2 are v1final and esx legacy is compatible
config.css = 'new' -- new or old -- new = 4 column, old 2 column
config.logo = 'https://forum.cfx.re/uploads/default/original/4X/b/1/9/b196908c7e5dfcd60aa9dca0020119fa55e184cb.png' -- url of logo
config.keybinds = 'F6' -- Keybinds
config.commands = 'interaction'
config.esx_menu = true -- interaction menu if false, contextual menu
config.useOxInventory = false -- will disable all built in inventory of renzu_jobs, and will use the ox_inventory data

config.RandomAvatars = { -- if player pedshot is not uploaded yet, we will use Initials avatar
    [1] = {background = 'ffffff', color = '308BFF'},
    [2] = {background = 'E2E519', color = '222'},
    [3] = {background = 'FF306E', color = 'ffffff'},
    [4] = {background = 'F000FF', color = 'ffffff'},
    [5] = {background = '2F2730', color = 'ffffff'},
}

-- EXTRA CONFIG
config.useSociety = false -- if using esx_society, society money will transfer to owned database renzu_jobs.accounts (first load only) -- set this to false if you are unsure, and manually transfer your society money to this script
config.defaultjob = 'unemployed' -- will be use for firing employee
config.black_money_item = false -- if true you want to use a black_money as item not accounts from ESX

--IMAGE CONFIG
config.inventory = 'esx_inventoryhud' -- resource name of your inventory script, with image folder
config.inventoryImageUrl = 'https://cfx-nui-'..config.inventory..'/html/img/items/' -- a path from your inventory image -- verify the path
config.vehicleimage = 'https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/vehicle/' -- URL of vehicle image or path, default git contains local car image and some addon car image
-- vehicleimage can be path ex. img/items, img/vehicle -- you have to mannually upload all to this resource folder or use existing folder from resource ex. https://cfx-nui-RESOURCENAME/html/img/items/
-- images are configured to set extension as png for items, and jpg for vehicles
-- if image config is setup incorrectly, default images from github will be use and your custom item will be not showed

-- INTERACTION CONFIG
config.showmarker = true -- show drawmarker to show location point
config.usePopui = false -- https://github.com/renzuzu/renzu_popui -- if false, will only use drawmarker with floating text and Native isControlPressed
--config.zonemanage = true -- manually trigger the  interaction via Zone management, ex. polyzone -- if this is enable, you wont see any marker without adding the zone to your polyzone

-- WEBHOOK
config.discordwebhook = true -- enable disable webhook logs to discord

config.citizen_interaction = {
    --police
    [1] = {label = 'Check ID', name = 'police:identity_card'},
    [2] = {label = 'Search', name = 'police:search'},
    [3] = {label = 'Handcuff', name = 'police:cuff'},
    [4] = {label = 'Uncuff', name = 'police:uncuff'},
    [5] = {label = 'Drag', name = 'police:drag'},
    [6] = {label = 'Put in Vehicle', name = 'police:put_in_vehicle'},
    [7] = {label = 'Drag out in Vehicle', name = 'police:out_the_vehicle'},
    [8] = {label = 'Fine', name = 'police:fine'},
    [9] = {label = 'Unpaid Bills', name = 'police:unpaid_bills'},
    [10] = {label = 'Jail', name = 'esx-qalle-jail:openJailMenu'},
    [11] = {label = 'Manage License', name = 'police:managelicense'},
	[12] = {label = 'Gunshot Residue', name = 'police:gsrtest'},
    [13] = {label = 'Drug Swab Test', name = 'police:drugtest'},
    [14] = {label = 'Breathalizer', name = 'police:breathalizer'},
    --EMS   
    [15] = {label = 'Check BP', name = 'checkbp1'},
    [16] = {label = 'Revive Citizen', name = 'ems:revive'},
    [17] = {label = 'Drag', name = 'ems:drag'},
   -- [17] = {label = 'Revive Patient in Emergency Room', name = 'revive2'},
    [18] = {label = 'Heal Small Wounds', name = 'ems:small'},
    [19] = {label = 'Heal Big Wounds', name = 'ems:big'},
    [20] = {label = 'Search Dead in Area', name = 'ems:searchdeadinarea'},
    [21] = {label = 'Drag Dead Body', name = 'drag2'},
    [22]= {label = 'Carry', name = 'carry1'},
}
config.vehicle_interaction = {
    [1] = {label = 'Vehicle Information', name='police:vehicle_infos'},
    [2] = {label = 'Hijack', name='police:hijack'},
    [3] = {label = 'Impound', name='police:impound'},
    [4] = {label = 'Search Vehicle Plate#', name='police:searchdatabase'},

    [5] = {label = 'Hijack', name='mechanic:hijack'},
    [6] = {label = 'Clean', name='mechanic:clean'},
    [7] = {label = 'Scan ECU', name='mechanic:scanecu'},
    [8] = {label = 'Repair #1', name='mechanic:repair'},
    [9] = {label = 'Repair #2', name='mechanic:repair2'},


}

config.moneywashcoord = {
    entrance = vector3(259.70086669922,-782.91326904297,30.513477325439), 
    exit = vector3(1137.7464599609,-3198.9235839844,-39.665752410889)
}
config.MoneyWashOwner = 'police' -- job money income (tax) will go to this job, replace this to any job
config.MoneyWashTax = 0.05 -- 0.05 = 5% TAX, 0.1 = 10% , 0.5 50%
config.MoneyWash = {
    [1] = {coord = vector4(1122.3912353516,-3194.7260742188,-40.400051116943,354.4182434082), inuse = false},
    [2] = {coord = vector4(1123.9632568359,-3194.3732910156,-40.397888183594,15.791656494141), inuse = false},
    [3] = {coord = vector4(1125.5310058594,-3194.3220214844,-40.397579193115,0.35743966698647), inuse = false},
    [4] = {coord = vector4(1126.9295654297,-3194.3625488281,-40.397869110107,354.97473144531), inuse = false},
}
-- JOB Config
-- SAMPLE CONFIG
-- All Coordinates and permission for grades must be change for your own liking
config.Jobs = {
    -- example config for police job, you can copy the police config for other jobs
    ['police'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 9, -- minimum grade to access
            coord = vector3(462.08367919922,-985.65350341797,30.728076934814),
            label = 'Boss Action',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 9, -- minimum job grade can access this feature
                coord = vector3(459.78378295898,-984.77996826172,30.689691543579),
                label = 'Boss Inventory',
                slots = 100,
                event = 'renzu_jobs:openinventory',
            },
            ['Personal'] = { -- path inventory['Personal'][identifier]
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0,  
                coord = vector3(461.18109130859,-999.7529296875,30.689517974854),
                label = 'Personal Inventory',
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(463.08999633789,-999.70928955078,30.689517974854),
                label = 'Police Armory', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        -- ['weapon_armory'] = {
        --     webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(485.416015625,-995.29260253906,30.689649581909),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['wardrobe'] = {
            grade = 0,
            coord = vector3(463.5813293457,-996.51153564453,30.689487457275),
            label = 'Wardrobe',
            event = 'renzu_jobs:openwardrobe',
        },
        ['shop'] = {
            [1] = {
                webhook = 'https://discord.com/api/webhooks/911897226849177600/YHGLEPxw9Z_UkO4y6-qPSiUPOZMuB92xrIoG_9T0gOGKIqVOAmIvNmBId0EifMgqvJB6', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = false, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature,
                ['items'] = {
                    [1] = {name = 'WEAPON_ADVANCEDRIFLE', label = 'Advanced Rifle', value = false},
                    [2] = {name = 'WEAPON_PISTOL', label = 'Pistol', value = false},
                    [3] = {name = 'WEAPON_SMG', label = 'SMG', value = false},
                    [4] = {name = 'WEAPON_SMOKEGRENADE', label = 'Smoke Grenade', value = false},
                    [5] = {name = 'WEAPON_STUNGUN', label = 'Stun Gun', value = false},
                    [6] = {name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', value = false},
                },
                label = 'Weapon Supply',
                coord = vector3(485.416015625,-995.29260253906,30.689649581909),
                event = 'renzu_jobs:openshop',
            },
            [2] = {
                webhook = 'https://discord.com/api/webhooks/911897226849177600/YHGLEPxw9Z_UkO4y6-qPSiUPOZMuB92xrIoG_9T0gOGKIqVOAmIvNmBId0EifMgqvJB6', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = false, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'bread', label = 'Bread', value = false},
                    [2] = {name = 'water', label = 'Water', value = false}, -- if false its free
                    [3] = {name = 'ammo-rifle', label = '5.56mm Ammo', value = false}, -- use capitalize for weapon to avoid bugs
                    [4] = {name = 'ammo-9', label = '9mm Ammo', value = false}, -- use capitalize for weapon to avoid bugs
                    [5] = {name = 'lplparmor', label = 'Armor', value = false}, -- use capitalize for weapon to avoid bugs

                },
                label = 'Supply Shop',
                coord = vector3(481.28079223633,-995.30004882813,30.690622329712),
                event = 'renzu_jobs:openshop',
            },
        },
        ['crafting'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 0,
            coord = vector3(487.31411743164,-997.01416015625,30.689649581909),
            label = 'Police Crafting Table',
            event = 'renzu_jobs:opencrafting',
            craftable = {
                ['bread'] = {name = 'bread', label = 'Bread', type = 'item', seconds = 50, -- index/array name must be the same with item name, so we can fetch it easily later
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                    },
                },
                ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                        [2] = {name = 'water', amount = 1},
                        [3] = {name = 'lplparmor', amount = 1},
                    },
                },
            }  
        },
        ['vehicleshop'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 0, -- minimum job grade can access this feature
            label = 'Vehicle Shop',
            coord = vector3(444.59100341797,-1014.3021240234,28.588003158569),
            event = 'renzu_jobs:openvehicleshop',
            vehicles = {
                [1] = {model = 'police', label = 'Police Sedan', value = 10000, grade = 0},
                [2] = {model = 'police2', label = 'Police Sedan 2', value = 5000, grade = 0},
                [3] = {model = 'police3', label = 'Police Sedan 3', value = 5000, grade = 0},
                -- [4] = {model = 'police', label = 'Police Sedan', value = 10000, grade = 0},
                -- [5] = {model = 'police2', label = 'Police Sedan 2', value = 5000, grade = 0},
                -- [6] = {model = 'police3', label = 'Police Sedan 3', value = 5000, grade = 0},
            }
        },
        ['garage'] = {
            unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
            grade = 0, -- minimum job grade can access this feature
            label = 'Garage',
            coord = vector3(438.91528320312,-1013.6430664062,28.63551902771),
            spawn = vector4(435.22979736328,-1027.3572998047,28.454689025879,5.9837808609009),
            event = 'renzu_jobs:opengarage',
        },
        ['duty'] = {
            grade = 0,
            offdutyname = 'offpolice',
            coord = vector3(441.31072998047,-981.95007324219,30.689504623413),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },
        ['interaction'] = {
            ['Citizen Interaction'] = {
                [1] = {index = 1, grade = 0, type = 'citizen_interaction'},
                [2] = {index = 2, grade = 0, type = 'citizen_interaction'},
                [3] = {index = 3, grade = 0, type = 'citizen_interaction'},
                [4] = {index = 4, grade = 0, type = 'citizen_interaction'},
                [5] = {index = 5, grade = 0, type = 'citizen_interaction'},
                [6] = {index = 6, grade = 0, type = 'citizen_interaction'},
                [7] = {index = 7, grade = 0, type = 'citizen_interaction'},
                [8] = {index = 8, grade = 0, type = 'citizen_interaction'},
                [9] = {index = 9, grade = 0, type = 'citizen_interaction'},
                [10] = {index = 10, grade = 0, type = 'citizen_interaction'},
                [11]= {index = 11, grade = 0, type = 'citizen_interaction'},
                [12]= {index = 12, grade = 0, type = 'citizen_interaction'},
                [13]= {index = 13, grade = 0, type = 'citizen_interaction'},
                [14]= {index = 13, grade = 0, type = 'citizen_interaction'},


            },
            ['Vehicle Interaction'] = {
                [1] = {index = 1, grade = 0, type = 'vehicle_interaction'},
                [2] = {index = 2, grade = 0, type = 'vehicle_interaction'},
                [3] = {index = 3, grade = 0, type = 'vehicle_interaction'},
                [4] = {index = 4, grade = 0, type = 'vehicle_interaction'},

            },
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [4] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [5] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [6] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = true},
            },
            [7] = {
                access = {fire = false, withdraw = true, deposit = true, gradechange = true},
            },
            [8] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true},
            },
            [9] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
        },
    },

    -- other jobs sample
    ['mechanic'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = 'https://discord.com/api/webhooks/911896433597231154/835W5iyubiMbkSa01v4QFwJVwLGQRyLkLD6C3E1uU4xW6UnumsV-Ivwfnn1Pyy3iDleF', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 7, -- minimum grade to access
            coord = vector3(-605.43023681641,-918.86413574219,23.886613845825),
            label = 'Boss Action',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 7, -- minimum job grade can access this feature
                coord = vector3(-606.87542724609,-921.40362548828,23.886619567871),
                label = 'Boss Inventory',
                public = false,
                slots = 100,
                event = 'renzu_jobs:openinventory',
            },
            ['Personal'] = { -- path inventory['Personal'][identifier]
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0,  
                coord = vector3(-605.22998046875,-922.26544189453,23.886619567871),
                label = 'Personal Inventory',
                public = false,
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Stash'] = { -- path inventory['Stash']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-583.92401123047,-929.00762939453,23.886638641357),
                label = 'Bennys Inventory', -- same as stash
                public = true, -- stash mode or public inventory
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        -- ['weapon_armory'] = { -- DISABLE weapon armory?
        --     grade = 0, -- minimum job grade can access this feature
        --     coord = vector3(461.57052612305,-983.02404785156,30.689599990845),
        --     label = 'Weapon Armory',
        --     event = 'renzu_jobs:openweapons',
        -- },
        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-599.78326416016,-914.76440429688,23.886638641357),
            label = 'Wardrobe',
            event = 'renzu_jobs:openwardrobe',
        },
        ['shop'] = {
            [1] = {
                webhook = 'https://discord.com/api/webhooks/911896820077174794/xNqu2bYbx84UNUsbCNuJTfTZlTaemob_oBHum4GDTVKPPNKVI1pNtwlIqSjGf1wXRRGD', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = false, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'repairkit', label = 'Bread', value = 2500},
                    [2] = {name = 'stancerkit', label = 'Water', value = 25000}, -- if false its free
                },
                label = 'Supply Shop',
                coord = vector3(-593.89624023438,-935.77984619141,28.143844604492),
                event = 'renzu_jobs:openshop',
            },
            [2] = {
                webhook = 'https://discord.com/api/webhooks/911896720428924928/Xh0nO7ZLmK-zoadqu7fgs8sqF7d7b4QDFYOPkIiOAEbjNfxzIgtKeaeGJJJ9iqBmsSf7', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = true, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'repairkit', label = 'Repair Kit', value = 5000},
                    [2] = {name = 'stancerkit', label = 'Stancer Kit', vale = 50000}, -- if false its free
                },
                label = 'Parts Shop',
                coord = vector3(-591.22766113281,-930.75756835938,23.88663482666),
                event = 'renzu_jobs:openshop',
            },
        },
        ['crafting'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 0,
            coord = vector3(-584.04156494141,-938.95617675781,23.886476516724),
            label = 'Bennys Crafting Table',
            event = 'renzu_jobs:opencrafting',
            craftable = {
                ['turbo_sports'] = {name = 'turbo_sports', label = 'Turbo Sports', type = 'item', seconds = 150, -- index/array name must be the same with item name, so we can fetch it easily later
                    requirements = {
                        [1] = {name = 'steel', amount = 5},
                    },
                },
                -- ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
                --     requirements = {
                --         [1] = {name = 'bread', amount = 1},
                --         [2] = {name = 'water', amount = 1},
                --         [3] = {name = 'lplparmor', amount = 1},
                --     },
                -- },
            }  
        },
        ['vehicleshop'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 0, -- minimum job grade can access this feature
            label = 'Vehicle Shop',
            coord = vector3(-205.29267883301,-1326.2426757812,30.890409469604),
            event = 'renzu_jobs:openvehicleshop',
            vehicles = {
                [1] = {model = 'elegy', label = 'Elegy Sports', value = 10000, grade = 0},
                [2] = {model = 'sanchez', label = 'Sanchez Sports', value = 5000, grade = 0},
            }
        },
        ['garage'] = {
            unique = true, -- if true, only stored in this vehicle will show, false will show all owned_vehicles, true is good for job garage eg. police, false for everyone else gang etc..
            grade = 0, -- minimum job grade can access this feature
            label = 'Garage',
            coord = vector3(-210.30662536621,-1309.2847900391,31.292116165161),
            spawn = vector4(-220.96159362793,-1291.4146728516,30.621912002563,219.47317504883),
            event = 'renzu_jobs:opengarage',
        },
        ['interaction'] = {
            ['Vehicle Interaction'] = {
                [5] = {index = 5, grade = 0, type = 'vehicle_interaction'},
                [6] = {index = 6, grade = 0, type = 'vehicle_interaction'},
                [7] = {index = 7, grade = 0, type = 'vehicle_interaction'},
                [8] = {index = 8, grade = 0, type = 'vehicle_interaction'},
                [9] = {index = 9, grade = 0, type = 'vehicle_interaction'},

            },
        },

        ['duty'] = {
            grade = 0,
            offdutyname = 'offmechanic',
            coord = vector3(-588.63958740234,-931.27856445313,23.886638641357),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [4] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [5] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [6] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true},
            },
            [7] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
        }
    },

    ['ambulance'] = { -- gang sample
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = 'https://discord.com/api/webhooks/911894331957338143/WUPWJqZsElQKlZx6YI83S_3C2LjQDDDoAx1Pc_8PxmNgyG52sYSjRqzgX2CYNXJ2flNx', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 1, -- minimum grade to access
            coord = vector3(-509.99261474609,-300.22598266602,69.52303314209),
            label = 'Boss Action',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = 'https://discord.com/api/webhooks/911895118729060403/TQMAqrTN1nZtOLhAQ4JizkMJ18xcQYSdmujTadOac_DoWfQ0nhUCk1W-7ilK2FdWvHYt', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 1, -- minimum job grade can access this feature
                coord = vector3(-503.55572509766,-297.99731445313,69.523056030273),
                label = 'Boss Inventory',
                public = false,
                slots = 100,
                event = 'renzu_jobs:openinventory',
            },
            ['Personal'] = { -- path inventory['Personal'][identifier]
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0,  
                coord = vector3(-442.83520507813,-308.79080200195,35.347301483154),
                label = 'Personal Inventory',
                public = false,
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Stash'] = { -- path inventory['Stash']
                webhook = 'https://discord.com/api/webhooks/911895262207827989/SpA0LZIGGZcCJUiCkY-mvE64F_YpLxYuI-WYZmjPAVQLb-XlUqDa2dANQFITFswbExxw', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-445.16271972656,-309.66998291016,35.34729385376),
                label = 'Ambulance Inventory', -- same as stash
                public = true, -- stash mode or public inventory
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        ['duty'] = {
            grade = 0,
            offdutyname = 'offambulance',
            coord = vector3(-441.19866943359,-318.45568847656,34.910762786865),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },

        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-443.51016235352,-310.51705932617,34.910564422607),
            coord =  vector3(-437.70101928711,-308.63305664063,34.91056060791),
            label = 'Wardrobe',
            event = 'renzu_jobs:openwardrobe',
        },
        ['shop'] = { -- multi shop
            [1] = {
                webhook = 'https://discord.com/api/webhooks/911894814209998889/akzG79FM8YU_SituBha_xmdMoXqb9BgAEaYmlbKOSYkFGWmXOsswqceORI_Q4HH3VB3b', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = false, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'lpmedkit', label = 'Medkit', value = 2500},
                    [2] = {name = 'head_brace', label = 'Head Bandage', value = 1000}, -- if false its free
                    [3] = {name = 'leg_bandage', label = 'Leg Bandage', value = 1000}, -- if false its free
                    [4] = {name = 'arm_bandage', label = 'Arm Bandage', value = 1000}, -- if false its free
                    [5] = {name = 'body_bandage', label = 'Body Bandage', value = 1000}, -- if false its free
                    [6] = {name = 'tranquilizer', label = 'Tranquilizer', value = 1000}, -- if false its free
                    [7] = {name = 'bandagekit', label = 'Bandage Bundle', value = 5000}, -- if false its free

                },
                label = 'Supply Shop',
                coord = vector3(-456.96188354492,-309.54708862305,34.910816192627),
                event = 'renzu_jobs:openshop',
            },
            [2] = {
                webhook = 'https://discord.com/api/webhooks/911894595560935474/S5Imxz6sPlaD8il8e-j8MEdrieM6uBwIS47T-hzT6E_A-zjXYRylhaMO3p65IGQOdy1r', -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                public = true, -- if shop is public or for this job only. (income money will go to this job money)
                grade = 0, -- minimum job grade can access this feature
                ['items'] = {
                    [1] = {name = 'lpmedkit', label = 'Medkit', value = 5000},
                    [2] = {name = 'head_brace', label = 'Head Bandage', value = 2000}, -- if false its free
                    [3] = {name = 'leg_bandage', label = 'Leg Bandage', value = 2000}, -- if false its free
                    [4] = {name = 'arm_bandage', label = 'Arm Bandage', value = 2000}, -- if false its free
                    [5] = {name = 'body_bandage', label = 'Body Bandage', value = 2000}, -- if false its free
                    [6] = {name = 'tranquilizer', label = 'Tranquilizer', value = 5000}, -- if false its free
                    [7] = {name = 'bandagekit', label = 'Bandage Bundle', value = 10000}, -- if false its free


                },
                label = 'Pharmacy Shop',
                coord = vector3(-492.2314453125,-340.81802368164,42.320732116699),
                event = 'renzu_jobs:openshop',
            },
        },
        ['interaction'] = {
            ['Citizen Interaction'] = {
                [15] = {index = 15, grade = 0, type = 'citizen_interaction'},
                [16] = {index = 16, grade = 0, type = 'citizen_interaction'},
                [17] = {index = 17, grade = 0, type = 'citizen_interaction'},
                [18] = {index = 18, grade = 0, type = 'citizen_interaction'},
                [19] = {index = 19, grade = 0, type = 'citizen_interaction'},
                [20] = {index = 20, grade = 0, type = 'citizen_interaction'},


            },
            ['Vehicle Interaction'] = {
                [1] = {index = 1, grade = 0, type = 'vehicle_interaction'},
                [2] = {index = 2, grade = 0, type = 'vehicle_interaction'},
                [3] = {index = 3, grade = 0, type = 'vehicle_interaction'},
                [4] = {index = 4, grade = 0, type = 'vehicle_interaction'},

            },
        },

        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [4] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [5] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [6] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [7] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [8] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [9] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [10] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = false, salarychange = false},
            },
            [11] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = false, salarychange = false},
            },
            [12] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },

        }
    },
    ['burgershot'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 4, -- minimum grade to access
            coord = vector3(-1192.2130126953,-902.21466064453,13.998839378357),
            label = 'Boss Action',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Boss'] = { -- path inventory['Boss']
                webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
                grade = 4, -- minimum job grade can access this feature
                coord = vector3(-1191.1774902344,-903.51629638672,13.998838424683),
                label = 'Boss Inventory',
                slots = 100,
                event = 'renzu_jobs:openinventory',
            },
            ['Food Stock 1'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1203.0046386719,-895.44763183594,13.995127677917),
                label = 'Food Stuck 1', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Cups'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1190.1060791016,-904.84722900391,13.998837471008),
                label = 'Cups', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Ready Meals'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1197.0418701172,-893.88146972656,13.995121002197),
                label = 'Ready Meals', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        ['public_inventory'] = {
            ['Tray 1'] = {
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1195.2414550781,-892.13323974609,14.41511631012),
                label = 'Tray 1', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Tray 2'] = {
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-1193.8999023438,-894.16925048828,14.435131645203),
                label = 'Tray 2', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },

        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-1201.0423583984,-890.86187744141,13.995132446289),
            label = 'Wardrobe',
            event = 'renzu_jobs:openwardrobe',
        },

        ['crafting'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 0,
            coord = vector3(438.80059814453,-992.654296875,30.689607620239),
            label = 'Police Crafting Table',
            event = 'renzu_jobs:opencrafting',
            craftable = {
                ['bread'] = {name = 'bread', label = 'Bread', type = 'item', seconds = 50, -- index/array name must be the same with item name, so we can fetch it easily later
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                    },
                },
                ['WEAPON_PISTOL'] = {name = 'WEAPON_PISTOL', label = 'Pistol', type = 'weapon', seconds = 30,
                    requirements = {
                        [1] = {name = 'bread', amount = 1},
                        [2] = {name = 'water', amount = 1},
                        [3] = {name = 'lplparmor', amount = 1},
                    },
                },
            }  
        },

        ['duty'] = {
            grade = 0,
            offdutyname = 'offburger',
            coord = vector3(-1178.3084716797,-891.86492919922,13.799625396729),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },
        ['interaction'] = {
            ['Citizen Interaction'] = {

            },
            ['Vehicle Interaction'] = {

            },
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
            [4] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
        },
    },

    ['coffeebean'] = {
        ['max_salary'] = 1000000, -- maximum ammount of salary can be changed from boss action
        ['bossmenu'] = {
            webhook = false, -- change this to your webhook link, if this a false, its mean no loggin at all, ex. 'https://discord.com/api/webhooks/883246462****'
            grade = 4, -- minimum grade to access
            coord = vector3(-635.92047119141,234.1863861084,81.881446838379),
            label = 'Boss Action',
            event = 'renzu_jobs:openbossmenu',
        },
        ['inventory'] = {
            ['Stocks'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-631.93328857422,228.02394104004,81.881454467773),
                label = 'Stocks', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
            ['Storage'] = { -- path inventory['Stash']
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-634.28405761719,225.67178344727,81.88151550293),
                label = 'Storage', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },
        ['public_inventory'] = {
            ['Coffee Tray 1'] = {
                webhook = false, -- false to not logs else a string of discord webhook link
                grade = 0, -- minimum job grade can access this feature
                coord = vector3(-634.66302490234,235.37063598633,82.541488647461),
                label = 'Coffee Tray 1', -- same as stash
                slots = 20,
                event = 'renzu_jobs:openinventory',
            },
        },

        ['wardrobe'] = {
            grade = 0,
            coord = vector3(-634.896484375,227.9750213623,81.881332397461),
            label = 'Wardrobe',
            event = 'renzu_jobs:openwardrobe',
        },
        ['duty'] = {
            grade = 0,
            offdutyname = 'offcoffeebean',
            coord = vector3(-618.4921875,239.50148010254,81.883865356445),
            label = 'On/Off Duty',
            event = 'renzu_jobs:duty',
        },
        ['interaction'] = {
            ['Citizen Interaction'] = {

            },
            ['Vehicle Interaction'] = {

            },
        },
        ['grade'] = { -- grade access , pay attention to the perms, grade int is the index number of array
            [0] = { -- example grade = 0, ex. cadet? lowest rank, grade can be found in job_grades database table
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [1] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [2] = {
                access = {fire = false, withdraw = false, deposit = false, gradechange = false},
            },
            [3] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
            [4] = {
                access = {fire = true, withdraw = true, deposit = true, gradechange = true, givebonus = true, salarychange = true},
            },
        },
    },
}