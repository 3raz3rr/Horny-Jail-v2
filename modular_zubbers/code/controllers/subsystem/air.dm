/datum/controller/subsystem/air
	var/list/chosen_goblin_reagents = list(
		"medicine" = null,
		"drug" = null,
		"toxic" = null,
	)

/datum/controller/subsystem/air/proc/pick_goblin_reagent(list/possible)
	while(possible.len)
		var/datum/reagent/R = pick_n_take(possible)
		if(initial(R.chemical_flags) & REAGENT_CAN_BE_SYNTHESIZED)
			return R
	return /datum/reagent/consumable/salt

/datum/controller/subsystem/air/Initialize()
	. = ..()

	chosen_goblin_reagents["medicine"] = pick_goblin_reagent(subtypesof(/datum/reagent/medicine))
	chosen_goblin_reagents["drug"] = pick_goblin_reagent(subtypesof(/datum/reagent/drug))
	chosen_goblin_reagents["toxic"] = pick_goblin_reagent(subtypesof(/datum/reagent/toxin))
