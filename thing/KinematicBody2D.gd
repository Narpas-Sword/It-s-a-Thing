extends KinematicBody2D

var speed = 200

var Move_direction = Vector2(0,0)

func _ready():
	pass

func _physics_process(delta):
	Move_direction.x = -Input.get_action_strength('left') + Input.get_action_strength('right')
	Move_direction.y = +Input.get_action_strength('down') - Input.get_action_strength('up')
	
	var velocity = Move_direction.normalized() * speed
	velocity = move_and_slide(velocity)