extends Node

@export var machine : StateMachine

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("1"):
		machine.change_state(machine.states["Enter"])
	if event.is_action_pressed("2"):
		machine.change_state(machine.states["Crank"])
	if event.is_action_pressed("3"):
		machine.change_state(machine.states["MoveUp"])
	if event.is_action_pressed("4"):
		machine.change_state(machine.states["MoveDown"])
	if event.is_action_pressed("5"):
		machine.change_state(machine.states["WalkOut"])
	if event.is_action_pressed("6"):
		machine.change_state(machine.states["Complain"])
