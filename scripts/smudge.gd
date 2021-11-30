extends RigidBody2D

export (int, 0, 500) var speed: int = 100
var velocity: Vector2 = Vector2.ZERO
var cloud_center = null


func _ready():
  pass


func _integrate_forces(s):
  var step = s.get_step()
  var fuzzy = Vector2(
    rand_range(-10, 10), 
    rand_range(-10, 10))

  velocity += position.direction_to(cloud_center.position + fuzzy) * speed

  s.set_linear_velocity((velocity * speed) * step)
  
  velocity = Vector2.ZERO
