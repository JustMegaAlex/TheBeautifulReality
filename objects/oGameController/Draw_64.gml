
draw_set_color(c_white)
DebugDrawVar("events", oGameState.happened_events)
DebugDrawVar("items", instance_number(oInventoryItem))
if instance_exists(oBody) {
    DebugDrawVar("props", oBody.props_current)
}
