

extends KinematicBody2D

class_name Actor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_health: int = 3
var current_health: int = 3

const gravity: Vector2 = Vector2(0, 2000)

var velocity: Vector2 = Vector2.ZERO
var acceleration: Vector2 = gravity

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

func damage(damage = 1):
	current_health = current_health - damage
	print(current_health)
	if current_health < 0:
		pass

#func _physics_process(delta):
#	velocity = velocity + acceleration * delta
#	velocity = move_and_slide(velocity, -gravity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

