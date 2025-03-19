@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("SpectrumSupport", "MeshInstance2D", preload("Filter.gd"), preload("Icon.png"))
	update_overlays()


func _exit_tree() -> void:
	remove_custom_type("SpectrumSupport")
