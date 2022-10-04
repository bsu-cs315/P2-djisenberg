extends KinematicBody2D

var _velocity := Vector2.ZERO
var _speed := 150
var _gravity := 600
var _jump_impulse := 300
var _laser = preload("res://Laser.tscn")

onready var _sprite := find_node("AnimatedSprite")

func _process(_delta):
	if Input.is_action_pressed("laser"):
		var _laserEyes0 = _laser.instance()
		var _laserEyes1 = _laser.instance()
		_laserEyes0.move_local_x(18)
		_laserEyes0.move_local_y(-22)
		_laserEyes1.move_local_x(50)
		_laserEyes1.move_local_y(-22)
		add_child(_laserEyes0)
		add_child(_laserEyes1)

func _ready():
	pass


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
		
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	
	if not _velocity.x == 0:
		_sprite.playing = true
	else:
		_sprite.playing = false
		_sprite.frame = 0
	
	if input.x < 0:
		_sprite.scale.x = -1
	elif input.x > 0:
		_sprite.scale.x =1
