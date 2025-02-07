extends CharacterBody2D
#player code 
# edit input through project tab

func _physics_process(delta):
	#calculate character position
	var direction = Input.get_vector("move_left", "move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	#add animation
	#$ is shortcut for get_node
	#setting Access as Unique Name, will get around the heiarchy issue
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
