extends Area2D

var grabbed:bool = false
var queue_deletion:bool = false

func _ready():
  pass 

func _process(_delta):
  if not grabbed and queue_deletion:
    queue_free()
