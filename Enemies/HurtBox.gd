class_name HurtBox
extends Area2D

func _init():
	monitorable = false
	#collision_mask = 2


func _ready():
	#area_entered.connect(_on_area_entered)
	pass


func _on_area_entered(hitbox: HitBox):
	if owner.has_method("take_damage"):
		owner.take_damage()
