extends Node2D

export (int, 1, 50) var amount:int = 20
const Document = preload("res://scenes/Document.tscn")

func _ready():
  for _i in range(amount):
    var document = Document.instance()
    document.position = $DocumentSpawnArea.rect_position + Vector2(randf() * $DocumentSpawnArea.rect_size.x, randf() * $DocumentSpawnArea.rect_size.y)
    add_child(document)
