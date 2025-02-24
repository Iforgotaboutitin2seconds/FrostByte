event_inherited();

if (instance_exists(obj_controls)) {
	instance_destroy(obj_controls);
} else {
<<<<<<< HEAD
	instance_create_layer(room_width / 2, room_height - 50, "Instances", obj_controls);
}


=======
	instance_create_layer(room_width / 2, room_height - 100, "Instances", obj_controls);
}
>>>>>>> c3b685126b658bd177d15040e14e5617bc5521fe
