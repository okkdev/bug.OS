extends KinematicBody2D

export (int, 0, 1000) var speed: int = 200
var velocity: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
  velocity += position.direction_to(Global.cursor.position) * speed
  self.look_at(Global.cursor.position)
  var collision = move_and_collide(velocity * delta)
  if collision:
#      mouse_motion = mouse_motion.bounce(-collision.normal*10)
      collision.collider.push(-(velocity/speed*2))
      move_and_collide(-velocity * delta)
      
  velocity = Vector2.ZERO

func push(vector: Vector2):
  velocity += vector * (speed/2)
