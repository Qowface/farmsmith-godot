extends Node


const CARROT: Crop = preload("res://resources/crops/carrot.tres")
const RADISH: Crop = preload("res://resources/crops/radish.tres")
const TOMATO: Crop = preload("res://resources/crops/tomato.tres")
const CORN: Crop = preload("res://resources/crops/corn.tres")

var gold: int = 50
var seeds = {
	CARROT: 0,
	RADISH: 0,
	TOMATO: 0,
	CORN: 0,
}
var crops = {
	CARROT: 0,
	RADISH: 0,
	TOMATO: 0,
	CORN: 0,
}
var axe_seed: bool = false
var axe: bool = false
