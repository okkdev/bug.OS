extends Node

var current_pos = {"x": 0, "y": 0}
var speed_multiplier = 1

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  current_pos = {"x": OS.window_size.x/2, "y": OS.window_size.y/2}

func _input(event):
  if event is InputEventMouseMotion:
    update_y(event.relative.y)
    update_x(event.relative.x)

func _process(delta):
  $Sprite.position.x = current_pos.x
  $Sprite.position.y = current_pos.y

func update_y(y):
  current_pos.y += y * speed_multiplier
  if current_pos.y < 0:
    current_pos.y = 0
  elif current_pos.y > OS.window_size.y:
    current_pos.y = OS.window_size.y
    
func update_x(x):
  current_pos.x += x * speed_multiplier
  if current_pos.x < 0:
    current_pos.x = 0
  elif current_pos.x > OS.window_size.x:
    current_pos.x = OS.window_size.x
