extends Node

signal updated

signal timer_strat
signal timer_stop
signal timer_reset
signal timer_initial_value_changed(value: float)
signal timer_speed_changed(speed: float)

var event_name: String = ""
var grade: String = ""
var match_number: int = 1
var need_match_number: bool = true
var comment: String = ""
var hide_total_score: bool = false
var match_class: Array[int] = [0, 0]
var need_match_class: bool = true
var total_score: Array[int] = [0, 0, 0, 0, 0, 0, 0]

func update() -> void:
	updated.emit()
