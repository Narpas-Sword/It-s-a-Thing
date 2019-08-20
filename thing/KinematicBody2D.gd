extends KinematicBody2D

const TICKRATE: int = 60

# The player's movement speed in units per second. Set this instead of speed
var movespeed: float = 200
var speed: float = movespeed*TICKRATE # Multiplies the speed per second by the tickrate


# Value between 0 and 1. Newton's first law; determines how fast the player's velocity changes. 0 means instantly, 1 means never
var inertia: float = 0.75

# Vectors for us to do math on
var velocity: Vector2 = Vector2(0, 0)
var move_direction: Vector2 = Vector2(0,0)

func _ready():
	pass

func _physics_process(delta):
	move_direction.x = -Input.get_action_strength('left') + Input.get_action_strength('right')
	move_direction.y = +Input.get_action_strength('down') - Input.get_action_strength('up')
	
	velocity = velocity.linear_interpolate(move_direction.normalized() * speed * delta, 1 - inertia)
	velocity = move_and_slide(velocity)