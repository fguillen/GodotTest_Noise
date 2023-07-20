# -- 01 @tool
# -- 02 class_name
# -- 03 extends
extends Control

# -- 04 # docstring
#
# -- 05 signals
# -- 06 enums
# -- 07 constants
# -- 08 exported variables
@export var noise : FastNoiseLite

# -- 09 public variables
# -- 10 private variables
var _noise_index := 0.0
var _min_value := 0.0
var _max_value := 0.0
var _first_values := true

# -- 11 onready variables
@onready var progress_bar = %ProgressBar
@onready var min_value_label = %MinValue
@onready var max_value_label = %MaxValue


#
# -- 12 optional built-in virtual _init method
# -- 13 optional built-in virtual _enter_tree() method
# -- 14 built-in virtual _ready method
# -- 15 remaining built-in virtual methods
func _process(delta):
	_noise_index += delta
	var value = noise.get_noise_1d(_noise_index)
	progress_bar.value = value

	
	if _first_values or (_min_value > value):
		_min_value = value
		min_value_label.text = str(snappedf(_min_value, 0.001))
		
	if _first_values or (_max_value < value):
		_max_value = value
		max_value_label.text = str(snappedf(_max_value, 0.001))
		
	_first_values = false
# -- 16 public methods
# -- 17 private methods
# -- 18 signal listeners
# -- 19 innerclasses

