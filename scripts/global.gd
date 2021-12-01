extends Node

var cursor = null

const objects_file = "res://assets/words/objects.txt"
const predicates_file = "res://assets/words/predicates.txt"

var objects: Array = []
var predicates: Array = []

var username: String = ""

func _ready():
  randomize()
  objects = load_file(objects_file)
  predicates = load_file(predicates_file)
  
  if OS.has_environment("USERNAME"):
    username = OS.get_environment("USERNAME")
  elif OS.has_environment("USER"):
    username = OS.get_environment("USER")
  else:
    username = Global.objects[randi() % Global.objects.size()].capitalize()

func load_file(file) -> Array:
  var f = File.new()
  f.open(file, File.READ)

  var res = []
  while not f.eof_reached():
    res.append(f.get_line())
        
  f.close()
  return res
