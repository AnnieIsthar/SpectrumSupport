@tool
extends MeshInstance2D

@onready var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
@onready var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")

var shader_material: ShaderMaterial

func _ready():
	actualizar_plane_mesh()
	position = Vector2(viewport_width / 2, viewport_height / 2)
	queue_redraw()

func actualizar_plane_mesh():
	var plane_mesh = PlaneMesh.new()
	plane_mesh.orientation = 2
	plane_mesh.size = Vector2(viewport_width, viewport_height)
	mesh = plane_mesh

	var mat = load("res://Addons/Spectrum_support/Mat.tres")
	
	if mat == null:
		pass
	else:
		shader_material = mat
	
	material = shader_material

func set_filter(mode: int):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("filter_type", mode)
			queue_redraw()
		else:
			pass
	else:
		pass

func set_severity(value: float):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("severity", value)
			queue_redraw()
		else:
			pass
	else:
		pass

func set_brightness(value: float):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("brightness", value)
			queue_redraw()
		else:
			pass
	else:
		pass

func set_contrast(value: float):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("contrast", value)
			queue_redraw()
		else:
			pass
	else:
		pass

func set_gamma(value: float):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("gamma", value)
			queue_redraw()
		else:
			pass
	else:
		pass

func set_hue_shift(value: float):
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("hue_shift", value)
			queue_redraw()
		else:
			pass
	else:
		pass

func reset_parameters():
	if material and material is ShaderMaterial:
		@warning_ignore("shadowed_variable")
		var shader_material = material as ShaderMaterial
		if shader_material.shader:
			shader_material.set_shader_parameter("filter_type", 0)
			shader_material.set_shader_parameter("severity", 1.0)
			shader_material.set_shader_parameter("brightness", 0.0)
			shader_material.set_shader_parameter("gamma", 1.0)
			shader_material.set_shader_parameter("hue_shift", 0.0)
			queue_redraw()
		else:
			pass
	else:
		pass
