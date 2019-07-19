//==========================================================================================
//flags_atom

#define NOINTERACT				1	    	// You can't interact with it, at all. Useful when doing certain animations.
#define CONDUCT					2   		// conducts electricity (metal etc.)
#define ON_BORDER				4   		// 'border object'. item has priority to check when entering or leaving
#define NOBLOODY				8   		// Don't want a blood overlay on this one.
#define DIRLOCK					16  		// movable atom won't change direction when Moving()ing. Useful for items that have several dir states.
#define INITIALIZED				32        	//Whether /atom/Initialize() has already run for the object
#define NODECONSTRUCT			64
#define OVERLAY_QUEUED			128
#define PREVENT_CLICK_UNDER		256 		//Prevent clicking things below it on the same turf

//==========================================================================================

//flags_barrier
#define HANDLE_BARRIER_CHANCE 1
#define HANDLE_BARRIER_BLOCK 2


//bitflags that were previously under flags_atom, these only apply to items.
//clothing specific stuff uses flags_inventory.
//flags_item
#define NODROP					1   	// Cannot be dropped/unequipped at all, only deleted.
#define NOBLUDGEON  			2	    // when an item has this it produces no "X has been hit by Y with Z" message with the default handler
#define NOSHIELD				4	    // weapon not affected by shield (does nothing currently)
#define DELONDROP				8   	// Deletes on drop instead of falling on the floor.
#define TWOHANDED				16  	// The item is twohanded.
#define WIELDED					32  	// The item is wielded with both hands.
#define	ITEM_ABSTRACT			64  	//The item is abstract (grab, powerloader_clamp, etc)
#define BEING_REMOVED			128 	//Cuffs and legcuffs