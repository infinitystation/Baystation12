// -- SSao --
//inf #define WALL_AO_ALPHA 80

//[INF]
GLOBAL_VAR_INIT(AO_ALPHA, 80) //inf
#define WALL_AO_ALPHA GLOB.AO_ALPHA //inf
//[/INF]

#define AO_UPDATE_NONE 0
#define AO_UPDATE_OVERLAY 1
#define AO_UPDATE_REBUILD 2

// If ao_neighbors equals this, no AO shadows are present.
#define AO_ALL_NEIGHBORS 1910 