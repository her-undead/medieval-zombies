class_name BookUI extends AnimatedSprite2D

@export var page_count : int = 5 # total page count

var current_page: int = 0 #tracks the current page
var is_open = false
var page_content = [
	"",
	"Observed Subject #04 rise three nights post-burial. No visible decomposition. No respiration. Skin temperature fell below the measurement range.
When spoken to, the subject mimicked speech—but not in their own voice. Local villagers said it 'spoke like a prayer.'
",
	"Cren,
I know you don’t believe in curses, but this isn’t like the pox or the fever. I buried my apprentice myself. She was gone. Days later, she was found wandering the fields, humming verses from a hymn I never taught her.
",
	"Several settlements near the Silver Ridge report ‘returning dead’ who do not rot. Villagers refuse cremation.
All sites mention worship. An ‘Old One,’ always tied to still water.
Rituals vary—burial in rivers, submerged altars, one case of throwing salt into the mouths of corpses. Results are always the same: the body returns, but the mind is... blank.
",
	"I arrived in Versie two nights past. The villagers speak in hushed tones, avoid my eyes. Many bear signs of prolonged exposure to decay—blackened fingernails, slow pulse, fever without sweat.
They won’t call it a plague. They call it a debt.
",
""
]
var page_content2 = [
	"Property of Veil",
	"The family believes it was ‘blessed’ by the deity of the water shrine. I find this term naive. There is no blessing in hollow eyes.
~ Dr. Leren
",
	"Her body moved, but she had no memory. Only instinct.
I’ve stopped taking patients from lakeside villages. I don’t think we’re curing anything. I think we’re feeding something.
~ Dr. Mira to Dr. Cren
",
	"Not undead. Not possessed. Not alive.
Something new. Or something ancient, forgotten.
~ Dr. Rakev
",
	"There is no rot in their homes, no rats, no filth. This sickness is not born from nature—it is born from worship. I must tread carefully. There is faith here… but it is fearful, fractured, and bound to something ancient.
I’ll begin by interviewing the elders. They hold the stories. They always do.
",
""
]

var pages = [true, true, true, true, true, true]
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
	$Control/PageContent2.text = page_content2[0]
	
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
	$Control/PageContent.text = page_content[current_page]
	$Control/PageContent2.text = page_content2[current_page]
	
	
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
