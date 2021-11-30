extends Area2D

var grabbed:bool = false
var queue_deletion:bool = false

func _ready():
  $Sprite.frame = randi() % $Sprite.get_sprite_frames().get_frame_count("default")

func _process(_delta):
  if not grabbed and queue_deletion:
    queue_free()
