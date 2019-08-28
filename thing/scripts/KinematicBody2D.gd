extends KinematicBody2D

# The player's movement speed in units per second. Set this instead of speed
export(float) var movespeed = 200
var _speed: float # This is the value we'll use for math, as it'll be multiplied by the tickrate


# Value between 0 and 1. Newton's first law; determines how fast the player's velocity changes. 0 means instantly, 1 means never
export(float, 1) var inertia = 0.75

# Vectors for us to do math on
var velocity: Vector2 = Vector2(0, 0)
var move_direction: Vector2 = Vector2(0,0)

func get_self():
	return self.get_self()

func _ready():
	_speed = movespeed * options.TICKRATE # Multiplies the speed per second by the tickrate

func _physics_process(delta):
	move_direction.x = -Input.get_action_strength('left') + Input.get_action_strength('right')
	move_direction.y = +Input.get_action_strength('down') - Input.get_action_strength('up')
	
	# Sprite flipping; change this once we get a better sprite
	if move_direction.x > 0:
		$Sprite.scale.x = 4
		$Sprite.position.x = 16
	elif move_direction.x<0:
		$Sprite.scale.x = -4
		$Sprite.position.x = -16
	
	velocity = velocity.linear_interpolate(move_direction.normalized() * _speed * delta, 1 - inertia)
	velocity = move_and_slide(velocity)