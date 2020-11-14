#if !defined(using_map_DATUM)
	#include "away_sites_testing_lobby.dm"

	#include "away_sites_testing_define.dm"

	//[INF]	Customs-require	looking in example dir
	#include "../example/compile_required_snatch.dm"
	//[/INF]
	#include "blank.dmm"

	#include "../away/empty.dmm"
//INF	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
//INF	#include "../away/smugglers/smugglers.dm"
	#include "../away/casino/casino.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/slavers/slavers_base.dm"
//INF	#include "../away/blueriver/blueriver.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
//	#include "../away/icarus/icarus.dm" temporarily removed while we investigate Travis failures
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
//INF	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/ascent/ascent.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"

	#include "../away/voxship/voxship.dm"

//[INF]
//	#include "../away_inf/adherent_base/adherent_base.dm" //flood system is too slow.
	#include "../away_inf/blueriver/blueriver.dm"
//	#include "../away_inf/gunboat/gunboat.dm" - TORCH, doesn't maintenance (someone want to change it?)
//	#include "../away_inf/marksman/marksman.dm" - TORCH, doesn't maintenance (someone want to change it?)
//	#include "../away_inf/sentinel/sentinel.dm" - TORCH, doesn't maintenance (someone want to change it?)
//	#include "../away_inf/merchant/merchant.dm" - WIP, doesn't maintenance (someone want to change it?)
//	#include "../away_inf/rubidu/rubidu.dm" - WIP, doesn't maintenance (someone want to change it?)
//	#include "../away_inf/salvagers/salvagers.dm" - WIP
//	#include "../away_inf/white_star/white_star.dm" - WIP
	#include "../away_inf/mining/mining.dm"
	#include "../away_inf/smugglers/smugglers.dm"
	#include "../away_inf/yacht/yacht.dm"
	#include "../away_inf/skrellscoutship/skrellscoutship.dm"
//	#include "../away_inf/patrol/patrol.dm"
	#include "../away_inf/ascent/ascent.dm"
//[/INF]

	#define using_map_DATUM /datum/map/away_sites_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Away Sites Testing

#endif
