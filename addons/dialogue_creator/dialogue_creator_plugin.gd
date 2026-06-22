@tool
extends EditorPlugin

# -------------
# - constants -
# -------------
const MAIN_SCENE:Resource = preload("res://addons/dialogue_creator/dialogue_creator.tscn")



# -------------
# - variables -
# -------------
var main_scene_instance:Control



# --------------------
# - plugin functions -
# --------------------

func _enable_plugin() -> void:
	# Add autoloads here.
	pass

func _disable_plugin() -> void:
	# Remove autoloads here.
	pass

# Name of plugin.
func _get_plugin_name():
	return "Dialogue Creator"

# Icon of plugin at the top area.
func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")

# Called by editor on plugin enable.
# Tells the editor that this plugin adds a new center view.
func _has_main_screen():
	return true

# Runs when editor makes request to make this visible.
func _make_visible(visible:bool):
	if main_scene_instance:
		main_scene_instance.visible = visible

# ----------------------
# - "engine" functions -
# ----------------------

# Initialization
func _enter_tree() -> void:
	main_scene_instance = MAIN_SCENE.instantiate()
	EditorInterface.get_editor_main_screen().add_child(main_scene_instance)
	_make_visible(false)

# Clean-up
func _exit_tree() -> void:
	if main_scene_instance:
		main_scene_instance.queue_free()



# ----------------------
# - other functions -
# ----------------------
