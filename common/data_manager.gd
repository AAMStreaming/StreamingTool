extends Node

signal updated

var event_name: String = ""
var total_score: Array[int] = [0, 0, 0, 0, 0, 0, 0]

func update() -> void:
	updated.emit()
