extends Node2D

const Trash = preload("res://scenes/Trash.tscn")

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents.get_node("DocumentSpawnArea").rect_position + Vector2(randf() * $Documents.get_node("DocumentSpawnArea").rect_size.x, randf() * $Documents.get_node("DocumentSpawnArea").rect_size.y)
  add_child(trash)
