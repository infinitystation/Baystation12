#define ADD_ARMOR(M, B, L, E, BO, BI, R) (list(melee = M, bullet = B, laser = L, energy = E, bomb = BO, bio = BI, rad = R))
//defines ahead read like: topic type, lower subtypes
//you mustn't damage any armor highter than 49 - only some special (meme) weapon

//type, can be damaged with (ballistic|lasers|melee|stun stuff)
//usually, new type blocks damage from upper types

#define ARMOR_VOID_EMER      ADD_ARMOR(0  , 0, 0, 0, 0, 100 ,0)     //emergency space suit
#define ARMOR_VOID_SUIT      ADD_ARMOR(15, 0, 0, 0, 0, 100 ,0)    //standart/medical voidsuit
#define ARMOR_RIG_RESCUE     ADD_ARMOR(10, 0, 0, 0, 5,  100, 60)  //medical rescue

//light armor, light pistols|mini-smartgun|light melee|mini-smartgun
#define ARMOR_CLASS_1        ADD_ARMOR(25, 5, 5, 5, 15, 0 ,0)     //light plate
#define ARMOR_VOID_ATMOS     ADD_ARMOR(25, 5, 5, 5, 15, 100, 40)  //atmos voidsuit
#define ARMOR_VOID_SCIENCE   ADD_ARMOR(20, 4, 4, 4, 15, 100, 80)  //science voidsuit
#define ARMOR_VOID_PILOT     ADD_ARMOR(15, 5, 5, 5, 15, 100, 70)  //pilot voidsuit
#define ARMOR_RIG_RD         ADD_ARMOR(20, 8, 8, 5, 15, 100, 100) //RD's hasmat
#define ARMOR_RIG_CMO        ADD_ARMOR(20, 8, 8, 5, 15, 100, 60)  //CMO's personnal
#define ARMOR_RIG_HACKER     ADD_ARMOR(15, 3, 3, 5, 10, 0, 0)     //hacker rig

//light armor+, all pistols + shotgun slug|smartgun|common melee|smartgun
#define ARMOR_CLASS_2        ADD_ARMOR(30, 16, 16, 20, 25, 0, 0)     //medium plate
#define ARMOR_VOID_ENGINEE   ADD_ARMOR(30, 14, 14, 20, 35, 100, 100) //engineering voidsuit
#define ARMOR_VOID_EXPEDIT   ADD_ARMOR(40, 15, 15, 15, 25, 100, 80)  //expeditionary voidsuit
#define ARMOR_VOID_MINING    ADD_ARMOR(40, 14, 14, 14, 25, 100, 60)  //mining voidsuit
#define ARMOR_RIG_CE         ADD_ARMOR(35, 16, 16, 16, 40, 100, 100) //CE's personnal
#define ARMOR_RIG_PATHFINDER ADD_ARMOR(45, 17, 17, 17, 35, 100, 90)  //pathfinder's peronnal
#define ARMOR_RIG_INDUSTRIAL ADD_ARMOR(45, 16, 16, 16, 40, 100, 60)  //mining rig
#define ARMOR_RIG_ENGINEE    ADD_ARMOR(30, 14, 14, 25, 35, 100, 100) //engineering rig
#define ARMOR_RIG_STEALTH    ADD_ARMOR(30, 14, 14, 14, 20, 100, 0)   //stealth rig
#define ARMOR_RIG_EXPEDIT    ADD_ARMOR(40, 16, 16, 16, 35, 100, 90)  //expeditionary rig

//medium armor, rifles, shotgun sabot slag |laser gun, pulse pistol, xray pistol|spear|stun revolver
#define ARMOR_CLASS_3        ADD_ARMOR(40, 26.5, 25  , 35, 35, 0, 0)    //reinforced plate
#define ARMOR_VOID_SECURI    ADD_ARMOR(35, 24  , 24  , 35, 35, 100, 20) //security voidsuit
#define ARMOR_VOID_SKRELL    ADD_ARMOR(35, 28  , 28  , 35, 35, 100, 50) //skrellian voidsuit
#define ARMOR_VOID_MERC      ADD_ARMOR(40, 25  , 25  , 35, 35, 100, 50) //merc voidsuit
#define ARMOR_RIG_NINJA      ADD_ARMOR(45, 28  , 28  , 35, 35, 100, 70) //ninja rig
#define ARMOR_RIG_CAPTAIN    ADD_ARMOR(35, 27  , 25  , 35, 35, 100, 30) //cap's peronnal
#define ARMOR_RIG_HOS        ADD_ARMOR(40, 28  , 25  , 35, 35, 100, 30) //HOS' personnal
#define ARMOR_RIG_ASCENT     ADD_ARMOR(35, 28  , 28  , 35, 40, 100, 70) //ascent alats rig
#define ARMOR_RIG_VOX        ADD_ARMOR(40, 27  , 25  , 35, 35, 100, 40) //vox rig
#define ARMOR_RIG_HAZARD     ADD_ARMOR(35, 26  , 26  , 35, 35, 100, 30) //security rig

//medium armor+, rifles with AP bullets (Z8) | pulse carabine, laser canon
#define ARMOR_CLASS_3_PLUS   ADD_ARMOR(35, 28  , 27.5, 35, 35, 0, 0)    //heavy plate (mercs)
#define ARMOR_RIG_ERT        ADD_ARMOR(35, 28  , 25  , 35, 35, 100, 60) //all standart ert rigs
#define ARMOR_RIG_MERC       ADD_ARMOR(35, 26.5, 27  , 35, 35, 100, 30) //common merc rig

//tactical armor, Z8, heavy revolvers (captain) |xray gun, pulse rifle|axe, light saber|stun rifle
#define ARMOR_CLASS_4        ADD_ARMOR(45, 35, 35, 45, 45, 0, 0)   //tactical plate
#define ARMOR_RIG_ERTHEAVY   ADD_ARMOR(45, 35, 35, 45, 45, 100, 0) //asset protection rig
#define ARMOR_RIG_UNATHI     ADD_ARMOR(45, 35, 35, 45, 45, 100, 0) //unathi rig (unused)
#define ARMOR_RIG_COMBAT     ADD_ARMOR(45, 35, 35, 45, 45, 100, 0) //death squad rig (unused)
#define ARMOR_RIG_MILITARY   ADD_ARMOR(35, 27.5, 27  , 27, 30, 100, 30) //military rig
#define ARMOR_RIG_MERCHEAVY   ADD_ARMOR(45, 45, 44, 60, 40, 100, 10) //heavy merc rig

//heavy armor, emp, radiation, explosions, suicidal melee with axe/light saber, xray gun, sniper rifles. No stun
//players ought to use some special tactics to kill them
#define ARMOR_CLASS_5         ADD_ARMOR(50, 50, 45, 60, 40, 0, 0) //something heavy (unused)
#define ARMOR_RIG_GYYNA       ADD_ARMOR(45, 45, 45, 60, 40, 100, 85) //ascent gyyna superheavy megamech
#define ARMOR_RIG_UNATHIHEAVY ADD_ARMOR(60, 47, 43, 60, 40, 100, 0) //heavy unathi rig

/* SPECIAL ARMOR
 * =============
 */

//abaltive, medium armor, but only pulse rifle/xray gun. No stun.
#define ARMOR_CLASS_LASER   ADD_ARMOR(30, 13.5, 37.5, 60, 25, 0, 0)

//ballistic, medium armor, but holds like tactical armor versus bullets
#define ARMOR_CLASS_BALLIS  ADD_ARMOR(30, 37.5, 13.5, 20, 25, 0, 0)

//riot armor, medium armor, but only fears an axe/sword
#define ARMOR_CLASS_RIOT    ADD_ARMOR(50, 13.5, 13.5, 20, 25, 0, 0)

//sapper voidsuit, medium armor, but can survive an explosion in front of bomb
#define ARMOR_CLASS_SAPPER  ADD_ARMOR(30, 15, 15, 20, 95, 100, 20)
