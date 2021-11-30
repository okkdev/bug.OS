extends Area2D

func _ready():
  pass


func _on_Trash_area_entered(area):
  if area.is_in_group("document"):
    area.queue_deletion = true


func _on_Trash_area_exited(area):
  if area.is_in_group("document"):
    area.queue_deletion = false
