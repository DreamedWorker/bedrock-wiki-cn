```json
{
	"format_version": "1.12.0",
	"animations": {
		"animation.car.wheel_spin": {
			"loop": true,
			"animation_length": 1.0,
			"bones": {
				"front_wheels": {
					"rotation": ["query.modified_distance_moved * -30", 0, 0]
				},
				"back_wheels": {
					"rotation": ["query.modified_distance_moved * -30", 0, 0]
				}
			}
		}
	}
}
```