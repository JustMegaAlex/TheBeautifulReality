
if oWorkController.processed >= (4 * max(1, global.pills_taken)) {
    oRobinReplicas.startDialog(oRobinReplicas.dialog_too_tired)
} else if !instance_exists(oBody) {
	instance_create_layer(0, 0, "Bodies", oBody)
}
