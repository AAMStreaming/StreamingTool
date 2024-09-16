extends Control


func _on_update_button_pressed():
	var event_name: OptionButton = (get_node("%Event") as OptionButton)
	DataManager.event_name = event_name.get_item_text(event_name.get_selected_id())
	for i in range(7):
		DataManager.total_score[i] = int((
			get_node("%TotalScoreContainer/%Class" + str(i + 1)) as SpinBox
		).value)
	DataManager.update()
