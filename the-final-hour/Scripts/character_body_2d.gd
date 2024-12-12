extends CharacterBody2D

@export var Bullet : PackedScene 

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var owner_class = 0
var bullet_spd_mod = 1
var scale_mod = Vector2(0.5,0.5)

func _ready() -> void:
	print(owner.passive, " - from child")
	owner_class = owner.player_class
	


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_up",true):
		#animated_sprite_2d.play("up")
		velocity.y = -SPEED
	if Input.is_action_pressed("ui_down",true):
		#animated_sprite_2d.play("face_down")
		velocity.y = SPEED
	if Input.is_action_pressed("ui_left",true):
		#animated_sprite_2d.play("left")
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right",true):
		#animated_sprite_2d.play("right")
		velocity.x = SPEED
	if velocity.length() > 0:
		move_and_slide()

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	match owner_class:
		0:
			b.scale = Vector2(0.25,0.25)
			bullet_spd_mod = 2
		1:
			b.scale = Vector2(0.4,0.4)
			bullet_spd_mod = 1.5
		2:
			b.scale = Vector2(0.5,0.5)
			bullet_spd_mod = 1
		3:
			b.scale = Vector2(1,1)
			bullet_spd_mod = 0.8
			
	b.speed = b.speed * bullet_spd_mod	
			
	print("shoot")
