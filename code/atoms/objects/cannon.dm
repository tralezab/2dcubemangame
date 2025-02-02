/atom/movable/projectile/cannon_ball
	name = "cannonball"
	icon_state = "cannonball"
	turn_icon = 0

/atom/movable/projectile/cannon_ball/projectile_hit(atom/movable/A)
	. = 1
	if (!istype(A, /mob))
		return 0
	A.throw_at(x + dir2x(dir) * 2, y + dir2y(dir) * 2, 100, speed * 2)

/obj/cannon
	name = "cannon"
	desc = "wh.."
	icon_state = "cannon"
	density = 1
	rotatable = 1

/obj/cannon/left_click(adjacent)
	if (!adjacent)
		return
	var/atom/movable/projectile/cannon_ball/C = new(loc, get_step(src, dir), 50, 32)
	C.dir = dir
	C.shoot()