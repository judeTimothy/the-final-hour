extends Node2D

#character creation
var race_list = ["human", "elf", "orc", "dwarf"]
var race = ""
var passive = 0
var class_list = ["gunslinger", "ranger", "mage","barbarian"]
var player_class = ""
var class_resource = 100

#base
var base_health = 100
var base_armor = 25

#resource
var scrap = 0
var solmark = 0

func _ready() -> void:
	randomize()
	var random_race = randi_range(1,4) - 1
	randomize()
	var random_class = randi_range(1,4) - 1
	
	race = race_list[random_race]
	player_class = class_list[random_class]
	passive = random_race
	print(passive, " - from main")
	#print(race)
	#print(player_class)



func _process(delta: float) -> void:
	pass
