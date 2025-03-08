extends Node2D	

var kills = 0
var level = 1

func spawn_mob():
		var new_mob = preload("res://mob.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		add_child(new_mob)
		
func spawn_mob2():
		level += 1
		%MobTimer.wait_time = .3
		var new_mid_mob = load("res://mob_2.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mid_mob.global_position = %PathFollow2D.global_position
		add_child(new_mid_mob)

func _on_timer_timeout():
	if level == 1 && Survivegame.kills < 10:
		spawn_mob()
	else:
		spawn_mob2()
	
func restart_game():
	level = 1
	Survivegame.kills = 0
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
