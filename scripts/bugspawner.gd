extends Node2D

const Ant = preload("res://scenes/Ant.tscn")

func _ready():
  pass 


func _on_SpawnTimer_timeout():
  var ant = Ant.instance()
  
  ant.speed = rand_range(100, 150)
  add_child(ant)
