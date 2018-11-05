/obj/item/toy/plushie/dakimakura
	name = "dakimakura"
	desc = "..."
	icon = 'icons/infinity_custom_items_obj.dmi'
	icon_state = "dakimakura_0"
	var/state = 0

	proc/swap_state()
		state = !state
		update_icon()

	update_icon()
		icon_state = "dakimakura_[state]"

	AltClick(var/mob/user)
		swap_state()
