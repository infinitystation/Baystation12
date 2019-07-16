//==========================================================================================
//flags_atom

#define NOINTERACT				(1<<0)		// You can't interact with it, at all. Useful when doing certain animations.
#define CONDUCT					(1<<1)		// conducts electricity (metal etc.)
#define ON_BORDER				(1<<2)		// 'border object'. item has priority to check when entering or leaving
#define NOBLOODY				(1<<3)		// Don't want a blood overlay on this one.
#define DIRLOCK					(1<<4)		// movable atom won't change direction when Moving()ing. Useful for items that have several dir states.
#define INITIALIZED				(1<<5)  	//Whether /atom/Initialize() has already run for the object
#define NODECONSTRUCT			(1<<6)
#define OVERLAY_QUEUED			(1<<7)
#define PREVENT_CLICK_UNDER		(1<<8)		//Prevent clicking things below it on the same turf

//==========================================================================================

//flags_barrier
#define HANDLE_BARRIER_CHANCE 1
#define HANDLE_BARRIER_BLOCK 2


//bitflags that were previously under flags_atom, these only apply to items.
//clothing specific stuff uses flags_inventory.
//flags_item
#define NODROP					(1<<0)	// Cannot be dropped/unequipped at all, only deleted.
#define NOBLUDGEON  			(1<<1)	// when an item has this it produces no "X has been hit by Y with Z" message with the default handler
#define NOSHIELD				(1<<2)	// weapon not affected by shield (does nothing currently)
#define DELONDROP				(1<<3)	// Deletes on drop instead of falling on the floor.
#define TWOHANDED				(1<<4)	// The item is twohanded.
#define WIELDED					(1<<5)	// The item is wielded with both hands.
#define	ITEM_ABSTRACT			(1<<6)	//The item is abstract (grab, powerloader_clamp, etc)
#define BEING_REMOVED			(1<<7)	//Cuffs and legcuffs

//==========================================================================================

// bitflags for clothing parts
//thermal_protection_flags
#define HEAD			(1<<0)
#define FACE			(1<<1)
#define EYES			(1<<2)
#define CHEST			(1<<3)
#define GROIN			(1<<4)
#define LEG_LEFT		(1<<5)
#define LEG_RIGHT		(1<<6)
#define LEGS			(LEG_RIGHT|LEG_LEFT)
#define FOOT_LEFT		(1<<7)
#define FOOT_RIGHT		(1<<8)
#define FEET			(FOOT_RIGHT|FOOT_LEFT)
#define ARM_LEFT		(1<<9)
#define ARM_RIGHT		(1<<10)
#define ARMS			(ARM_RIGHT|ARM_LEFT)
#define HAND_LEFT		(1<<11)
#define HAND_RIGHT		(1<<12)
#define HANDS			(HAND_RIGHT|HAND_LEFT)
#define FULL_BODY		(~0)