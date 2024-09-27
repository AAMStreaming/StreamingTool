extends Control

func _on_update_button_pressed():
	var event_name: OptionButton = (get_node("%Event") as OptionButton)
	var event_data: PackedStringArray = event_name.get_item_text(event_name.get_selected_id()).split(":")
	var need_match_number: CheckButton = (get_node("%NeedMatchNumber") as CheckButton)
	var match_number: SpinBox = (get_node("%MatchNumber") as SpinBox)
	var comment: TextEdit = (get_node("%Comment") as TextEdit)
	var hide_total_score: CheckButton = (get_node("%HideTotalScore") as CheckButton)
	
	DataManager.event_name = event_data[1].replace(" ", "\n")
	DataManager.grade = event_data[0]
	DataManager.need_match_number = need_match_number.button_pressed
	DataManager.match_number = match_number.value
	DataManager.comment = comment.text
	DataManager.hide_total_score = hide_total_score.button_pressed
	for i in range(7):
		DataManager.total_score[i] = int((
			get_node("%TotalScoreContainer/%Class" + str(i + 1)) as SpinBox
		).value)
	DataManager.update()
