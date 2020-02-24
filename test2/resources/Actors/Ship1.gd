extends RigidBody2D

export var speed:=1

func _integrate_forces(state):
	var direction:=Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up"))
	
	var force=speed*direction
	
	var rotation:=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	apply_torque_impulse(rotation)
	
	add_central_force(force)
