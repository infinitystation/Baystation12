#define TINT_NONE 0
#define TINT_ONE 1
#define TINT_TWO 2
#define TINT_THREE 3
#define TINT_MODERATE 3
#define TINT_FOUR 4
#define TINT_FIVE 5
#define TINT_HEAVY 5
#define TINT_SIX 6
#define TINT_BLIND 7

#define OBSERV_SPAWN_DELAY round(config.respawn_delay / 2)

// Character's economic class

//Swarm Limbs
#define BP_L_F_LEG 		"left front leg"
#define BP_R_F_LEG 		"right front leg"
#define BP_L_B_LEG 		"left back leg"
#define BP_R_B_LEG 		"right back leg"
#define BP_SHELL   		"shell"
#define BP_MANIPULATOR	"manipulator"

//Swarm Organs
#define BP_SENSOR			"sensor"
#define BP_GENERATOR		"generator"
#define BP_CORE				"core"
#define BP_THRUSTER			"thruster"
#define BP_ARMOR			"armor"
#define BP_ANTI_EMP_PLATING	"anti EMP plating"
#define BP_MATTER_TANK		"matter tank"

#define SPECIES_TAJARA "Tajara"
#define SPECIES_EROSAN "Erosan'Unathi"
#define SPECIES_RESOMI "Resomi"
#define SPECIES_SWARM  "Swarm"
#define SPECIES_XENO   "Xenophage"
#define SPECIES_BIONIC "Bionic"

#define HUMAN_SPECIES list(SPECIES_HUMAN, SPECIES_VATGROWN, SPECIES_SPACER, SPECIES_GRAVWORLDER, SPECIES_TRITONIAN, SPECIES_MULE, SPECIES_BOOSTER)
#define UNATHI_SPECIES list(SPECIES_UNATHI, SPECIES_EROSAN, SPECIES_YEOSA)
#define SOUNDED_SPECIES list(SPECIES_HUMAN, SPECIES_VATGROWN, SPECIES_SPACER, SPECIES_TRITONIAN, SPECIES_GRAVWORLDER, SPECIES_MULE, SPECIES_BOOSTER, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN, SPECIES_TAJARA, SPECIES_RESOMI, SPECIES_SKRELL)
