extends SpinBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _value_changed(new_value):
	print("value changed to ", new_value)
	var pitchshift := AudioServer.get_bus_effect(0, 0) as AudioEffectPitchShift
	pitchshift.pitch_scale = 1.0 - (new_value * 0.1)
	
	var chorus := AudioServer.get_bus_effect(0, 1) as AudioEffectChorus
	chorus.wet = new_value * 0.1
	
	var reverb := AudioServer.get_bus_effect(0,2) as AudioEffectReverb
	reverb.dry = 1.0 - (new_value * 0.1)
	reverb.wet = new_value * 0.1
