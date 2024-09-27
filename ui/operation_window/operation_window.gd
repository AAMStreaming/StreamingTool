extends Control

func _on_update_button_pressed():
	var event_name: OptionButton = (get_node("%Event") as OptionButton)
	var event_data: PackedStringArray = event_name.get_item_text(event_name.get_selected_id()).split(":")
	var need_match_number: CheckButton = (get_node("%NeedMatchNumber") as CheckButton)
	var match_number: SpinBox = (get_node("%MatchNumber") as SpinBox)
	var comment: TextEdit = (get_node("%Comment") as TextEdit)
	var hide_total_score: CheckButton = (get_node("%HideTotalScore") as CheckButton)
	var first: SpinBox = (get_node("%First") as SpinBox)
	var second: SpinBox = (get_node("%Second") as SpinBox)
	var need_match_class: CheckButton = (get_node("%NeedMatchClass") as CheckButton)
	
	DataManager.event_name = event_data[1].replace(" ", "\n")
	DataManager.grade = event_data[0]
	DataManager.need_match_number = need_match_number.button_pressed
	DataManager.match_number = int(match_number.value)
	DataManager.comment = comment.text
	DataManager.hide_total_score = hide_total_score.button_pressed
	DataManager.match_class = [first.value, second.value]
	DataManager.need_match_class = need_match_class.button_pressed
	for i in range(7):
		DataManager.total_score[i] = int((
			get_node("%TotalScoreContainer/%Class" + str(i + 1)) as SpinBox
		).value)
	DataManager.update()


func _on_start_pressed():
	DataManager.timer_strat.emit()


func _on_stop_pressed():
	DataManager.timer_stop.emit()


func _on_reset_pressed():
	DataManager.timer_reset.emit()


func _on_initial_value_changed(_value: float):
	DataManager.timer_initial_value_changed.emit(
		(get_node("%Min") as SpinBox).value * 60 + (get_node("%Sec") as SpinBox).value
	)


func _on_option_button_item_selected(index):
	# カウントウダンのindexは0でカウントアップのindexは1
	if index == 0:
		DataManager.timer_speed_changed.emit(-1)
	else:
		DataManager.timer_speed_changed.emit(1)
