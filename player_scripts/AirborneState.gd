
class_name AirborneState extends State



onready var coyote_timer = $CoyoteTimer
var player

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]


func physics_process(delta):
	# allow for jumps just after walking off an edge
	if Input.is_action_just_pressed("jump") and not coyote_timer.is_stopped():
		player.velocity.y = -500
	if Input.is_action_pressed("jump"):
		player.acceleration.y = player.gravity.y / 2

func process(delta):
	if player.is_on_floor():
		exit(get_node("../IdleState"))

func exit(_state):
	parent_fsm.back()
