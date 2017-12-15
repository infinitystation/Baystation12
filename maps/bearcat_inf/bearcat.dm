#if !defined(using_map_DATUM)
	#include "bearcat_areas.dm"
	#include "bearcat_overmap.dm"
	#include "bearcat_define.dm"
	#include "bearcat_jobs.dm"
	#include "bearcat_loadouts.dm"
	#include "bearcat_unit_testing.dm"
	#include "bearcat_shuttles.dm"
	#include "bearcat-1.dmm"
	#include "bearcat-2.dmm"
	#include "bearcat-3.dmm"
	#include "../away-inf/lost_supply_base/lost_supply_base.dm"
	#include "../away-inf/smugglers/smugglers.dm"

	#include "../../code/modules/lobby_music/businessend.dm"
	#include "../../code/modules/lobby_music/salutjohn.dm"

	#define using_map_DATUM /datum/map/overmap_example

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Overmap Example

#endif
