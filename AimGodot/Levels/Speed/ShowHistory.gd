extends Viewport

var scrB = 0
var accB = 0

func _on_ScoreCounter_scr(nr):
	if nr > scrB:
		$HistoryShow/HBoxContainer/VBoxContainer/Score.text = str("Score:", nr)
		scrB = nr
	if nr < scrB:
		$HistoryShow/HBoxContainer/VBoxContainer/Score.text = str("Score:", scrB)

func _on_ScoreCounter_acr(nr2, nr3):
	var show = nr2 / nr3 if nr3 else 0.0
	if show > accB:
		$HistoryShow/HBoxContainer/VBoxContainer/Accuracy.text = str("Accuracy:","%d" % [show * 100], "%")
		accB = show
	if show < accB:
		$HistoryShow/HBoxContainer/VBoxContainer/Accuracy.text = str("Accuracy:","%d" % [accB * 100], "%")
