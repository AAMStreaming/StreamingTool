extends Control


func _ready() -> void:
	DataManager.updated.connect(update_element)


func update_element() -> void:
	(get_node("%EventName") as Label).text = DataManager.event_name
	
	for i in range(7):
		(get_node("%TotalScore/%Class" + str(i + 1)) as Label).text = str(DataManager.total_score[i]) + "点"
