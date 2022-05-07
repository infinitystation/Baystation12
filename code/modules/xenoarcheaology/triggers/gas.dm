/datum/artifact_trigger/gas
	name = "concentration of a specific gas"
	toggle = FALSE
	var/list/gas_needed	//list of gas=percentage needed in air to activate

/datum/artifact_trigger/gas/New()
	spawn(5 SECONDS) 
		if(!gas_needed) 
			var/gas = pick(gas_data.gases)
			name = "concentration of [lowertext(gas_data.name[gas])]"
			gas_needed = list(gas = rand(1,10)) //inf
/*inf	
	if(!gas_needed)
		gas_needed = list(pick(gas_data.gases) = rand(1,10))
inf*/
/datum/artifact_trigger/gas/on_gas_exposure(datum/gas_mixture/gas)
	. = TRUE
	for(var/g in gas_needed)
		var/percentage = round(gas.gas[g]/gas.total_moles * 100, 0.01)
		if(percentage < gas_needed[g])
			return FALSE

/datum/artifact_trigger/gas/co2
	name = "concentration of CO2"
	
/datum/artifact_trigger/gas/co2/New()
	spawn(5 SECONDS) 
		gas_needed = list(GAS_CO2 = rand(1,10))

/datum/artifact_trigger/gas/o2
	name = "concentration of oxygen"

/datum/artifact_trigger/gas/o2/New()
	spawn(5 SECONDS) 
		gas_needed = list(GAS_OXYGEN = rand(5,40))

/datum/artifact_trigger/gas/n2
	name = "concentration of nitrogen"

/datum/artifact_trigger/gas/n2/New()
	spawn(5 SECONDS) 
		gas_needed = list(GAS_NITROGEN = rand(60,95))

/datum/artifact_trigger/gas/phoron
	name = "concentration of phoron"

/datum/artifact_trigger/gas/phoron/New()
	spawn(5 SECONDS) 
		gas_needed = list(GAS_PHORON = rand(1,95))