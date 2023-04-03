extends Viewport

func _on_ScoreCounter_scr(nr):
	$HistoryShow/HBoxContainer/VBoxContainer/Score.text = str("Score:", nr)

func _on_ScoreCounter_acr(nr2, nr3):
	var show = nr2 / nr3 if nr3 else 0.0
	$HistoryShow/HBoxContainer/VBoxContainer/Accuracy.text = str("Accuracy:","%d" % [show * 100], "%")
	
