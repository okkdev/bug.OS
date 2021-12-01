extends Node2D

export (int, 1, 50) var amount:int = 50
const Smudge = preload("res://scenes/Smudge.tscn")

func _ready():
  for _i in range(amount):
    var smudge = Smudge.instance()
    smudge.cloud_center = $Center
    add_child(smudge)
