extends KinematicBody2D

var _velocity := Vector2.ZERO
var _speed := 150
var _gravity := 600
var _jump_impulse := 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	var input := Vector2.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	_velocity.x = input.x * _speed
	
	
	
	if Input.is_action_pressed("move_up") and is_on_floor():
		_velocity.y = -_jump_impulse
	elif is_on_floor():
		_velocity.y = 0
	else:
		_velocity.y = _velocity.y + _gravity * delta
		
	
# warning-ignore:return_value_discarded	
	move_and_slide(_velocity, Vector2.UP)