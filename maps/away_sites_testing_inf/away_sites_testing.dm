#if !defined(using_map_DATUM)
	#include "away_sites_testing_lobby.dm"
	#include "away_sites_testing_unit_testing.dm"

	#include "blank.dmm"

	#include "../away/mining/mining_areas.dm" // for correct areas loading

//	#include "../away_inf/adherent_base/adherent_base.dm" //flood system is too slow.
	#include "../away_inf/blueriver/blueriver.dm"
//	#include "../away_inf/gunboat/gunboat.dm" - TORCH, doesn't maintenance
//	#include "../away_inf/marksman/marksman.dm" - TORCH, doesn't maintenance
//	#include "../away_inf/merchant/merchant.dm" - WIP
//	#include "../away_inf/mining/mining.dm" - WIP
//	#include "../away_inf/rubidu/rubidu.dm" - WIP
//	#include "../away_inf/sentinel/sentinel.dm" - TORCH, doesn't maintenance
	#include "../away_inf/smugglers/smugglers.dm"
//	#include "../away_inf/white_star/white_star.dm" - WIP
	#include "../away_inf/yacht/yacht.dm"

	#define using_map_DATUM /datum/map/away_sites_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Away Sites Testing

#endif
