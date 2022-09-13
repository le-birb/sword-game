
extends Actor
class_name Enemy

var walk_speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	acceleration = gravity
	
	velocity = velocity + acceleration * delta
	velocity.x = clamp(velocity.x, -walk_speed, walk_speed)
	velocity = move_and_slide(velocity, -gravity)


func _process(delta):
	if current_health <= 0:
		self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
