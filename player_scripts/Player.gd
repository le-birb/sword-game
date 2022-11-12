
extends Actor

const Enemy = preload("res://Enemy.gd")

var snap_vec: Vector2 = Vector2(0, .05)

var walk_strength = 1000
var walk_speed = 400

var is_attacking = false
var is_blocking = false

var facing: int = 1
var prev_facing: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	# handle inputs
	acceleration = gravity
	
	if Input.is_action_pressed("move_left"):
		acceleration.x = -walk_strength
		facing = -1
	elif Input.is_action_pressed("move_right"):
		acceleration.x = walk_strength
		facing = 1
	elif is_on_floor():
		acceleration.x = -10 * velocity.x
	
#	if is_on_floor():
#		$CoyoteTimer.start()
#
#	if Input.is_action_just_pressed("jump") and not $CoyoteTimer.is_stopped():
#		velocity.y = -500
#	elif Input.is_action_pressed("jump"):
#		acceleration.y = gravity.y / 2
	
	velocity = velocity + acceleration * delta
	velocity.x = clamp(velocity.x, -walk_speed, walk_speed)
	velocity = move_and_slide(velocity, -gravity)

func _on_attack_timeout():
	is_attacking = false
	$Attack.monitoring = false
	$Attack.visible = false

func _attack():
	is_attacking = true
	$Attack.monitoring = true
	$Attack.visible = true
	$AnimatedSprite.play("attack")
	get_tree().create_timer(.2).connect("timeout", self, "_on_attack_timeout")


func _block():
	get_tree().create_timer(.2)

func _process(delta):
	is_blocking = false
	
	if is_attacking:
		return
	
	if facing != prev_facing:
		apply_scale(Vector2(-1, 1))
	
	if Input.is_action_just_pressed("attack"):
		_attack()
		
	if Input.is_action_just_pressed("block"):
		_block()
	if Input.is_action_pressed("block"):
		is_blocking = true
	
	if is_blocking:
		$AnimatedSprite.play("block")
	elif not is_attacking:
		$AnimatedSprite.play("walk")
	
	prev_facing = facing


func _on_Attack_body_entered(body):
	var enemy := body as Enemy
	if enemy:
		enemy.damage()


#class state:
#	func process():
#		pass
#
#class idle_state extends state:
#	func process():
#		if Input.is_action_just_pressed("jump"):
#			player.velocity.y = -500
#			player.curr_state = airborn_state.new()
#
#
#class airborn_state extends state:
#	func _init():
#		var coyote_timer = get_tree().create_timer(.1)
#	func process():
#		if Input.is_action_just_pressed("jump") and not coyote_timer.is_stopped():
#			player.velocity.y = -500
#		if Input.is_action_pressed("jump"):
#			player.acceleration.y = player.gravity.y / 2


