extends Node

signal updated

var event_name: String = ""
var grade: String = ""
var match_number: int = 1
var need_match_number: bool = true
var comment: String = ""
var hide_total_score: bool = false
var total_score: Array[int] = [0, 0, 0, 0, 0, 0, 0]

func update() -> void:
	updated.emit()
