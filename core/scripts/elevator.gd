extends Node

const CHARGE_MULT := 1.0
var charge := 0.0

signal on_charge_changed

func add_charge(amount : float):
	charge += amount * CHARGE_MULT	
	on_charge_changed.emit(charge)
