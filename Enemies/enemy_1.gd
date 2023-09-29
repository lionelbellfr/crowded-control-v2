class_name Enemy
extends CharacterBody2D

@export var direction = Vector2.RIGHT
@onready var hurtbox = $HurtBox

static var rush_mode = false

var signaler_node

var spaceship 
var move_speed = 100

var max_health = 2
var current_health

func _ready():
	current_health = max_health
	look_at(position + direction) # so that it looks the right way
	hurtbox.area_entered.connect(take_damage)
	signaler_node = get_tree().get_first_node_in_group("spawnersignaler")

func _process(delta):
	position += direction * move_speed * delta
	

func take_damage(body : Node):
	if body.get_parent().is_in_group("spaceship"):
		signaler_node.spaceship_health -= 1
		signaler_node.num_defeated_enemies += 1
		queue_free()
	else:
		max_health -= 1
		if max_health <= 0:
			signaler_node.num_defeated_enemies += 1
			queue_free()
