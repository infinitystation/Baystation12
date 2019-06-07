#define DEFAULT_TABLE_MATERIAL "plastic"
#define DEFAULT_WALL_MATERIAL "steel"

#define SHARD_SHARD "shard"
#define SHARD_SHRAPNEL "shrapnel"
#define SHARD_STONE_PIECE "piece"
#define SHARD_SPLINTER "splinters"
#define SHARD_NONE ""

#define MATERIAL_UNMELTABLE 0x1
#define MATERIAL_BRITTLE    0x2
#define MATERIAL_PADDING    0x4

#define TABLE_BRITTLE_MATERIAL_MULTIPLIER 4 // Amount table damage is multiplied by if it is made of a brittle material (e.g. glass)

#define ANNOUNSER_NAME "[station_name()] Automated Announcement System"

#define DOOR_CRUSH_DAMAGE 15

// Multimeter defines
#define METER_MESURING "Измерение" // Measuring
#define METER_CHECKING "Прозвонка" // Checking

/*
Define for getting a bitfield of adjacent turfs that meet a condition.
 ORIGIN is the object to step from, VAR is the var to write the bitfield to
 TVAR is the temporary turf variable to use, FUNC is the condition to check.
 FUNC generally should reference TVAR.
 example:
	var/turf/T
	var/result = 0
	CALCULATE_NEIGHBORS(src, result, T, isopenturf(T))
*/
#define CALCULATE_NEIGHBORS(ORIGIN, VAR, TVAR, FUNC) \
	for (var/_tdir in GLOB.cardinal) {               \
		TVAR = get_step(ORIGIN, _tdir);              \
		if ((TVAR) && (FUNC)) {                      \
			VAR |= 1 << _tdir;                       \
		}                                            \
	}                                                \
	if (VAR & N_NORTH) {                             \
		if (VAR & N_WEST) {                          \
			TVAR = get_step(ORIGIN, NORTHWEST);      \
			if (FUNC) {                              \
				VAR |= N_NORTHWEST;                  \
			}                                        \
		}                                            \
		if (VAR & N_EAST) {                          \
			TVAR = get_step(ORIGIN, NORTHEAST);      \
			if (FUNC) {                              \
				VAR |= N_NORTHEAST;                  \
			}                                        \
		}                                            \
	}                                                \
	if (VAR & N_SOUTH) {                             \
		if (VAR & N_WEST) {                          \
			TVAR = get_step(ORIGIN, SOUTHWEST);      \
			if (FUNC) {                              \
				VAR |= N_SOUTHWEST;                  \
			}                                        \
		}                                            \
		if (VAR & N_EAST) {                          \
			TVAR = get_step(ORIGIN, SOUTHEAST);      \
			if (FUNC) {                              \
				VAR |= N_SOUTHEAST;                  \
			}                                        \
		}                                            \
}

// /atom/proc/use_check flags.
#define USE_ALLOW_NONLIVING 1
#define USE_ALLOW_NON_ADV_TOOL_USR 2
#define USE_ALLOW_DEAD 4
#define USE_ALLOW_INCAPACITATED 8
#define USE_ALLOW_NON_ADJACENT 16
#define USE_FORCE_SRC_IN_USER 32
#define USE_DISALLOW_SILICONS 64

#define USE_SUCCESS 0
#define USE_FAIL_NON_ADJACENT 1
#define USE_FAIL_NONLIVING 2
#define USE_FAIL_NON_ADV_TOOL_USR 3
#define USE_FAIL_DEAD 4
#define USE_FAIL_INCAPACITATED 5
#define USE_FAIL_NOT_IN_USER 6
#define USE_FAIL_IS_SILICON 7