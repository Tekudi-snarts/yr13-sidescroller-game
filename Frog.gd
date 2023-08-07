extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	#Gravity for Frog
	velocity.y += gravity * delta
	if chase == true:
		player = get_node("../../player/player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("Sprite2D").flip_h = true
		else:
			get_node("Sprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
			velocity.x = 0
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.name == "player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "player":
		death()
func _on_player_collison_body_entered(body):
	if body.name == "player":
		Game.playerHP -= 3
		death()
func death():
	Game.Gold += 5
	Utils.saveGame()
	chase = false
	get_node("Sprite2D")
	self.queue_free()
