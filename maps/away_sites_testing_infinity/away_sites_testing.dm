#if !defined(using_map_DATUM)
	#include "away_sites_testing_lobby.dm"
	#include "away_sites_testing_unit_testing.dm"

	#include "blank.dmm"

	#include "../away/empty.dmm"
	#include "../away_inf/adherent_base/adherent_base.dm"
	#include "../away_inf/yacht/yacht.dm"
	#include "../away_inf/smugglers/smugglers.dm"

	#define using_map_DATUM /datum/map/away_sites_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Away Sites Testing

#endif
