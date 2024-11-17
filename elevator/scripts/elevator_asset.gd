extends Node3D


@onready var animation_player: AnimationPlayer = $Elevator/AnimationPlayer

var isOpened: bool = false


func _on_area_3d_area_entered(area: Area3D) -> void:
	if not isOpened and Elevator.machine.current_state.name == "Enter":
		animation_player.play("02_open")
		isOpened = true
		await animation_player.animation_finished
		Elevator.machine.change_state("Crank")
		isOpened = false
	if not isOpened and Elevator.machine.current_state.name == "WalkOut":
		animation_player.play("02_open")
		isOpened = true
		await animation_player.animation_finished
		Elevator.machine.change_state("MoveDown")
		isOpened = false
