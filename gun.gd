extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	#loading bullet before the game starts
	const BULLET = preload("res://bullet.tscn")
	#creating instance of bullet
	var new_bullet = BULLET.instantiate()
	#getting starting location of bullet
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	#adding bullet as child to the shooting point dynamically
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
