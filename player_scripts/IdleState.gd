
class_name IdleState extends State

var player 

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		player.velocity.y = -500
		exit(get_node("../AirborneState"))
