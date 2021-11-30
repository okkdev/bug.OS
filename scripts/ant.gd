extends RigidBody2D

export (int, 0, 500) var speed: int = 120
var velocity: Vector2 = Vector2.ZERO


func _ready():
  pass


func _integrate_forces(s):
  var step = s.get_step()
  self.look_at(Global.cursor.position)
  velocity += position.direction_to(Global.cursor.position) * speed

  s.set_linear_velocity((velocity * speed) * step)
  
  velocity = Vector2.ZERO
