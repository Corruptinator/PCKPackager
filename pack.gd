extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pck_queue_list = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pck_queue_list.clear()
	pass

func test():
	print("Test!")

func pck_Packager(path,filepath):
	_pre_Pack()
	_pck_Queue(path,filepath)
	_pck_Pack()
	pass

func _pre_Pack():
	pck_queue_list.clear()
	pass

func _pck_Queue(path,filepath):
	var packaging = PCKPacker.new()
	packaging.pck_start(filepath, 0)
	for i in range(0,path.size()):
		packaging.add_file(path[i],0)
	packaging.flush(false)
	pass

func _pck_Pack():
	_post_Pack()
	pass

func _post_Pack():
	get_node("/root/Node/HBoxContainer/Open").disabled = false
	get_node("/root/Node/HBoxContainer/Select All").disabled = false
	get_node("/root/Node/HBoxContainer/Deselect").disabled = false
	get_node("/root/Node/HBoxContainer/Delete").disabled = false
	get_node("/root/Node/HBoxContainer/Initialize").disabled = false
	get_node("/root/Node/HBoxContainer/Initialize2").disabled = false
	get_node("/root/Node/HBoxContainer/Progress Bar").disabled = true
	get_node("/root/Node/WindowDialog").show()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
