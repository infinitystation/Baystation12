#if !defined(using_map_DATUM)
	#include "bearcat_areas.dm"
	#include "bearcat_overmap.dm"
	#include "bearcat_define.dm"
	#include "bearcat_jobs.dm"
	#include "bearcat_loadouts.dm"
	#include "bearcat_misc.dm"
	#include "bearcat_unit_testing.dm"
	#include "bearcat_shuttles.dm"
	#include "bearcat-1.dmm"
	#include "bearcat-2.dmm"
	#include "bearcat-3.dmm"
	#include "bearcat-4.dmm"

	#include "../away_inf/yacht/yacht.dm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/icarus/icarus.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away_inf/smugglers/smugglers.dm"
	#include "../away/slavers/slavers_base.dm"



	#define using_map_DATUM /datum/map/bearcat

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Bearcat

#endif
