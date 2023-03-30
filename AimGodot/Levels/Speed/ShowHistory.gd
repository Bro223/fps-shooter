extends Viewport

func _on_ScoreCounter_scr(nr):
	$HistoryShow/HBoxContainer/VBoxContainer/Score.text = str("Score:", nr)

func _on_ScoreCounter_acr(nr2, nr3):
	$HistoryShow/HBoxContainer/VBoxContainer/Accuracy.text = str("Accuracy:","%d" % [(nr2/nr3) * 100], "%")
