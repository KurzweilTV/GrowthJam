extends KinematicBody2D

export var move_speed := 400
export var max_zoom = Vector2(1.2,1.2)
export var min_zoom = Vector2(0.8,0.8)
var facingDir = Vector2.ZERO

func _process(delta):
	check_interactable()

func _physics_process(_delta):
	var move_dir = Vector2()
	
  # inputs
	if Input.is_action_pressed("move_up"):
		move_dir.y -= 1
		facingDir = Vector2(0, -1)
		$AnimatedSprite.play("walk_up")
	
	if Input.is_action_pressed("move_down"):
		move_dir.y += 1
		facingDir = Vector2(0, 1)
		$AnimatedSprite.play("walk_down")
	
	if Input.is_action_pressed("move_left"):
		move_dir.x -= 1
		facingDir = Vector2(-1, 0)
		$AnimatedSprite.play("walk_left")
	
	if Input.is_action_pressed("move_right"):
		move_dir.x += 1
		facingDir = Vector2(1, 0)
		$AnimatedSprite.play("walk_right")
		
	move_dir = move_dir.normalized()
	move_and_slide(move_dir * move_speed)


func _unhandled_input(event):
	if Input.is_action_just_pressed("zoom_in"):
		$Camera2D.zoom += Vector2(.1,.1)
		if $Camera2D.zoom > max_zoom:
			$Camera2D.zoom = max_zoom
	if Input.is_action_just_pressed("zoom_out"):
		$Camera2D.zoom -= Vector2(.1,.1)
		if $Camera2D.zoom < min_zoom:
			$Camera2D.zoom = min_zoom
	if Input.is_action_just_pressed("interact"): # interact with objects
		var collidor = check_interactable()
		if collidor and collidor.has_method("_interact"):
			collidor._interact()

func check_interactable():
	var cast_distance = 64
	$RayCast2D.set_cast_to(facingDir * cast_distance)
	
	if $RayCast2D.get_collider():
		return $RayCast2D.get_collider()
