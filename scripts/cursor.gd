extends KinematicBody2D

export var speed_multiplier = 1
var current_pos = Vector2()

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  current_pos = OS.window_size/2

func _input(event):
  if event is InputEventMouseMotion:
    update_y(event.relative.y * speed_multiplier)
    update_x(event.relative.x * speed_multiplier)

func _physics_process(delta):
  self.position.x = current_pos.x
  self.position.y = current_pos.y
  move_and_collide(Vector2() * delta)

func update_y(y):
  current_pos.y += y
  if current_pos.y < 0:
    current_pos.y = 0
  elif current_pos.y > OS.window_size.y:
    current_pos.y = OS.window_size.y
    
func update_x(x):
  current_pos.x += x
  if current_pos.x < 0:
    current_pos.x = 0
  elif current_pos.x > OS.window_size.x:
    current_pos.x = OS.window_size.x
