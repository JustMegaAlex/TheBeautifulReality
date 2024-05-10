function PrintBodyState() {
    var returnstring = "NO BODY"

    if instance_exists(oBody) {
        returnstring = "Body State: " + string(oBody.body_state)
    }

    return returnstring
}
