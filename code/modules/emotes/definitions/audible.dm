/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER burps."
	message_type = AUDIBLE_MESSAGE
//	var/emote_sound
/*
/decl/emote/audible/do_extra(var/atom/user) // infinity for new sound emote system
	if(emote_sound)
		playsound(user.loc, emote_sound, 50, 0)
*/
/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER lets out a waning guttural screech, green blood bubbling from its maw."

/decl/emote/audible/gasp
	key ="gasp"
	emote_message_3p = "USER задыхаетс&#255;!"
	conscious = 0

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER чешетс&#255;."

/decl/emote/audible/choke
	key ="choke"
	emote_message_3p = "USER давитс&#255;!"
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER gnarls and shows its teeth.."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER щебечет!"
	emote_sound = 'sound/misc/nymphchirp.ogg'

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "You sound an alarm."
	emote_message_3p = "USER sounds an alarm."

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "You let out a distressed noise."
	emote_message_3p = "USER lets out a distressed noise."

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "You play a loud tone."
	emote_message_3p = "USER plays a loud tone."

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "¬ы свистите!"
	emote_message_3p = "USER свистит!"

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "You boop."
	emote_message_3p = "USER boops."

/decl/emote/audible/sneeze
	key = "sneeze"
	emote_message_3p = "USER чихает!"

/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER нюхает."

/decl/emote/audible/snore
	key = "snore"
	emote_message_3p = "USER храпит."
	conscious = 0

/decl/emote/audible/whimper
	key = "whimper"
	emote_message_3p = "USER хнычет."

/decl/emote/audible/yawn
	key = "yawn"
	emote_message_3p = "USER зевает."

/decl/emote/audible/clap
	key = "clap"
	emote_message_3p = "USER хлопает."

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_message_3p = "USER усмехаетс&#255;."

/decl/emote/audible/cough
	key = "cough"
	emote_message_3p = "USER кашл&#255;ет!"
	conscious = 0

/decl/emote/audible/cry
	key = "cry"
	emote_message_3p = "USER плачет..."

/decl/emote/audible/sigh
	key = "sigh"
	emote_message_3p = "USER вздыхает."

/decl/emote/audible/laugh
	key = "laugh"
	emote_message_3p = "USER смеетс&#255;!"
	emote_message_3p_target = "USER смеетс&#255; над TARGET!"

/decl/emote/audible/mumble
	key = "mumble"
	emote_message_3p = "USER бормочет."

/decl/emote/audible/grumble
	key = "grumble"
	emote_message_3p = "USER бурчит."

/decl/emote/audible/groan
	key = "groan"
	emote_message_3p = "USER болезненно стонет!"
	conscious = 0

/decl/emote/audible/moan
	key = "moan"
	emote_message_3p = "USER стонет!"
	conscious = 0

/decl/emote/audible/giggle
	key = "giggle"
	emote_message_3p = "USER хихикает."

/decl/emote/audible/scream
	key = "scream"
	emote_message_3p = "USER кричит!"

/decl/emote/audible/grunt
	key = "grunt"
	emote_message_3p = "USER ворчит."

/decl/emote/audible/slap
	key = "slap"
	emote_message_1p_target = "<span class='warning'>You slap TARGET across the face!</span>"
	emote_message_1p = "You slap yourself across the face!"
	emote_message_3p_target = "<span class='warning'>USER slaps TARGET across the face!</span>"
	emote_message_3p = "USER slaps USER_SELF across the face!"
	emote_sound = 'sound/effects/snap.ogg'

/decl/emote/audible/bug_hiss
	key ="hiss"
	emote_message_3p_target = "USER шипит на TARGET!"
	emote_message_3p = "USER шипит!"
	emote_sound = 'sound/voice/BugHiss.ogg'

/decl/emote/audible/bug_buzz
	key ="buzz"
	emote_message_3p = "USER жужжит."
	emote_sound = 'sound/voice/BugBuzz.ogg'

/decl/emote/audible/bug_chitter
	key ="chitter"
	emote_message_3p = "USER верещит!"
	emote_sound = 'sound/voice/Bug.ogg'

/decl/emote/audible/vox_shriek
	key ="shriek"
	emote_message_3p = "USER SHRIEKS!"
	emote_sound = 'sound/voice/shriek1.ogg'
