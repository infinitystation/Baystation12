/mob/living/proc/night_vision()
    set name = "Night Vision"
    set desc = "Turning on your natural ability."
    set category = "Abilities"


    if(src.see_invisible  == 25)
        see_invisible = 15
    else
        see_invisible = 25