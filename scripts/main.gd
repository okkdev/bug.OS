extends Node2D

const Trash = preload("res://scenes/Trash.tscn")
const Window = preload("res://scenes/Window.tscn")

var win_pos: Vector2 = Vector2(100, 100)

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents/DocumentSpawnArea.rect_position + Vector2(randf() * $Documents/DocumentSpawnArea.rect_size.x, randf() * $Documents/DocumentSpawnArea.rect_size.y)
  add_child(trash)
  
  var window = Window.instance()
  window.get_node("Body").text = """
    
    """
  window.position = OS.window_size/2
  add_child(window)
  


func _process(_delta):
  if get_tree().get_nodes_in_group("document").size() == 0:
    $Bugs/SpawnTimer.stop()
    var window = Window.instance()
    window.get_node("Body").text = """
      Thanks for the hard work today.
      
      See you tommorrow.
      """
    window.position = win_pos
    add_child(window)
    win_pos = Vector2(fmod((win_pos.x + 10), OS.window_size.x), fmod((win_pos.y + 10), OS.window_size.y))
