extends Node2D

const Ant = preload("res://scenes/Ant.tscn")
const Cloud = preload("res://scenes/Cloud.tscn")

func _ready():
  pass 


func _on_SpawnTimer_timeout():
  spawn_ant()
  if $SpawnTimer.wait_time != 1:
    $SpawnTimer.wait_time -= 1

func spawn_ant():
  var ant = Ant.instance()
  $Spawn/SpawnPath.offset = randi()
  ant.position = $Spawn/SpawnPath.position
  ant.speed = rand_range(80, 120)
  add_child(ant)
  
func spawn_cloud():
  pass
