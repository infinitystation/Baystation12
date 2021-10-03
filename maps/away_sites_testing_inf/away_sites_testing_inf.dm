#if !defined(using_map_DATUM)

	// Нет необходимости в копипасте - это обычный авей сайтес тестинг
	// Но с другими инклудами
	#include "../away_sites_testing/away_sites_testing_lobby.dm"
	#include "../away_sites_testing/away_sites_testing_define.dm"
	// Customs-require	looking in example dir
	#include "../example/compile_required_snatch.dm"
	/////////////////////////////////////////////////
	#include "../away_sites_testing/blank.dmm"

	// Беевские авейки которые мы используем (и которые не конфликтуют с нашими авейками)
	// Не удалять беевские авейки. Просто коментируйте их.
	#include "../away/empty.dmm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	//#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	//#include "../away/smugglers/smugglers.dm"
	#include "../away/casino/casino.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/slavers/slavers_base.dm"
	//#include "../away/blueriver/blueriver.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	//#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/verne/verne.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"
	#include "../away/scavver/scavver_gantry.dm"
	#include "../away/voxship/voxship.dm"

	// Юнит тесты Инфинити
	#include "../away_inf/bearcat/bearcat.dm"					// (SIERRA INCLUDED)
	#include "../away_inf/blueriver/blueriver.dm"				// (SIERRA INCLUDED)
	#include "../away_inf/liberia/liberia.dm"					// (SIERRA INCLUDED)
	#include "../away_inf/mining/mining.dm"						// (SIERRA INCLUDED)
	#include "../away_inf/skrellscoutship/skrellscoutship.dm"	//
	#include "../away_inf/smugglers/smugglers.dm"				// (SIERRA INCLUDED)
	#include "../away_inf/yacht/yacht.dm"						// (SIERRA INCLUDED)

	#define using_map_DATUM /datum/map/away_sites_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Away Sites Testing

#endif
