extends KinematicBody2D


var start_position = [
	Vector2(3328 ,-640)
	,Vector2(3392,512)
]
var player = null
onready var ray = $RayCast2D
export var speed = 250
export var looking_speed = 100
export var damage = 10

func _ready():
	position = start_position[Global.save_data["level"]-1]


func _physics_process(_delta):
	if player == null:
		player = get_node_or_null("/root/Game/Player_Container/Player")
	else:
		ray.cast_to = ray.to_local(player.global_position)
		var _c = ray.get_collider()
		if _c:
			var velocity = ray.cast_to.normalized()*looking_speed
			if _c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			move_and_slide(velocity, Vector2(0,0))


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.do_damage(damage)
		queue_free()
