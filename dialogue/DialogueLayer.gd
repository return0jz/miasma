extends CanvasLayer

signal terminate

export(String, FILE) var dialogue_path = ""
export var speed = 0.05 # Time takes, wtf speed
var phrase_num = 0
var finished = false
var dialog

func get_json(path):
	var file = File.new();
	assert(file.file_exists(path), "NO DIALOG FILE")
	file.open(dialogue_path, File.READ)
	var result = parse_json(file.get_as_text())
	assert(typeof(result) == TYPE_ARRAY, "INVALID JSON")
	return result

func _ready():
	get_tree().paused = true
	$DialogueBox/Timer.wait_time = speed
	dialog = get_json(dialogue_path);
	assert(dialog, "NO DIALOGUE FOUND")
	next_phrase()

func _exit_tree():
	get_tree().paused = false

func next_phrase():
	if (phrase_num >= len(dialog)):
		emit_signal("terminate")
		queue_free()
		return
	finished = false
	$DialogueBox/Name.bbcode_text = dialog[phrase_num]["Name"]
	$DialogueBox/Text.bbcode_text = dialog[phrase_num]["Text"];
	$DialogueBox/Text.visible_characters = 0
	while $DialogueBox/Text.visible_characters < len($DialogueBox/Text.text):
		$DialogueBox/Text.visible_characters += 1
		$DialogueBox/Timer.start()
		yield($DialogueBox/Timer, "timeout")
	finished = true
	phrase_num += 1
	
func _process(delta):
	$DialogueBox/Arrow.visible = finished
	if Input.is_action_pressed("jump"):
		$DialogueBox/Timer.wait_time = speed/5
	else:
		$DialogueBox/Timer.wait_time = speed
		
	if Input.is_action_just_pressed("jump"):
		if finished:
			next_phrase()
#		else:
#			$DialogueBox/Text.visible_characters = len($DialogueBox/Text.text)
