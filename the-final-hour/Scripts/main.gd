extends Node2D

@onready var Player: PackedScene = preload("res://Scenes/player.tscn")
@onready var Enemy: PackedScene = preload("res://Scenes/enemy.tscn")




#base
var base_health = 100
var base_armor = 25

#resource
var scrap = 0
var solmark = 0

func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass


func _on_spawner_timeout() -> void:
	var e = Enemy.instantiate()
	e.position = $SpawnPoint.global_position
	add_child(e)
