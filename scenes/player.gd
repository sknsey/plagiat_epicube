extends CharacterBody2D

@export var speed = 400
@export var bullet_scene: PackedScene

@onready var player_sprite = $AnimatedSprite2D

var player_velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	player_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		player_velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		player_velocity.y += 1
	if Input.is_action_pressed("move_left"):
		player_velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		player_velocity.x += 1
		
	if player_velocity.length() > 0:
		player_velocity = player_velocity.normalized() * speed
		player_sprite.play()
	else:
		player_sprite.stop()
		
	position += velocity * delta
	
	move_and_collide(player_velocity * delta)
	player_sprite.look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"): 
		shoot()
	
	#print($AnimatedSprite2D/GunBarrelPosition.position)
	
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.transform = $AnimatedSprite2D/GunBarrelPosition.global_transform
	#bullet.position = $GunBarrelPosition.position
	#bullet.rotation = player_sprite.rotation
	#bullet.linear_velocity = Vector2(200,0).rotated(bullet.rotation)
	
	owner.add_child(bullet)
	

