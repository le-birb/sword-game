
class_name State extends Node

var parent_fsm: StateMachine

func enter():
	pass

func exit(next_state: State):
	parent_fsm.change_state(next_state)

func _ready():
	pass 

func process(delta):
	pass

func physics_process(delta):
	pass

func input(event):
	pass

func unhandled_input(event):
	pass

func unhandled_key_input(event):
	pass

func notification(what, flag = false):
	pass

