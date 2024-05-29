if !instance_exists(oBody){
	instance_destroy(oConveyerBelt)
	instance_create_layer(0, 0, "Conveyor", oConveyerBelt)
}

