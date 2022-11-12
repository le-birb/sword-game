extends Node

class_name StateMachine

var state

var history = []

func _ready():
	change_state(get_child(0))

func change_state(new_state):
	history.append(new_state)
	_enter_state(new_state)

func back():
	if history.size() > 0:
		_enter_state(history.pop_back())
	else:
		# fall back on idle state, adding it to the history as well
		change_state($IdleState)

func _enter_state(new_state):
	state = new_state
	state.parent_fsm = self
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

