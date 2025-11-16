extends Node


@onready var damage = 1
@onready var score = 0
@onready var player_position = Vector2(0,0)
@onready var limit1 = 0
@onready var limit2 = 0

signal bullet_fired(bullet, position, direction)
