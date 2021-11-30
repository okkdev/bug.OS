extends RigidBody2D

export (float, -10000, 10000) var speed: float = 1000
var velocity: Vector2 = Vector2.ZERO

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  Global.cursor = self

func _input(event):
    if event is InputEventMouseMotion:
        velocity = event.relative

func _integrate_forces(s):
  var step = s.get_step()
  
  s.set_linear_velocity((velocity * speed) * step)

  velocity = Vector2.ZERO
