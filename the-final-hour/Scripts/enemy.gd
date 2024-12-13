extends CharacterBody2D

@onready var Bullet : PackedScene  = preload("res://Scenes/bullet.tscn")
var class_resource = 100

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var owner_class = 0
var bullet_spd_mod = 1
var scale_mod = Vector2(0.5,0.5)
var current_level = 1

func _ready() -> void:
	
	randomize()
	var random_race = randi_range(0,3)
	randomize()
	var random_class = randi_range(0,3)
	
	
	Autoloads.race = Autoloads.race_list[random_race]
	Autoloads.player_class = Autoloads.class_list[random_class]
	Autoloads.passive = random_race
	
	owner_class = random_class
	print(Autoloads.race)
	print(Autoloads.player_class)
	print(owner_class)


func _physics_process(delta: float) -> void:
	current_level = float(Autoloads.level/10.0)
	velocity.x = SPEED * current_level
	if velocity.length() > 0:
		move_and_slide()

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	match owner_class:
		0:
			b.scale = Vector2(0.25,0.25)
			bullet_spd_mod = 10
		1:
			b.scale = Vector2(0.4,0.4)
			bullet_spd_mod = 5
		2:
			b.scale = Vector2(0.5,0.5)
			bullet_spd_mod = 1
		3:
			b.scale = Vector2(1,1)
			bullet_spd_mod = 0.8
			
	b.speed = b.speed * bullet_spd_mod
			
	print("shoot")
