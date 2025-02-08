extends Node


# Emit to show a text box
# Emitters: Anything that needs to show a text box
# Listeners: UI
signal show_text_box(text: String)

# Emit to show text from a Dialogue resource
# Emitters: NPCs with Dialogue resources
# Listeners: UI
signal show_dialogue(dialogue: Dialogue)

# Emit when UI elements become active / inactive
# Stops processing of Player input when relevant UI is active
# Emitters: UI, PlantUI
# Listeners: Player
signal ui_toggled(visible: bool)

# Emit when day ended by sleeping at house
# Triggers crop growth
# Emitters: House
# Listeners: Plot
signal day_ended

# Emit to bring up planting UI
# Emitters: Plot
# Listeners: PlantUI
signal start_planting(plot: Plot)
