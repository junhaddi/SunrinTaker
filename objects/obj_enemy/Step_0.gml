event_inherited();

var spike = collision_point(x, y, obj_spike, false, true);
if (spike != noone) {
	if (x == spike.x && y == spike.y) {
		instance_destroy();
	}
}

var spikeTrigger = collision_point(x, y, obj_spike_trigger, false, true);
if (spikeTrigger != noone) {
	if (spikeTrigger.isSpike == 1) {
		if (x == spikeTrigger.x && y == spikeTrigger.y) {
			instance_destroy();
		}
	}
}