function PrintBodyState() {
    var returnstring = "NO BODY"

    if instance_exists(oBody) {
        returnstring = "Body State: " + string(oBody.body_state)
    }

    return returnstring
}

//// Shortcuts to set and get instance variables
function Get(inst, variable) {
    return variable_instance_get(inst, variable)
}

function Set(inst, variable, value) {
    return variable_instance_set(inst, variable, value)
}
////
