extends Node


func _ready() -> void:
	DataManager.updated.connect(update_element)


func update_element() -> void:
	(get_node("%EventName") as Label).text = DataManager.event_name
	
	var sort_total_score: Array = []
	
	for i in range(7):
		sort_total_score.append([DataManager.total_score[i], i])
	
	sort_total_score.sort_custom(
		func(a, b) -> bool:
			if a[0] > b[0]:
				return true
			elif a[0] < b[0]:
				return false
			else:
				if a[1] < b[1]:
					return true
				else:
					return false
	)
	
	for i in range(7):
		var score: int = sort_total_score[i][0]
		var class_num: int = sort_total_score[i][1]
		var score_label: ScoreLabel = (get_node("%TotalScore/%Class" + str(class_num + 1)) as ScoreLabel)
		
		score_label.get_parent().move_child(score_label, i)
		score_label.score.text = str(DataManager.total_score[class_num]) + "点"
