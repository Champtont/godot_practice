extends Node2D	

var kills = 0

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()
	
func restart_game():
	get_tree().reload_current_scene()
	
func quit_game():
	get_tree().quit()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	%Yes.highlight_yes()

		
#for these to work, you need to set the process of the GameOver node process to always so that it ignores pause
func _on_yes_pressed():
	get_tree().paused = false
	restart_game()

func _on_no_pressed():
	get_tree().paused = false
	quit_game()
