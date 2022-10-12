extends Node

class_name StateMachine

var state setget enter_state


func _ready():
	enter_state(get_child(0))

func enter_state(new_state):
	state = new_state
	state.fsm = self
	state.enter()

func _process(delta):
	state.process(delta)

func _physics_process(delta):
	state.physics_process(delta)

func _input(event):
	state.input(event)

func _unhandled_input(event):
	state.unhandled_input(event)

func _unhandled_key_input(event):
	state.unhandled_key_input(event)

func _notification(what):
	if state:
		state.notification(what)

