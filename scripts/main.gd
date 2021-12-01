extends Node2D

const Trash = preload("res://scenes/Trash.tscn")

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents/DocumentSpawnArea.rect_position + Vector2(randf() * $Documents/DocumentSpawnArea.rect_size.x, randf() * $Documents/DocumentSpawnArea.rect_size.y)
  add_child(trash)
