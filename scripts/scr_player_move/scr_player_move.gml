var grid = argument0;

var left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
var right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

var hspd = (right - left) * grid;
var vspd = (down - up) * grid;

// 주인공 이동
if (hspd != 0 || vspd != 0) {
	// 트리거 스파이크 작동
	if (!instance_place(x + hspd, y + vspd, obj_wall)) {
		with (obj_spike_trigger) {
			isSpike *= -1;
		}
	}
}
		
if (hspd != 0) {
	// 횡 이동
	if (!instance_place(x + hspd, y, obj_par_inst) || (isKey && instance_place(x + hspd, y, obj_lock_door))) {
		x += hspd;
		// 일반 스파이크 충돌
		if (instance_place(x, y, obj_spike)) {
			global.leftTurn--;
		}
		// 트리거 스파이크 충돌
		var spikeTrigger = collision_point(x, y, obj_spike_trigger, false, true);
		if (spikeTrigger != noone) {
			if (spikeTrigger.isSpike == 1) {
				global.leftTurn--;
			}
		}
		global.leftTurn--;
	} else {	
		// 나쁜놈 밀기
		var enemy = collision_point(x + hspd, y, obj_enemy, false, true);
		if (enemy != noone) {
			global.leftTurn--;
			if (!instance_place(enemy.x + hspd, enemy.y, obj_par_inst)) {
				enemy.x += hspd;
			} else if (instance_place(enemy.x + hspd, enemy.y, obj_wall) || (instance_place(enemy.x + hspd, enemy.y, obj_rock))) {
				with(enemy) {
					instance_destroy();
				}
			}
		}
		// 돌 밀기
		var rock = collision_point(x + hspd, y, obj_rock, false, true);
		if (rock != noone) {
			global.leftTurn--;
			if (!instance_place(rock.x + hspd, rock.y, obj_par_inst)) {
				rock.x += hspd;
			}
		}
	}
} else if (vspd != 0) {
	// 종 이동
	if (!instance_place(x, y + vspd, obj_par_inst) || (isKey && instance_place(x, y + vspd, obj_lock_door))) {
		y += vspd;
		// 일반 스파이크 충돌
		if (instance_place(x, y, obj_spike)) {
			global.leftTurn--;
		}
		// 트리거 스파이크 충돌
		var spikeTrigger = collision_point(x, y, obj_spike_trigger, false, true);
		if (spikeTrigger != noone) {
			if (spikeTrigger.isSpike == 1) {
				global.leftTurn--;
			}
		}
		global.leftTurn--;

	} else {	
		// 나쁜놈 밀기
		var enemy = collision_point(x, y + vspd, obj_enemy, false, true);
		if (enemy != noone) {
			global.leftTurn--;
			if (!instance_place(enemy.x, enemy.y + vspd, obj_par_inst)) {
				enemy.y += vspd;
			} else if (instance_place(enemy.x, enemy.y + vspd, obj_wall) || (instance_place(enemy.x, enemy.y + vspd, obj_rock))) {
				with(enemy) {
					instance_destroy();
				}
			}
		}
		// 돌 밀기
		var rock = collision_point(x, y + vspd, obj_rock, false, true);
		if (rock != noone) {
			global.leftTurn--;
			if (!instance_place(rock.x, rock.y + vspd, obj_par_inst)) {
				rock.y += vspd;
			}
		}
	}
}