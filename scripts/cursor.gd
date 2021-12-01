extends RigidBody2D

export (float, -10000, 10000) var speed: float = 1500
var velocity: Vector2 = Vector2.ZERO
var grabbing: bool = false
var hovering: bool = false
var in_window: bool = false
var window = null


func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
  Global.cursor = self


func _input(event):
    if event is InputEventMouseMotion:
        velocity = event.relative


func _integrate_forces(s):
  var step = s.get_step()
  s.set_linear_velocity((velocity * step) * speed)
  velocity = Vector2.ZERO
  
  
func _process(_delta):
  if Input.is_mouse_button_pressed(1) and hovering and Global.document:
    grabbing = true
    $Sprite.frame = 2
    Global.document.grabbed = true
    Global.document.position = self.position
  elif Input.is_mouse_button_pressed(1) and hovering and window:
    window.queue_free()
    window = null
    hovering = false
    in_window = false
  elif hovering and Global.document:
    $Sprite.frame = 1
    Global.document.grabbed = false    
    grabbing = false
  elif hovering:
    $Sprite.frame = 1
    grabbing = false
  else:
    $Sprite.frame = 0


func _on_Area2D_area_entered(area):
  if not grabbing:
    if area.is_in_group("document") and not in_window:
      hovering = true
      Global.document = area
    if area.is_in_group("window"):
      in_window = true
    if area.is_in_group("close") and in_window:
      hovering = true
      window = area.get_parent()


func _on_Area2D_area_exited(area):
  if not grabbing:
    if area.is_in_group("document") and not in_window:
      hovering = false
      Global.document = null
    if area.is_in_group("window"):
      in_window = false
    if area.is_in_group("close") and in_window:
      hovering = false
      window = null
