extends Control


func _on_update_button_pressed():
	DataManager.event_name = (get_node("%Event") as LineEdit).text
	for i in range(7):
		DataManager.total_score[i] = int((
			get_node("%TotalScoreContainer/%Class" + str(i + 1)) as SpinBox
		).value)
	DataManager.update()
