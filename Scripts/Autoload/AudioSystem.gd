@tool
extends Node2D
class_name AudioSystem
enum sound_type {
	UI_Button_Click,
	Scene_Transition
}
enum Bus_Type {
	UI,
	Game_Sounds,
	Background_Music,
	Soundtrack
}
var AudioAssetDict : Dictionary = {}
@export var soundAssets : Array[AudioAsset]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for soundAsset : AudioAsset in soundAssets:
		
		AudioAssetDict[soundAsset.SoundType] = soundAsset
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func play_Audio(type : AudioAsset.SOUND_TYPE) -> void:
	if AudioAssetDict.has(type):
		pass
