extends Label


func _ready() -> void:
	Elevator.on_state_change.connect(update_text)

func update_text(state : State):
	text = "state: " + str(state.name)
