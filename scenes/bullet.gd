extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 1500

var bullet_velocity = Vector2.ZERO

func _physics_process(delta):
	position += transform.x * speed * delta
	
	#move_and_collide(bullet_velocity * delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.play("default")
	
	#bullet_velocity.x = position.x
	#bullet_velocity.y = position.y
	#
	#bullet_velocity = bullet_velocity.normalized() * speed
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
