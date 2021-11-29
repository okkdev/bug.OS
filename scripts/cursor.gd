extends KinematicBody2D

export var speed = 0.5
var mouse_motion: Vector2 = Vector2.ZERO
var mouse_moving: bool = false

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
    if event is InputEventMouseMotion:
        mouse_moving = true
        mouse_motion = event.relative

func _physics_process(delta):
    if mouse_moving:
        move_and_collide(mouse_motion * speed)
        mouse_moving = false
    mouse_motion = Vector2.ZERO
