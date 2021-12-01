extends Node2D

const Trash = preload("res://scenes/Trash.tscn")

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents/DocumentSpawnArea.rect_position + Vector2(randf() * $Documents/DocumentSpawnArea.rect_size.x, randf() * $Documents/DocumentSpawnArea.rect_size.y)
  add_child(trash)


func _process(_delta):
  if get_tree().get_nodes_in_group("document").size() == 0:
    print("You win")
