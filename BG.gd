extends ParallaxBackground

var scrolling_speed = 100

func _process(delta):
	scroll_offset.x -= scrolling_speed * delta


func _on_area_2d_2_body_entered(body):
	pass # Replace with function body.
