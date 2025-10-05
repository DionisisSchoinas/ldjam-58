class_name Player extends CharacterBody2D

@export var SPEED = 600

@export var JUMP_VELOCITY = 1200
@export var CHAIN_JUMP_VELOCITY = 1800 
@export var gravity_terminal_velocity = 3000
@export var friction_floor = 10000
@export var friction_air = 5000
@export var gravity_muliplier = 4
@export var wall_ride_speed = 2400

var input = Vector2.ZERO
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * gravity_muliplier

var direction_horizontal
var direction_vertical

var coyote_timer = 0
var jump_buffer = 0
var idle_timer = 0

var collision_shape: CollisionShape2D

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
	var dir_x := Input.get_axis("d_left", "d_right")
	var dir_y := Input.get_axis("d_up", "d_down")
	
	if idle_timer > 0 :
		dir_x = 0

	# Apply gravity if not on the floor (with coyote timer check)
	if is_on_wall():
		if Input.is_action_pressed("button_2"):
			velocity.y = dir_y * SPEED
		else:
			velocity.y = wall_ride_speed * delta
	elif is_in_the_air():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("button_1"):
		jump_buffer = 5 * delta

	# Horizontal movement
	if dir_x != 0:
		velocity.x = dir_x * SPEED
	else:
		_apply_friction(delta)

	# Jump logic
	_handle_jump_logic(dir_y, delta)

	# Clamp vertical velocity
	velocity.y = clamp(velocity.y, -gravity_terminal_velocity * 1000, gravity_terminal_velocity)

	# Decrease jump buffer over time
	jump_buffer = max(jump_buffer - delta, 0)
	idle_timer = max(idle_timer - delta, 0)
	
func is_falling():
	return velocity.y > 0
	
func is_in_the_air():
	return not is_on_floor() and coyote_timer <= 0
	
func _apply_friction(delta):
	var friction = friction_floor if is_on_floor() else friction_air
	if abs(velocity.x) > friction * delta:
		velocity.x -= sign(velocity.x) * friction * delta
	else:
		velocity.x = 0

func _handle_jump_logic(dir_y, delta):
	if is_on_floor_custom():
		if jump_buffer > 0:
			_perform_jump()
	elif is_on_wall():
		_handle_wall_jump(dir_y, delta)
	if Input.is_action_just_released("button_1") and not is_falling():
		velocity.y *= 0.5
		

func _perform_jump():
	jump_buffer = 0
	velocity.y = -JUMP_VELOCITY


func _handle_wall_jump(dir_y, delta):
	if jump_buffer > 0:
		var collision = get_last_slide_collision()
		if collision.get_normal().x > 0:
			velocity.x = JUMP_VELOCITY
		elif collision.get_normal().x < 0:
			velocity.x = -JUMP_VELOCITY
		jump_buffer = 0
		idle_timer = 10 * delta
		velocity.y = -JUMP_VELOCITY
		


func is_on_floor_custom():
	return is_on_floor_only() or coyote_timer > 0
	
