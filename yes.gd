extends Button

func _input(event):
	if event is InputEventJoypadButton:
		if event.button_index == JOY_BUTTON_A and event.pressed:
			print("A button on the controller pressed")

func highlight_yes():
	grab_focus()
