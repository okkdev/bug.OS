extends Node2D

const Trash = preload("res://scenes/Trash.tscn")
const Window = preload("res://scenes/Window.tscn")

var win_pos: Vector2 = Vector2(100, 100)

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents/DocumentSpawnArea.rect_position + Vector2(randf() * $Documents/DocumentSpawnArea.rect_size.x, randf() * $Documents/DocumentSpawnArea.rect_size.y)
  add_child(trash)
  
  yield(get_tree().create_timer(5.0), "timeout")

  var window = Window.instance()
  window.get_node("Body").text = """Welcome %s!
We here at Flowers Inc. are glad to have you on board! Your new job here will be to manage files and clean out old, unused ones. Beware the OS might be a bit buggy.

Flowers Inc.
""" % Global.username
  window.position = OS.window_size/2
  add_child(window)
  


func _process(_delta):
  if get_tree().get_nodes_in_group("document").size() == 0:
    $Bugs/SpawnTimer.stop()
    var window = Window.instance()
    window.get_node("Body").text = """
Thanks for your hard work today.
      
See you tomorrow.
"""
    window.position = win_pos
    add_child(window)
    win_pos = Vector2(fmod((win_pos.x + 10), OS.window_size.x), fmod((win_pos.y + 10), OS.window_size.y))
