/obj/boombox
	name = "boombox"
	desc = "A device made for playing music, cool."
	icon_state = "boombox"
	var/in_use = 0
	var/last_use = 0

/obj/boombox/left_click()
	if (last_use > world.time)
		usr << "It has been used too recently."
	if (in_use)
		usr << "Someone is already using that."
		return
	in_use = 1
	var/sound/S = input("Select a sound file.") as null|sound
	if (!S)
		in_use = 0
		return
	S = sound(S)
	S.channel = 1024
	hearers() << S
	last_use = world.time + 100 // 10 second delay
	in_use = 0