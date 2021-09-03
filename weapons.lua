
Config = {}
Config.Locale = 'en'
Config.DefaultWeaponTints = {
	[0] = _U('tint_default'),
	[1] = _U('tint_green'),
	[2] = _U('tint_gold'),
	[3] = _U('tint_pink'),
	[4] = _U('tint_army'),
	[5] = _U('tint_lspd'),
	[6] = _U('tint_orange'),
	[7] = _U('tint_platinum')
}

Config.Weapons = {
	{
		name = 'WEAPON_PISTOL',
        weight = 0.5,
		label = _U('weapon_pistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 0,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_PISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_PISTOL_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_COMBATPISTOL',
        weight = 0.5,
		label = _U('weapon_combatpistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 2,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER')}
		}
	},

	{
		name = 'WEAPON_APPISTOL',
        weight = 0.5,
		label = _U('weapon_appistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 5,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_APPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_APPISTOL_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_PISTOL50',
        weight = 0.5,
		label = _U('weapon_pistol50'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_PISTOL50_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_PISTOL50_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_SNSPISTOL',
        weight = 0.3,
		label = _U('weapon_snspistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 6,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_SNSPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')}
		}
	},

	{
		name = 'WEAPON_HEAVYPISTOL',
        weight = 0.7,
		label = _U('weapon_heavypistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 8,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_VINTAGEPISTOL',
        weight = 0.5,
		label = _U('weapon_vintagepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 1,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_02')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')}
		}
	},

	{
		name = 'WEAPON_MACHINEPISTOL',
        weight = 0.5,
		label = _U('weapon_machinepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 4,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_03')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')}
		}
	},

	{name = 'WEAPON_REVOLVER', mingrade = 8, label = _U('weapon_revolver'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')}},
	{name = 'WEAPON_MARKSMANPISTOL', mingrade = 8, label = _U('weapon_marksmanpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')}},
	{name = 'WEAPON_DOUBLEACTION', mingrade = 7, label = _U('weapon_doubleaction'), components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')}},

	{
		name = 'WEAPON_SMG',
        weight = 1.0,
		label = _U('weapon_smg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 2,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_SMG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_SMG_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_SMG_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_SMG_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_ASSAULTSMG',
        weight = 1.0,
		label = _U('weapon_assaultsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 6,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER')}
		}
	},

	{
		name = 'WEAPON_MICROSMG',
        weight = 1.0,
		label = _U('weapon_microsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 4,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_MICROSMG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_MICROSMG_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_MINISMG',
        weight = 1.0,
		label = _U('weapon_minismg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 4,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_MINISMG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_MINISMG_CLIP_02')}
		}
	},

	{
		name = 'WEAPON_COMBATPDW',
        weight = 1.0,
		label = _U('weapon_combatpdw'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SMG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 3,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')}
		}
	},

	{
		name = 'WEAPON_PUMPSHOTGUN',
        weight = 2.0,
		label = _U('weapon_pumpshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 5,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_SR_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER')}
		}
	},
	
	
	{
		name = 'WEAPON_PISTOL_MK2',
        weight = 1.0,
		label = "Pistol MK2",
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_PISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_PISTOL_MK2_CLIP_02` },
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP_02` },
		
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_PISTOL_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = _U('component_round_hollow'), hash = `COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_PISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_PISTOL_MK2_CLIP_FMJ` },
		
			{ name = 'compensator', label = _U('component_compensator'), hash = `COMPONENT_AT_PI_COMP` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_PISTOL_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_PISTOL_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_PISTOL_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_PISTOL_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_PISTOL_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_PISTOL_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_PISTOL_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_PISTOL_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_PISTOL_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_PISTOL_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01` },
		}
	},
	
	{	
		name = 'WEAPON_REVOLVER_MK2',
        weight = 1.0,
		label = _U('weapon_revolver_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_REVOLVER_MK2_CLIP_01` },
			
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_REVOLVER_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = _U('component_round_hollow'), hash = `COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_REVOLVER_MK2_CLIP_FMJ` },


			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
			
			{ name = 'compensator', label = _U('component_compensator'), hash = `COMPONENT_AT_PI_COMP_03` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_REVOLVER_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_REVOLVER_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_REVOLVER_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_REVOLVER_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_REVOLVER_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_REVOLVER_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_REVOLVER_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_REVOLVER_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_REVOLVER_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_REVOLVER_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_REVOLVER_MK2_CAMO_IND_01` },
		}
	},
	
	{	
		name = 'WEAPON_SNSPISTOL_MK2',
        weight = 1.0,
		label = _U('weapon_snspistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_PISTOL')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_02` },

			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_TRACER` },
			{ name = 'rounds_hollow', label = _U('component_round_hollow'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_SNSPISTOL_MK2_CLIP_FMJ` },


			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_PI_FLSH` },

			{ name = 'scope_mounted', label = _U('component_scope_mounted'), hash = `COMPONENT_AT_PI_RAIL_02` },
			
			{ name = 'compensator', label = _U('component_compensator'), hash = `COMPONENT_AT_PI_COMP_02` },
			
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_PI_SUPP_02` },

			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_boom'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE` },
		}
	},
	
	{
		name = 'WEAPON_PUMPSHOTGUN_MK2',
        weight = 2.0,
		label = _U('weapon_pumpshotgun_mk2'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_01` },
			
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_hollow', label = _U('component_round_hollow'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'rounds_explosive', label = _U('component_round_explosive'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_SR_SUPP_03` },
			
			{ name = 'muzzle_flat', label = _U('component_muzzle_squared'), hash = `COMPONENT_AT_MUZZLE_08` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
        weight = 2.0,
		label = _U('weapon_sawnoffshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_ASSAULTSHOTGUN',
        weight = 2.0,
		label = _U('weapon_assaultshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
		}
	},

	{
		name = 'WEAPON_BULLPUPSHOTGUN',
        weight = 2.0,
		label = _U('weapon_bullpupshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
		}
	},

	{
		name = 'WEAPON_HEAVYSHOTGUN',
        weight = 2.0,
		label = _U('weapon_heavyshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
		}
	},
	
	

	{name = 'WEAPON_DBSHOTGUN', mingrade = 9,label = _U('weapon_dbshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')}},
	{name = 'WEAPON_AUTOSHOTGUN', mingrade = 9,label = _U('weapon_autoshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey('AMMO_SHOTGUN')}},
	{name = 'WEAPON_MUSKET', mingrade = 9,label = _U('weapon_musket'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SHOTGUN')}},

	{
		name = 'WEAPON_ASSAULTRIFLE',
        weight = 2.0,
		label = _U('weapon_assaultrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE')}
		}
	},
	
	{
		name = 'WEAPON_ASSAULTRIFLE_MK2',
        weight = 2.0,
		label = _U('weapon_assaultrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01` },
		}
	},
	

	{
		name = 'WEAPON_CARBINERIFLE',
        weight = 2.0,
		label = _U('weapon_carbinerifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 0,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')},
			{name = 'clip_box', label = _U('component_clip_box'), hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')}
		}
	},
	
		{
		name = 'WEAPON_CARBINERIFLE_MK2',
        weight = 2.0,
		label = _U('weapon_carbinerifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_CR_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_CR_BARREL_02` },
			
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01` },
		}
	},
	

	{
		name = 'WEAPON_ADVANCEDRIFLE',
        weight = 2.0,
		label = _U('weapon_advancedrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_SPECIALCARBINE',
        weight = 2.0,
		label = _U('weapon_specialcarbine'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_03')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER')}
		}
	},
	
	{
		name = 'WEAPON_SPECIALCARBINE_MK2',
        weight = 2.0,
		label = _U('weapon_specialcarbine_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SC_BARREL_02` },
			
			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02` },
			
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01` },
		}
	},

	{
		name = 'WEAPON_BULLPUPRIFLE',
        weight = 2.0,
		label = _U('weapon_bullpuprifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 6,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_BULLPUPRIFLE_VARMOD_LOW')}
		}
	},
	
	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
        weight = 2.0,
		label = _U('weapon_bullpuprifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02` },
			
			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_macro', label = _U('component_scope_macro'), hash = `COMPONENT_AT_SCOPE_MACRO_02_MK2` },
			{ name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_BP_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_BP_BARREL_02` },
			
			{ name = 'suppressor', label = _U('component_scope'), hash = `COMPONENT_AT_AR_SUPP` },
			
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01` },
		}
	},
	
	{
		name = 'WEAPON_COMBATMG_MK2',
        weight = 5.0,
		label = _U('weapon_combatmg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_MG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_COMBATMG_MK2_CLIP_02` },

			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_COMBATMG_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_COMBATMG_MK2_CLIP_FMJ` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'scope_small', label = _U('component_scope_small'), hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_MG_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_MG_BARREL_02` },
					
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
						
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_COMBATMG_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_COMBATMG_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_COMBATMG_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_COMBATMG_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_COMBATMG_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_COMBATMG_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_COMBATMG_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_COMBATMG_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_COMBATMG_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_COMBATMG_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_COMBATMG_MK2_CAMO_IND_01` },
		}
	},
	
	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
        weight = 5.0,
		label = _U('weapon_heavysniper_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02` },

			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ` },
			{ name = 'rounds_explosive', label = _U('component_round_explosive'), hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE` },

			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_SR_SUPP_03` },

			{ name = 'scope_large', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_LARGE_MK2` },
			{ name = 'scope_zoom', label = _U('component_scope_zoom'), hash = `COMPONENT_AT_SCOPE_MAX` },
			{ name = 'scope_nightvision', label = _U('component_scope_nightvision'), hash = `COMPONENT_AT_SCOPE_NV` },
			{ name = 'scope_thermal', label = _U('component_scope_nightvision'), hash = `COMPONENT_AT_SCOPE_THERMAL` },


			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_SR_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_SR_BARREL_02` },
					
			{ name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = `COMPONENT_AT_MUZZLE_08` },
			{ name = 'muzzle_bellend', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_SR_BARREL_01` },
			
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01` },
		}
	},
	
	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
        weight = 5.0,
		label = _U('weapon_marksmanrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{ name = 'clip_default', label = _U('component_clip_default'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended', label = _U('component_clip_extended'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02` },

			{ name = 'rounds_tracer', label = _U('component_round_tracer'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER` },
			{ name = 'rounds_incendiary', label = _U('component_round_incendiary'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'rounds_piercing', label = _U('component_round_piercing'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'rounds_fullmetal', label = _U('component_round_fullmetal'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ` },
			
			{ name = 'grip', label = _U('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP_02` },
			
			{ name = 'flashlight', label = _U('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },

			{ name = 'suppressor', label = _U('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP` },

			{ name = 'scope', label = _U('component_scope'), hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium', label = _U('component_scope_medium'), hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'scope_zoom', label = _U('component_scope_zoom'), hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2` },

			{ name = 'barrel', label = _U('component_barrel'), hash = `COMPONENT_AT_MRFL_BARREL_01` },
			{ name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = `COMPONENT_AT_MRFL_BARREL_02` },
					
			{ name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tatical', label = _U('component_muzzle_tatical'), hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split', label = _U('component_muzzle_split'), hash = `COMPONENT_AT_MUZZLE_07` },
			
			
			{ name = 'skin_camo', label = _U('component_skin_camo'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO` },
			{ name = 'skin_brushstroke', label = _U('component_skin_brushstroke'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02` },
			{ name = 'skin_woodland', label = _U('component_skin_woodland'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03` },
			{ name = 'skin_skull', label = _U('component_skin_skull'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04` },
			{ name = 'skin_sessanta', label = _U('component_skin_sessanta'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05` },
			{ name = 'skin_perseus', label = _U('component_skin_perseus'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06` },
			{ name = 'skin_leopard', label = _U('component_skin_leopard'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07` },
			{ name = 'skin_zebra', label = _U('component_skin_zebra'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08` },
			{ name = 'skin_geometric', label = _U('component_skin_geometric'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09` },
			{ name = 'skin_boom', label = _U('component_skin_boom'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10` },
			{ name = 'skin_patriotic', label = _U('component_skin_patriotic'), hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01` },
		}
	},


	{
		name = 'WEAPON_COMPACTRIFLE',
        weight = 3.0,
		label = _U('weapon_compactrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RIFLE')},
		tints = Config.DefaultWeaponTints,
		mingrade = 7,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02')},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_03')}
		}
	},

	{
		name = 'WEAPON_MG',
        weight = 5.0,
		label = _U('weapon_mg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_MG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_MG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_MG_CLIP_02')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_MG_VARMOD_LOWRIDER')}
		}
	},

	{
		name = 'WEAPON_COMBATMG',
        weight = 5.0,
		label = _U('weapon_combatmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_MG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_COMBATMG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_COMBATMG_CLIP_02')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_COMBATMG_VARMOD_LOWRIDER')}
		}
	},

	{
		name = 'WEAPON_GUSENBERG',
        weight = 3.0,
		label = _U('weapon_gusenberg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_MG')},
		tints = Config.DefaultWeaponTints,
		mingrade = 8,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_GUSENBERG_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_GUSENBERG_CLIP_02')},
		}
	},

	{
		name = 'WEAPON_SNIPERRIFLE',
        weight = 5.0,
		label = _U('weapon_sniperrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE')},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey('COMPONENT_AT_SCOPE_MAX')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_SNIPERRIFLE_VARMOD_LUXE')}
		}
	},

	{
		name = 'WEAPON_HEAVYSNIPER',
        weight = 5.0,
		label = _U('weapon_heavysniper'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE')},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey('COMPONENT_AT_SCOPE_MAX')}
		}
	},

	{
		name = 'WEAPON_MARKSMANRIFLE',
        weight = 5.0,
		label = _U('weapon_marksmanrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_SNIPER')},
		tints = Config.DefaultWeaponTints,
		mingrade = 9,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey('COMPONENT_MARKSMANRIFLE_CLIP_01')},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey('COMPONENT_MARKSMANRIFLE_CLIP_02')},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM')},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey('COMPONENT_MARKSMANRIFLE_VARMOD_LUXE')}
		}
	},

	{name = 'WEAPON_MINIGUN', mingrade = 9,weight = 11.0, label = _U('weapon_minigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_MINIGUN')}},
	{name = 'WEAPON_RAILGUN', mingrade = 9,weight = 11.0, label = _U('weapon_railgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey('AMMO_RAILGUN')}},
	{name = 'WEAPON_STUNGUN', mingrade = 9,weight = 0.3, label = _U('weapon_stungun'), tints = Config.DefaultWeaponTints, components = {}},
	{name = 'WEAPON_RPG', mingrade = 9,weight = 11.0, label = _U('weapon_rpg'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey('AMMO_RPG')}},
	{name = 'WEAPON_HOMINGLAUNCHER', mingrade = 9,weight = 11.0, label = _U('weapon_hominglauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey('AMMO_HOMINGLAUNCHER')}},
	{name = 'WEAPON_GRENADELAUNCHER', mingrade = 9,weight = 8.0, label = _U('weapon_grenadelauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey('AMMO_GRENADELAUNCHER')}},
	{name = 'WEAPON_COMPACTLAUNCHER', mingrade = 9,weight = 8.0, label = _U('weapon_compactlauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey('AMMO_GRENADELAUNCHER')}},
	{name = 'WEAPON_FLAREGUN', mingrade = 9,weight = 5.0, label = _U('weapon_flaregun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_flaregun'), hash = GetHashKey('AMMO_FLAREGUN')}},
	{name = 'WEAPON_FIREEXTINGUISHER', mingrade = 3,weight = 2.0, label = _U('weapon_fireextinguisher'), components = {}, ammo = {label = _U('ammo_charge'), hash = GetHashKey('AMMO_FIREEXTINGUISHER')}},
	{name = 'WEAPON_PETROLCAN', mingrade = 9,weight = 5.0, label = _U('weapon_petrolcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = GetHashKey('AMMO_PETROLCAN')}},
	{name = 'WEAPON_FIREWORK', mingrade = 9,weight = 11.0, label = _U('weapon_firework'), components = {}, ammo = {label = _U('ammo_firework'), hash = GetHashKey('AMMO_FIREWORK')}},
	{name = 'WEAPON_FLASHLIGHT', mingrade = 0,weight = 0.2, label = _U('weapon_flashlight'), components = {}},
	{name = 'GADGET_PARACHUTE', mingrade = 0,weight = 0.1, label = _U('gadget_parachute'), components = {}},
	{name = 'WEAPON_KNUCKLE', mingrade = 9,weight = 0.1, label = _U('weapon_knuckle'), components = {}},
	{name = 'WEAPON_HATCHET', mingrade = 9,weight = 0.5, label = _U('weapon_hatchet'), components = {}},
	{name = 'WEAPON_MACHETE', mingrade = 9,weight = 0.5, label = _U('weapon_machete'), components = {}},
	{name = 'WEAPON_SWITCHBLADE', mingrade = 9,weight = 0.5, label = _U('weapon_switchblade'), components = {}},
	{name = 'WEAPON_BOTTLE', mingrade = 9,weight = 0.1, label = _U('weapon_bottle'), components = {}},
	{name = 'WEAPON_DAGGER', mingrade = 9,weight = 0.1, label = _U('weapon_dagger'), components = {}},
	{name = 'WEAPON_POOLCUE', mingrade = 9,weight = 0.1, label = _U('weapon_poolcue'), components = {}},
	{name = 'WEAPON_WRENCH', mingrade = 9,weight = 0.1, label = _U('weapon_wrench'), components = {}},
	{name = 'WEAPON_BATTLEAXE', mingrade = 9,weight = 3.1, label = _U('weapon_battleaxe'), components = {}},
	{name = 'WEAPON_KNIFE', mingrade = 0,weight = 0.1, label = _U('weapon_knife'), components = {}},
	{name = 'WEAPON_NIGHTSTICK', mingrade = 0,weight = 0.1, label = _U('weapon_nightstick'), components = {}},
	{name = 'WEAPON_HAMMER', mingrade = 9,weight = 0.4, label = _U('weapon_hammer'), components = {}},
	{name = 'WEAPON_BAT', mingrade = 9,weight = 0.2, label = _U('weapon_bat'), components = {}},
	{name = 'WEAPON_GOLFCLUB', mingrade = 9,weight = 0.3, label = _U('weapon_golfclub'), components = {}},
	{name = 'WEAPON_CROWBAR', mingrade = 9,weight = 2.1, label = _U('weapon_crowbar'), components = {}},

	{name = 'WEAPON_GRENADE', mingrade = 9,weight = 0.5, label = _U('weapon_grenade'), components = {}, ammo = {label = _U('ammo_grenade'), hash = GetHashKey('AMMO_GRENADE')}},
	{name = 'WEAPON_SMOKEGRENADE', mingrade = 9,weight = 0.5, label = _U('weapon_smokegrenade'), components = {}, ammo = {label = _U('ammo_smokebomb'), hash = GetHashKey('AMMO_SMOKEGRENADE')}},
	{name = 'WEAPON_STICKYBOMB', mingrade = 9,weight = 0.5, label = _U('weapon_stickybomb'), components = {}, ammo = {label = _U('ammo_stickybomb'), hash = GetHashKey('AMMO_STICKYBOMB')}},
	{name = 'WEAPON_PIPEBOMB', mingrade = 9,weight = 0.5, label = _U('weapon_pipebomb'), components = {}, ammo = {label = _U('ammo_pipebomb'), hash = GetHashKey('AMMO_PIPEBOMB')}},
	{name = 'WEAPON_BZGAS', mingrade = 9,weight = 0.5, label = _U('weapon_bzgas'), components = {}, ammo = {label = _U('ammo_bzgas'), hash = GetHashKey('AMMO_BZGAS')}},
	{name = 'WEAPON_FLASHBANG', mingrade = 9,weight = 0.5, label = "Stun Grenade", components = {}, ammo = {label = "Stun Grenade", hash = GetHashKey('AMMO_FLASH')}},
	{name = 'WEAPON_MOLOTOV', mingrade = 9,weight = 0.5, label = _U('weapon_molotov'), components = {}, ammo = {label = _U('ammo_molotov'), hash = GetHashKey('AMMO_MOLOTOV')}},
	{name = 'WEAPON_PROXMINE', mingrade = 9,weight = 0.5, label = _U('weapon_proxmine'), components = {}, ammo = {label = _U('ammo_proxmine'), hash = GetHashKey('AMMO_PROXMINE')}},
	{name = 'WEAPON_SNOWBALL', mingrade = 9,weight = 0.5, label = _U('weapon_snowball'), components = {}, ammo = {label = _U('ammo_snowball'), hash = GetHashKey('AMMO_SNOWBALL')}},
	{name = 'WEAPON_BALL', mingrade = 9,weight = 0.5, label = _U('weapon_ball'), components = {}, ammo = {label = _U('ammo_ball'), hash = GetHashKey('AMMO_BALL')}},
	{name = 'WEAPON_FLARE', mingrade = 9,weight = 0.5, label = _U('weapon_flare'), components = {}, ammo = {label = _U('ammo_flare'), hash = GetHashKey('AMMO_FLARE')}}
}