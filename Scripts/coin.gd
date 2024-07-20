extends Area2D


@onready var game_manager = %GameManager
@onready var pickup_sound = $PickUpSound
@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if pickup_sound.playing:
		pickup_sound.stop()
	pickup_sound.play()
	
	
	game_manager.add_point()
	
	collision_shape.queue_free()
	animated_sprite.queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	queue_free()
