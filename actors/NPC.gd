extends KinematicBody2D

const MIN_WANDER_INTERVAL = 1.0
const MAX_WANDER_INTERVAL = 5.0
const MAX_WANDER_DISTANCE = 500.0
const MOVE_SPEED = 1000.0

func _ready():
	wander()

func wander():
	# Set a random destination within a certain range
	var destination = Vector2(rand_range(-MAX_WANDER_DISTANCE, MAX_WANDER_DISTANCE), rand_range(-MAX_WANDER_DISTANCE, MAX_WANDER_DISTANCE))
	destination += position
	# Move towards the destination
	var direction = (destination - position).normalized()
	move_and_slide(direction * MOVE_SPEED)
	# Call the wander function again after a random interval
	yield(get_tree().create_timer(rand_range(MIN_WANDER_INTERVAL, MAX_WANDER_INTERVAL)), "timeout")
	wander()
