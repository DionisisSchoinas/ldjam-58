extends Node

enum KEY {
	D_RIGHT_KEY_INDEX = 0,
	D_LEFT_KEY_INDEX = 1,
	BUTTON_1_KEY_INDEX = 2,
	BUTTON_2_KEY_INDEX = 3,
}

enum POWER {
	POWER_1 = 0,
	POWER_2 = 1,
	POWER_3 = 2,
	POWER_4 = 3,
	POWER_5 = 4,
	POWER_6 = 5,
	NO_POWER = 6,
}

class Power:
	var _id : int
	var _name : String
	
	func _init(id=0, name="p"):
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
	Power.new(POWER.POWER_1),
	Power.new(POWER.POWER_2),
	Power.new(POWER.POWER_3),
	Power.new(POWER.POWER_4),
	Power.new(POWER.POWER_5),
	Power.new(POWER.POWER_6),
]

var keys: Array[PowerKey] = [
	PowerKey.new(KEY.D_RIGHT_KEY_INDEX, ">", true, powers.get(0)),
	PowerKey.new(KEY.D_LEFT_KEY_INDEX, "<", false, powers.get(6)),
	PowerKey.new(KEY.BUTTON_1_KEY_INDEX, "z", false, powers.get(6)),
	PowerKey.new(KEY.BUTTON_2_KEY_INDEX, "x", false, powers.get(6))
]
