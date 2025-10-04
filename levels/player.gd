class_name Player extends CharacterBody2D

@export var SPEED = 600

@export var JUMP_VELOCITY = 1200
@export var CHAIN_JUMP_VELOCITY = 1800 
@export var gravity_terminal_velocity = 3000
@export var friction_floor = 10000
@export var friction_air = 5000
@export var gravity_muliplier = 4

var input = Vector2.ZERO
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * gravity_muliplier

var coyote_timer = 0
var jump_buffer = 0;

func _process(delta):
	if is_on_floor():
		coyote_timer = 5 * delta
	else:
		if coyote_timer > 0:
			coyote_timer -= delta

func _physics_process(delta):
	move(delta)
	move_and_slide()
	
func move(delta):

	var direction = Input.get_axis("d_left", "d_right")

	#Slow down for air friction
	if not is_on_floor() && coyote_timer<=0:
		velocity.y += gravity * delta

	if direction:
		velocity.x = direction * SPEED

	else:
		if is_on_floor():
			if abs(velocity.x) > (friction_floor * delta):
				velocity.x -= velocity.normalized().x * (friction_floor * delta)
			else:
				velocity.x = 0
		else:
			if abs(velocity.x) > (friction_air * delta):
				velocity.x -= velocity.normalized().x * (friction_air * delta)
			else:
				velocity.x = 0

	if Input.is_action_just_pressed("button_1"):
		jump_buffer= 5 * delta
		
	if is_on_floor() or coyote_timer > 0:
		if jump_buffer > 0 :
			jump_buffer = 0
			velocity.y = -JUMP_VELOCITY
	else :
		if Input.is_action_just_released("button_1") and !is_falling():
			velocity.y *= 0.5
	
	#Trash code please fix
	velocity.y = clamp(velocity.y,-gravity_terminal_velocity * 1000,gravity_terminal_velocity)
	jump_buffer -= delta
	print(jump_buffer)


func is_falling():
	return velocity.y > 0
