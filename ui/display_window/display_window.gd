extends Node


func _ready() -> void:
	DataManager.updated.connect(update_element)


func update_element() -> void:
	(get_node("%EventName") as Label).text = DataManager.event_name
	(get_node("%InfoContainer") as HBoxContainer).visible = (DataManager.grade != "")
	(get_node("%Grade") as Label).text = DataManager.grade
	(get_node("%Comment") as Label).text = DataManager.comment
	var match_number_str: String = ""
	if DataManager.need_match_number:
		match_number_str = "第" + str(DataManager.match_number) + "試合"
	(get_node("%MatchNumber") as Label).text = match_number_str
	
	for i in range(7):
		var score: int = DataManager.total_score[i]
		var class_num: int = i
		var score_label: ScoreLabel = (get_node("%TotalScore/%Class" + str(class_num + 1)) as ScoreLabel)
		
		if DataManager.hide_total_score:
			score_label.score.text = "????"
		else:
			score_label.score.text = str(DataManager.total_score[class_num]).pad_zeros(4)
