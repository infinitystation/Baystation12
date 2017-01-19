#if !defined(USING_MAP_DATUM)

	#include "exodus_areas_inf.dm"
	#include "exodus_holodecks_inf.dm"
	#include "exodus_shuttles_inf.dm"

	#include "exodus_unit_testing_inf.dm"
	#include "exodus_zas_tests_inf.dm"

	#include "../shared/exodus_torch/areas.dm"
	#include "../shared/exodus_torch/zas_tests.dm"

	#include "exodus-1_inf.dmm"
	#include "exodus-2_inf.dmm"
	#include "exodus-3_inf.dmm"
	#include "exodus-4_inf.dmm"
	#include "exodus-5_inf.dmm"
	#include "exodus-6_inf.dmm"

	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"

	#define USING_MAP_DATUM /datum/map/exodus_infinity

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Exodus

#endif
