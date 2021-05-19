/obj/item/deck/attack_hand()
	if(!usr) return
	draw_card(usr)

/obj/item/deck/examine(mob/user)
	. = ..()
	if(cards.len)
		to_chat(user, "<br>There is still <b>[cards.len] card[cards.len > 1? "s" : ""]</b>.")
	to_chat(user, SPAN_NOTICE("You can deal cards at a table with clicking at it with grab intent."))

/obj/item/deck/compact
	name = "compact deck of cards"
	desc = "A deck of playing cards. Looks like this one hasn't numbers from two to five, and jokers."
	icon_state = "deck"

/obj/item/deck/compact/New()
	..()

	var/datum/playingcard/P
	for(var/suit in list("spades", "clubs", "diamonds", "hearts"))

		var/colour
		if(suit == "spades" || suit == "clubs")
			colour = "black_"
		else
			colour = "red_"

		for(var/number in list("ace", "six", "seven", "eight", "nine", "ten"))
			P = new()
			P.name = "[number] of [suit]"
			P.card_icon = "[colour]num"
			P.back_icon = "card_back"
			cards += P

		for(var/number in list("jack", "queen", "king"))
			P = new()
			P.name = "[number] of [suit]"
			P.card_icon = "[colour]col"
			P.back_icon = "card_back"
			cards += P
