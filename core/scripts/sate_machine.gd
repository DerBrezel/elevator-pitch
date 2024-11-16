extends Node
class_name StateMachine

@export var entry_state : State

var current_state : State
var states = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.machine = self
			states[child.name] = child
			
	Elevator.machine = self
	change_state(entry_state.name)

func _process(delta: float) -> void:
	if current_state != null:
		current_state.update(delta)

func change_state(state : String):
	if current_state != null:
		current_state.exit()
	
	current_state = states[state]
	current_state.enter()
	Elevator.on_state_change.emit(current_state)	
