extends CharacterBody2D

@export var direction = Vector2.RIGHT
@onready var hurtbox = $HurtBox

var spaceship 
var move_speed = 60
var move_speed_x = 60
var tile_size = 32
var offset = 64

var max_health = 2
var current_health

func _ready():
	current_health = max_health
	look_at(position + direction) # so that it looks the right way
	hurtbox.area_entered.connect(_on_hit_spaceship)

func _process(delta):
	position += direction * move_speed * delta

func take_damage():
	current_health -= 1
	if current_health <= 0:
		queue_free()
	

func _on_hit_spaceship(body : Node):
	if body.get_parent().is_in_group("spaceship"):
		print("SPACESHIP HIT")
	queue_free()
