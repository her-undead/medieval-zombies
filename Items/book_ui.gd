class_name BookUI extends AnimatedSprite2D

@export var page_count : int = 3 # total page count

var current_page: int = 0 #tracks the current page
var is_open = false
var page_content = [
	"here is some text",
	"here is some more text",
	"here is some other text",
	"here is some final text"
]

var pages = [true, true, false, true]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close();

func load_pages():
	var file = FileAccess.open("res://Items/pages.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())

func _process(delta):
	if Input.is_action_just_pressed("book"):
		if is_open:
			close()
		else:
			open()

func add_page():
	for p in pages:
		if !p:
			p = true;
			break;

func open():
	visible = true
	is_open = true
	current_page = 0;
	go_to_page(current_page)
	$Control/PageContent.text = page_content[0]
	
#func clamp_current_page(new_page : int) -> int:
	#if new_page < 0:
		#new_page = page_count
		#while !pages[new_page]:
			#new_page = new_page - 1
	#elif new_page > page_count:
		#new_page = 0
	#return new_page
	
func go_to_page(page:int):
	if current_page == page:
		return
	if page < 0 or page > page_count:
		return
	if page > current_page:
		play("next")
	elif page < current_page:
		play("prev")
	current_page = page
	print(current_page)
	print(page_content[current_page])
	$Control/PageContent.text = page_content[current_page]
	
	
func close():
	visible = false
	is_open = false

func _on_next_page_button_button_down() -> void:
	var new_page = current_page+1;
	if new_page > page_count:
		new_page = 0;
	while !pages[new_page]:
		if new_page > page_count:
			new_page = 0;
		else:
			new_page+=1
	go_to_page(new_page)


func _on_previous_page_button_button_down() -> void:
	var new_page = current_page-1;
	if new_page < 0:
		new_page = page_count;
	while !pages[new_page]:
		if new_page < 0:
			new_page = page_count;
		else:
			new_page-=1
	go_to_page(new_page)
