extends KinematicBody2D

export (float, -10, 10) var speed: float = 0.8
var velocity: Vector2 = Vector2.ZERO

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  Global.cursor = self

func _input(event):
    if event is InputEventMouseMotion:
        velocity = event.relative

func _physics_process(delta):
    var collision = move_and_collide(velocity * speed, false)
    if collision:
#      velocity = velocity.bounce(-collision.normal*10)
      collision.collider.push(velocity)
    
    velocity = Vector2.ZERO

func push(vector: Vector2):
  velocity += vector
