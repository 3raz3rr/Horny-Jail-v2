/obj/item/clothing/head/helmet/space/hardsuit/odst
	name = "Orbital Drop Shock Trooper Helmet"
	desc = "The helmet of a shocktrooper's hardsuit. It's sturdy and reinforced."
	icon = 'modular_zzsplurt/modules/clothing/spacesuits/icons/obj/hats.dmi'
	worn_icon = 'modular_zzsplurt/modules/clothing/spacesuits/icons/mob/head.dmi'
	worn_icon_muzzled = 'modular_zzsplurt/modules/clothing/spacesuits/icons/mob/head_muzzled.dmi'
	icon_state = "hardsuit0-odst"
	worn_icon_state = "ert_odst"
	inhand_icon_state = "sec_helm"
	hardsuit_type = "odst"
	armor_type = /datum/armor/odst_hardsuit

/obj/item/clothing/suit/space/hardsuit/odst
	name = "Orbital Drop Shock Trooper Hardsuit"
	desc = "The hardsuit of a shocktrooper. It's lightweight, yet sturdy and reinforced. "
	alt_desc = "The hardsuit of a shocktrooper. It's lightweight, yet sturdy and reinforced. "
	icon = 'modular_zzplurt/modules/clothing/spacesuits/icons/obj/suits.dmi'
	worn_icon = 'modular_zzsplurt/modules/clothing/spacesuits/icons/mob/suit.dmi'
	worn_icon_digi = 'modular_zzsplurt/modules/clothing/spacesuits/icons/mob/suit_digi.dmi'
	icon_state = "ert_odst"
	worn_icon_state = "ert_odst"
	inhand_icon_state = "sec_hardsuit"
	hardsuit_type = "odst"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/odst
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword, /obj/item/tank/internals)
	armor_type = /datum/armor/odst_hardsuit
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	slowdown = 0
	cell = /obj/item/stock_parts/power_store/cell/bluespace

/datum/armor/odst_hardsuit
	melee = 65
	bullet = 50
	laser = 50
	energy = 60
	bomb = 60
	bio = 100
	fire = 100
	acid = 100
	wound = 65
