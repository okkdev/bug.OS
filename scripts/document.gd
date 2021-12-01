extends Area2D

var grabbed:bool = false
var queue_deletion:bool = false

func _ready():
  $Sprite.frame = randi() % $Sprite.get_sprite_frames().get_frame_count("default")
  $Label.text = Global.predicates[randi() % Global.predicates.size()] + " " + Global.objects[randi() % Global.objects.size()]

func _process(_delta):
  if not grabbed and queue_deletion:
    queue_free()
