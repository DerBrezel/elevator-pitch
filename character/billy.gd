extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var hasArrived := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Elevator.machine.current_state.name == "Enter" and not hasArrived:
		hasArrived = true
		animation_player.play("enter")
		#await animation_player.animation_finished
		#Elevator.machine.change_state("Crank")
