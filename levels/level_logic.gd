extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player entered area!")
		get_parent().switch_current_level(self)

func _on_body_exited(body):
	if body.is_in_group("Player"):
		print("Player left area!")
