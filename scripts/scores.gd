class_name Score
extends Node

# supposed to have declare the placeholder star
# supposed to import time signal when level cleared under time limit

@export var health: Health # supposed to share health variable
@export signal finish: game_finished_under_time_limit # supposed to export signal of finished game idk how
var score : int = 3

# display stars in label when level is cleared
func reveal_stars() -> void:
	if score == 0:
		$Stars.visible = false
		$Stars.visible = false
		$Stars.visible = false
	if score == 1:
		$Stars.visible = true
		$Stars.visible = false
		$Stars.visible = false
	if score == 2:
		$Stars.visible = true
		$Stars.visible = true
		$Stars.visible = false
	if score == 3:
		$Stars.visible = true
		$Stars.visible = true
		$Stars.visible = true
			

func decrease_score() -> void:
	if health <= 3: # i can't share variable in health.gd to connect here
		score -= 1
	if health <= 1:
		score -= 2
		if emit_signal(finish): # this function checked after health is checked
			score -= 0

func level_finished() -> void:
	reveal_stars()
	
