extends Node
class_name GameOverManager

# initialized panel and audio when the game over is triggered
@onready var panel: Panel = $Panel
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# assign clock and health node
@onready var clock_node: Clock = $"../Timer"
@onready var health_node: Health = $"../../Player/Health"

# set the default satte and connect signal
func _ready():
	panel.visible = false
	clock_node.time_out.connect(_on_player_lost)
	health_node.health_depleted.connect(_on_player_lost)

# return to main menu
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") # change scene to main menu
	get_tree().paused = false

# restart the scene
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	get_tree().paused = false

# when the signal emitted, pause the game set the visibility of the panel to true
func _on_player_lost() -> void:
	panel.visible = true
	get_tree().paused = true
	audio_stream_player.play()
