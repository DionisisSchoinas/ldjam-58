extends Node

enum KEY {
	D_RIGHT_KEY_INDEX = 0,
	D_LEFT_KEY_INDEX = 1,
	BUTTON_1_KEY_INDEX = 2,
	BUTTON_2_KEY_INDEX = 3
}

class Power:
	var _id : int
	var _name : String
	
	func _init(id=0, name="p") :
		_id = id
		_name = name + str(_id)

class PowerKey:
	var _id : int
	var _key_action_button : String
	var _unlocked : bool
	var _power : Power
	
	func _init(id=0, key_action_button="-", unlocked=false, power=null):
		_id = id
		_key_action_button = key_action_button
		_unlocked = unlocked
		_power = power
		
	func has_power() -> bool:
		return _power != null

var powers: Array[Power] = [
	Power.new(0),
	Power.new(1),
	Power.new(2),
	Power.new(3),
	Power.new(4),
	Power.new(5),
	Power.new(6, "e")
]

var keys: Array[PowerKey] = [
	PowerKey.new(KEY.D_RIGHT_KEY_INDEX, ">", true, powers.get(0)),
	PowerKey.new(KEY.D_LEFT_KEY_INDEX, "<", false, powers.get(6)),
	PowerKey.new(KEY.BUTTON_1_KEY_INDEX, "z", false, powers.get(6)),
	PowerKey.new(KEY.BUTTON_2_KEY_INDEX, "x", false, powers.get(6))
]
