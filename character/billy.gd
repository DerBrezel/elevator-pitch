extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dingus_2: AnimationPlayer = $dingus2/AnimationPlayer

var hasArrived := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Elevator.machine.current_state.name == "Enter" and not hasArrived:
		hasArrived = true
		animation_player.play("enter")
		dingus_2.play("dingus_walk")
		#await animation_player.animation_finished
		#Elevator.machine.change_state("Crank")
	elif Elevator.machine.current_state.name == "WalkOut" and not hasArrived:
		hasArrived = true
		animation_player.play_backwards("enter")
		dingus_2.play("dingus_walk")
		await animation_player.animation_finished
	elif hasArrived and Elevator.machine.current_state.name != "Enter" and Elevator.machine.current_state.name != "WalkOut" :
		dingus_2.play("dingus_idle")
		hasArrived = false
