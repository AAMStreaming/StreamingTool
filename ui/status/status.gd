extends VBoxContainer
class_name Status

@onready var first_con: Control = (get_node("%First") as Control)
@onready var second_con: Control = (get_node("%Second") as Control)
@onready var timer: Label = (get_node("%Timer") as Label)

var is_runnning: bool = false
var speed: float = -1.0
var initial_value: float = 0.0
var current_value: float = initial_value

var class_boxes: Array[PackedScene] = [
	preload("res://ui/class_box/class1.tscn"),
	preload("res://ui/class_box/class2.tscn"),
	preload("res://ui/class_box/class3.tscn"),
	preload("res://ui/class_box/class4.tscn"),
	preload("res://ui/class_box/class5.tscn"),
	preload("res://ui/class_box/class6.tscn"),
	preload("res://ui/class_box/class7.tscn"),
]

func change_match_class_visibility(visibility: bool) -> void:
	(get_node("%ClassContainer") as HBoxContainer).visible = visibility

func change_class(first: int, second: int) -> void:
	for c in first_con.get_children(): c.queue_free()
	for c in second_con.get_children(): c.queue_free()
	
	first_con.add_child(class_boxes[first].instantiate())
	second_con.add_child(class_boxes[second].instantiate())

func timer_start():
	is_runnning = true

func timer_stop():
	is_runnning = false

func timer_reset():
	current_value = initial_value

func change_initial_value(value: float) -> void:
	initial_value = value

func change_speed(s: float) -> void:
	speed = s

func _process(delta):
	timer.text = str(floori(current_value / 60)).pad_zeros(2) \
		+ ":" \
		+ str(floori(fmod(current_value, 60))).pad_zeros(2)
	if not is_runnning:
		return
	current_value += delta * speed
	if current_value <= 0:
		current_value = 0
		is_runnning = false
