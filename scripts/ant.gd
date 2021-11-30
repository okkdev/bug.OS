extends RigidBody2D

export (int, 0, 500) var speed: int = 100
var velocity: Vector2 = Vector2.ZERO


func _ready():
  pass


func _integrate_forces(s):
  var step = s.get_step()
  var cursor_pos = Global.cursor.position
  var fuzzy = Vector2(
    rand_range(-self.position.distance_to(cursor_pos)/5, self.position.distance_to(cursor_pos)/5), 
    rand_range(-self.position.distance_to(cursor_pos)/5, self.position.distance_to(cursor_pos)/5))
  
  self.look_at(cursor_pos + fuzzy)
  velocity += position.direction_to(cursor_pos + fuzzy) * speed

  s.set_linear_velocity((velocity * speed) * step)
  
  velocity = Vector2.ZERO
