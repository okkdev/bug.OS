extends Node2D

const Trash = preload("res://scenes/Trash.tscn")
const Window = preload("res://scenes/Window.tscn")

var win_pos: Vector2 = Vector2(100, 100)
var gameover: bool = false
var error: int = 200

func _ready():
  var trash = Trash.instance()
  trash.position = $Documents/DocumentSpawnArea.rect_position + Vector2(randf() * $Documents/DocumentSpawnArea.rect_size.x, randf() * $Documents/DocumentSpawnArea.rect_size.y)
  add_child(trash)
  
  yield(get_tree().create_timer(5.0), "timeout")

  var window = Window.instance()
  window.get_node("Body").text = """Welcome %s!
We here at Flowers Inc. are glad to have you on board! Your new job here will be to manage files and clean out old, unused ones. Beware the OS might be a bit buggy. Please be done by 10am.

Flowers Inc.
""" % Global.username
  window.position = OS.window_size/2
  add_child(window)
  


func _process(_delta):
  if gameover:
    $Taskbar/Time.text = "10:00 am"
  else:
    var time = int(60 - $GameOver.time_left)
    $Taskbar/Time.text = "09:" + (String(time) if time > 9 else "0" + String(time)) + " am"
  
  if get_tree().get_nodes_in_group("document").size() == 0 or gameover:
    $Bugs/SpawnTimer.stop()
    $Cursor.visible = false
    for b in get_tree().get_nodes_in_group("bug"):
      b.queue_free()
    
    var window = Window.instance()
    
    if gameover:
        window.get_node("Body").text = """
What?! You're not done yet?

YOU'RE FIRED!
"""
    else:
      $GameOver.stop()
      window.get_node("Body").text = """
Thanks for your hard work today.
      
See you tomorrow.
"""
    if error > 1:
      window.position = win_pos
      add_child(window)
      win_pos = Vector2(fmod((win_pos.x + 10), OS.window_size.x), fmod((win_pos.y + 10), OS.window_size.y))
    elif error == 1:
      window.position = OS.window_size/2
      add_child(window)
    error -= 1



func _on_GameOver_timeout():
  gameover = true
