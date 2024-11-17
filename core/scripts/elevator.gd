extends Node

const CHARGE_MULT := 1.0
var charge := 0.0
var goal := 1

var machine : StateMachine

signal on_charge_changed
signal on_state_change(state : State)


func add_charge(amount : float):
	charge += amount * CHARGE_MULT	
	on_charge_changed.emit(charge)
