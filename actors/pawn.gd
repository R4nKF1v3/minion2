extends KinematicBody2D

enum CellType { ACTOR, OBSTACLE }
export(CellType) var type = CellType.ACTOR
