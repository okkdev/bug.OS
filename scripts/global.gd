extends Node

var cursor = null

onready var objects_file = "res://assets/words/objects.txt"
onready var predicates_file = "res://assets/words/predicates.txt"
var objects: Array = []
var predicates: Array = []

func _ready():
  randomize()
  objects = load_file(objects_file)
  predicates = load_file(predicates_file)

func load_file(file) -> Array:
  var f = File.new()
  f.open(file, File.READ)

  var res = []
  while not f.eof_reached():
    res.append(f.get_line())
        
  f.close()
  return res
