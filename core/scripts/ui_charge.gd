extends Label


func _ready() -> void:
	Elevator.on_charge_changed.connect(update_text)

func update_text(charge : float):
	text = "charge: " + str(charge)
