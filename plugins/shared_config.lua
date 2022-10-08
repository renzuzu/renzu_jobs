config = {}
Plugins = {}
Plugins.EnableFoodjob = true -- burger shot and coffeebean job
Plugins.Job = {
	['fastfood'] = {
		Convert = {
			['buns'] = 'heatbread',
			['patty'] = 'cookpatty',
			['cup'] = 'cocacola',
			['coldfries'] = 'fries',
			['uncutlettuce'] = 'lettuce',
		},
		Recipes = {
			['torpedo_meal'] = {
				label = 'Torpedo Meal',
				ingredients = {
					['heatbread'] = {count = 1, label = 'Heat Bread'},
					['cookpatty'] = {count = 1, label = 'Cooked Patty'},
					['cocacola'] = {count = 1, label = 'Coca Cola'},
					['lettuce'] = {count = 1, label = 'Lettuce'},
				}
			},
			['meat_free_meal'] = {
				label = 'Meat Free Meal',
				ingredients = {
					['heatbread'] = {count = 1, label = 'Heat Bread'},
					['cookpatty'] = {count = 1, label = 'Cooked Patty'},
					['cocacola'] = {count = 1, label = 'Coca Cola'},
					['fries'] = {count = 1, label = 'French Cola'},
				}
			},
			['money_shot_meal'] = {
				label = 'Money Shot Meal',
				ingredients = {
					['heatbread'] = {count = 1, label = 'Heat Bread'},
					['cookpatty'] = {count = 2, label = 'Cooked Patty'},
					['cocacola'] = {count = 1, label = 'Coca Cola'},
					['fries'] = {count = 1, label = 'French Fries'},
				}
			},
			['heart_stopper'] = {
				label = 'Heart Stopper',
				ingredients = {
					['heatbread'] = {count = 1, label = 'Heat Bread'},
					['cookpatty'] = {count = 4, label = 'Cooked Patty'},
					['cheese'] = {count = 4, label = 'Cheese'},
				}
			},
		},
		Tasks = {
			['cook_bread'] = { label = 'Heat Bread', coord = vector4(-1202.1986083984,-897.11840820313,13.995121002197,126.51895904541), event = 'tasks', require = {item = 'buns', count = 1, command = 'bbq'}},
			['cook_patty'] = { label = 'Cook Patty', coord = vector4(-1199.7392578125,-900.66339111328,13.995118141174,123.74510955811), event = 'tasks', require = {item = 'patty', count = 1, command = 'bbq'}},
			['fill_cola'] = { label = 'Drinks', coord = vector4(-1199.2833251953,-894.68603515625,13.995124816895,136.26303100586), event = 'tasks', require = {item = 'cup', count = 1, command = 'mechanic4'}},
			['cook_fries'] = { label = 'Cook Fries', coord = vector4(-1201.0866699219,-898.67779541016,13.995115280151,138.04954528809), event = 'tasks', require = {item = 'coldfries', count = 1, command = 'bbq'}},
			['lettuce'] = { label = 'Chop Lettuce', coord = vector4(-1197.0970458984,-897.98345947266,13.995112419128,134.72758483887), event = 'tasks', require = {item = 'uncutlettuce', count = 1, command = 'mechanic'}},
		},
		Proccess = {
			['proccess'] = { label = 'Proccess', coord = vector4(-1199.4119873047,-898.62121582031,13.995115280151,318.23452758789), event = 'openrecipes', meal = 'torpedo_meal', command = 'mechanic'},
		},
	},
	['coffeebean'] = {
		Convert = {
			['cup'] = 'cupwater',
			['cupwater'] = 'hotwater',
			['flour'] = 'dough',
			-- ['patty'] = 'cookpatty',
			-- ['cup'] = 'cocacola',
			-- ['coldfries'] = 'fries',
			-- ['uncutlettuce'] = 'lettuce',
		},
		Recipes = {
			['latte'] = {
				label = 'Coffee Latte',
				ingredients = {
					['arabica'] = {count = 1, label = 'Arabica Powder'},
					['hotwater'] = {count = 1, label = 'Hot Water'},
				}
			},
			['cappuccino'] = {
				label = 'Cappuccino',
				ingredients = {
					['arabica'] = {count = 1, label = 'Arabica Powder'},
					['hotwater'] = {count = 1, label = 'Hot Water'},
					['milk'] = {count = 1, label = 'Milk'},
				}
			},
			['americano'] = {
				label = 'Coffee Americano',
				ingredients = {
					['arabica'] = {count = 1, label = 'Arabica Powder'},
					['hotwater'] = {count = 1, label = 'Hot Water'},
					['milk'] = {count = 2, label = 'Milk'},
				}
			},
			['donut'] = {
				label = 'Donut',
				ingredients = {
					['dough'] = {count = 1, label = 'Dough'},
					['caramel'] = {count = 1, label = 'Caramel'},
				}
			},
		},
		Tasks = {
			['water'] = { label = 'Fill Water', coord = vector4(-631.10455322266,223.5876159668,81.881446838379,182.48223876953), event = 'tasks', require = {item = 'cup', count = 1, command = 'mechanic'}},
			['hotwater'] = { label = 'Heat a Water', coord = vector4(-629.51409912109,223.59063720703,81.881530761719,182.46328735352), event = 'tasks', require = {item = 'cupwater', count = 1, command = 'mechanic'}},
			['dough'] = { label = 'Bake a dough', coord = vector4(-631.58728027344,224.8104095459,81.881462097168,84.455291748047), event = 'tasks', require = {item = 'flour', count = 1, command = 'mechanic'}},
			-- ['cook_patty'] = { label = 'Cook Patty', coord = vector4(-1199.7392578125,-900.66339111328,13.995118141174,123.74510955811), event = 'tasks', require = {item = 'patty', count = 1, command = 'bbq'}},
			-- ['fill_cola'] = { label = 'Drinks', coord = vector4(-1199.2833251953,-894.68603515625,13.995124816895,136.26303100586), event = 'tasks', require = {item = 'cup', count = 1, command = 'mechanic4'}},
			-- ['cook_fries'] = { label = 'Cook Fries', coord = vector4(-1201.0866699219,-898.67779541016,13.995115280151,138.04954528809), event = 'tasks', require = {item = 'coldfries', count = 1, command = 'bbq'}},
			-- ['lettuce'] = { label = 'Chop Lettuce', coord = vector4(-1197.0970458984,-897.98345947266,13.995112419128,134.72758483887), event = 'tasks', require = {item = 'uncutlettuce', count = 1, command = 'mechanic'}},
		},
		Proccess = {
			['proccess'] = { label = 'Proccess', coord = vector4(-627.97210693359,223.60313415527,81.881446838379,191.30862426758), event = 'openrecipes', meal = 'torpedo_meal', command = 'mechanic'},
		},
	},
	['daichi'] = {
		Convert = {
			['cup'] = 'cupwater',
			['cupwater'] = 'hotwater',
			['flour'] = 'dough',
			-- ['patty'] = 'cookpatty',
			-- ['cup'] = 'cocacola',
			-- ['coldfries'] = 'fries',
			-- ['uncutlettuce'] = 'lettuce',
		},
		Recipes = {
			['tokwat_baboy'] = {
				label = 'Tokwat Baboy',
				ingredients = {
					['tokwa'] = {count = 1, label = 'Tokwa'},
					['baboy'] = {count = 1, label = 'Baboy'},
					['onion'] = {count = 1, label = 'Onion'},
					['sili'] = {count = 1, label = 'Sili'},
				}
			},
			['pork_sisig'] = {
				label = 'Pork Sisig',
				ingredients = {
					['pork_belly'] = {count = 1, label = 'Pork Belly'},
					['onion'] = {count = 1, label = 'Onion'},
					['mayonnaise'] = {count = 1, label = 'Mayonnaise'},
					['sili'] = {count = 1, label = 'Sili'},
				}
			},
			['okinawa_milktea'] = {
				label = 'Okinawa Milktea',
				ingredients = {
					['tea'] = {count = 1, label = 'Tea'},
					['boba'] = {count = 1, label = 'Boba'},
					['okinawa_powder'] = {count = 2, label = 'Okinawa Powder'},
				}
			},
			['strawberry_shake'] = {
				label = 'Strawberry Shake',
				ingredients = {
					['crushed_ice'] = {count = 1, label = 'Crushed Ice'},
					['strawberry_powder'] = {count = 1, label = 'Strawberry Powder'},
					['milk'] = {count = 1, label = 'Milk'},
				}
			},
			['bangus_silog'] = {
				label = 'Bangus Silog',
				ingredients = {
					['rice'] = {count = 1, label = 'Rice'},
					['egg'] = {count = 1, label = 'Egg'},
					['frozen_bangus'] = {count = 1, label = 'Frozen bangus'},
				}
			},
			['tapsilog'] = {
				label = 'Tap Silog',
				ingredients = {
					['rice'] = {count = 1, label = 'Rice'},
					['egg'] = {count = 1, label = 'Egg'},
					['frozen_tapa'] = {count = 1, label = 'Frozen Tapa'},
				}
			},
		},
		Tasks = {
			-- ['water'] = { label = 'Fill Water', coord = vector4(-631.10455322266,223.5876159668,81.881446838379,182.48223876953), event = 'tasks', require = {item = 'cup', count = 1, command = 'mechanic'}},
			-- ['hotwater'] = { label = 'Heat a Water', coord = vector4(-629.51409912109,223.59063720703,81.881530761719,182.46328735352), event = 'tasks', require = {item = 'cupwater', count = 1, command = 'mechanic'}},
			-- ['dough'] = { label = 'Bake a dough', coord = vector4(-631.58728027344,224.8104095459,81.881462097168,84.455291748047), event = 'tasks', require = {item = 'flour', count = 1, command = 'mechanic'}},
			-- ['cook_patty'] = { label = 'Cook Patty', coord = vector4(-1199.7392578125,-900.66339111328,13.995118141174,123.74510955811), event = 'tasks', require = {item = 'patty', count = 1, command = 'bbq'}},
			-- ['fill_cola'] = { label = 'Drinks', coord = vector4(-1199.2833251953,-894.68603515625,13.995124816895,136.26303100586), event = 'tasks', require = {item = 'cup', count = 1, command = 'mechanic4'}},
			-- ['cook_fries'] = { label = 'Cook Fries', coord = vector4(-1201.0866699219,-898.67779541016,13.995115280151,138.04954528809), event = 'tasks', require = {item = 'coldfries', count = 1, command = 'bbq'}},
			-- ['lettuce'] = { label = 'Chop Lettuce', coord = vector4(-1197.0970458984,-897.98345947266,13.995112419128,134.72758483887), event = 'tasks', require = {item = 'uncutlettuce', count = 1, command = 'mechanic'}},
		},
		Proccess = {
			['proccess'] = { label = 'Proccess', coord = vector4(-1467.0257568359,-346.18301391602,44.780517578125,298.07049560547), event = 'openrecipes', meal = 'torpedo_meal', command = 'mechanic'},
		},
	}
}