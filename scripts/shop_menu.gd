extends Control

@onready var shop: Panel = $Shop
@onready var buy: Button = $Shop/Buy
@onready var buy_2: Button = $Shop/Buy2
@onready var buy_3: Button = $Shop/Buy3
@onready var currency: Label = $Shop/Currency
@onready var customitazion: Panel = $Customitazion
@onready var change_mode: Button = $ChangeMode

var current_currency: int = 1000

func _ready() -> void:
	shop.visible = true
	customitazion.visible = false
	change_mode.text = "Customization"
	
func _process(delta: float) -> void:
	current_currency = clampi(current_currency, 0, 9999999)
	currency.text = str(current_currency)

func _on_buy_pressed() -> void:
	if LevelCore.lvl0_completed:
		current_currency -= 100
		currency.text = str(current_currency)

func _on_buy_2_pressed() -> void:
	if LevelCore.lvl1_completed:
		current_currency -= 200
		currency.text = str(current_currency)

func _on_buy_3_pressed() -> void:
	if LevelCore.lvl4_completed:
		current_currency -= 300
		currency.text = str(current_currency)


func _on_change_mode_pressed() -> void:
	if shop.visible:
		shop.visible = false
		customitazion.visible = true
		change_mode.text = "Shop"
	else:
		_ready()
