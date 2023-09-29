class_name Projectile
extends Node2D

@export var speed = 1000.0
@export var lifetime = 3.0

var direction = Vector2.ZERO # this variable will be set by player, not here
var rush_bullet = false

@onready var timer = $Timer
@onready var hitbox = $HitBox
@onready var sprite = $Polygon2D
@onready var rush_sprite = $Polygon2D2
@onready var impact_detector = $ImpactDetector

func _ready():
	if MainSpawner.rush_mode:
		rush_sprite.visible = true
		sprite.visible = false
	top_level = true # so that it doesn't connect to the player, but is independent of it
	look_at(position + direction) # so that it looks the right way
	
	impact_detector.body_entered.connect(_on_impact) #for enemies
	impact_detector.area_entered.connect(_on_impact) #for obstacles
	

func _physics_process(delta):
	if MainSpawner.rush_mode:
		rush_bullet = true
	position += direction * speed * delta

func _on_impact(body : Node):
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
