@tool
extends Node2D

var AudioAssetDict : Dictionary = {}
@export var AudioAssets : Array[AudioAsset]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for soundAsset : AudioAsset in AudioAssets:
		AudioAssetDict[soundAsset.AudioType] = soundAsset

func play_Audio_at_location(location : Vector2, type : AudioAsset.SOUND_TYPE) -> void:
	if AudioAssetDict.has(type):
		var audio_Asset : AudioAsset = AudioAssetDict[type]
		if audio_Asset.has_open_limit():
			audio_Asset.change_audio_count(1)
			var new2D_Audio_Player : AudioStreamPlayer2D = AudioStreamPlayer2D.new()
			new2D_Audio_Player.bus = audio_Asset.BusTypeName
			add_child(new2D_Audio_Player)
			new2D_Audio_Player.position = location
			new2D_Audio_Player.stream = audio_Asset.AudioFile
			new2D_Audio_Player.volume_db = audio_Asset.volume
			new2D_Audio_Player.pitch_scale = audio_Asset.pitch_scale
			new2D_Audio_Player.pitch_scale += randf_range(-audio_Asset.pitch_randomness, audio_Asset.pitch_randomness)
			new2D_Audio_Player.finished.connect(audio_Asset.on_audio_finished)
			new2D_Audio_Player.finished.connect(new2D_Audio_Player.queue_free)
			new2D_Audio_Player.play()
		else:
			push_error("Audio System has failed to find se")

func play_Audio(type : AudioAsset.SOUND_TYPE) -> void:
	if AudioAssetDict.has(type):
		var audio_Asset : AudioAsset = AudioAssetDict[type]
		if audio_Asset.has_open_limit():
			audio_Asset.change_audio_count(1)
			var new2D_Audio_Player : AudioStreamPlayer = AudioStreamPlayer.new()
			
			var BusTypeInt : int = audio_Asset.BusType
			var BusTypeName : String = AudioAsset.BUS_TYPE.keys()[BusTypeInt]
			print(BusTypeName)
			
			new2D_Audio_Player.bus = BusTypeName
			print(new2D_Audio_Player.bus)
			add_child(new2D_Audio_Player)
			new2D_Audio_Player.stream = audio_Asset.AudioFile
			new2D_Audio_Player.volume_db = audio_Asset.volume
			new2D_Audio_Player.pitch_scale = audio_Asset.pitch_scale
			new2D_Audio_Player.pitch_scale += randf_range(-audio_Asset.pitch_randomness, audio_Asset.pitch_randomness)
			new2D_Audio_Player.finished.connect(audio_Asset.on_audio_finished)
			new2D_Audio_Player.finished.connect(new2D_Audio_Player.queue_free)
			new2D_Audio_Player.play()
		else:
			push_error("Audio System has failed to find se")
