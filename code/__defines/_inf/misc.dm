#define ANNOUNSER_NAME "[station_name()] Automated Announcement System"

#define GET_ANNOUNCEMENT_FREQ(X) GLOB.using_map.use_job_frequency_announcement ? get_announcement_frequency(X) : "Common"

//Preference save/load cooldown
#define PREF_SAVELOAD_COOLDOWN 2

// Multimeter defines
#define METER_MESURING "Measuring"
#define METER_CHECKING "Checking"

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

#define DEFAULT_RESPAWN_COOLDOWN config.default_latejoin_cooldown

//Area gravity flags
#define AREA_GRAVITY_NEVER  -1 // No gravity, never
#define AREA_GRAVITY_NORMAL 1 // Gravity in area will act like always
#define AREA_GRAVITY_ALWAYS 2 // No matter what, gravity always would be
