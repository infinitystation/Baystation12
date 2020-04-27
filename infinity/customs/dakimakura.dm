/obj/item/toy/plushie/dakimakura
	name = "dakimakura"
	desc = "..."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "dakimakura_0"
	var/state = 0
	trade_blacklisted = TRUE

	proc/swap_state()
		state = !state
		update_icon()

	update_icon()
		icon_state = "dakimakura_[state]"

	AltClick(var/mob/user)
		swap_state()
