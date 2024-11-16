extends Node
class_name StateMachine

@export var entry_state : State

var current_state : State
var states = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			
	Elevator.machine = self
	change_state(entry_state)

func _process(delta: float) -> void:
	if current_state != null:
		current_state.update(delta)

func change_state(state : State):
	if current_state != null:
		current_state.exit()
	
	current_state = state
	current_state.enter()
	Elevator.on_state_change.emit(current_state)
