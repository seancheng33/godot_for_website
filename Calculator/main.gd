extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in $Control.get_children():
		item.connect("pressed",self,"_button_press",[item.text])
	pass # Replace with function body.

func _button_press(txt):
	if txt == "C":
		$Label.text = ""
	elif txt == "=":
		var command =$Label.text
		var result = calc(command)
		if typeof(result) == TYPE_BOOL:
			$Label.text = "Error"
		else:
			$Label.text = str(result)
	else:
		var oldTxt = $Label.text
		var newTxt = oldTxt+txt
		$Label.text = newTxt
#	print(txt)

func calc(input):
	var script = GDScript.new()
	script.set_source_code("tool\nfunc eval():\n\treturn(" + input + ")")
	var err = script.reload()
	print(err)
	if err != OK:
		return false
	var obj = Reference.new()
	obj.set_script(script)
	var result = obj.eval()
	return result

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
