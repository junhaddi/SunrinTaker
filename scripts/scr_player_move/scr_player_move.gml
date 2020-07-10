var grid = argument0;

// 키 입력
var left = 0;
var right = 0;
var up = 0;
var down = 0;

if (isMove) {
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
		left = 1;
	} else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
		right = 1;
	} else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
		up = 1;
	} else if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
		down = 1;
	}
}

// 주인공 이동
var hspd = (right - left) * grid;
var vspd = (down - up) * grid;

if (hspd != 0 || vspd != 0) {
	if (isMove) {
		isMove = false;
		alarm[0] = room_speed * 0.1;
	}
	// 트리거 스파이크 작동
	if (!instance_place(x + hspd, y + vspd, obj_wall) && !instance_place(x + hspd, y + vspd, obj_lock_door)) {
		with (obj_spike_trigger) {
			isSpike *= -1;
		}
	}
	if (!instance_place(x + hspd, y + vspd, obj_par_inst) || (isKey && instance_place(x + hspd, y + vspd, obj_lock_door))) {
		x += hspd;
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
		var enemy = collision_point(x + hspd, y + vspd, obj_enemy, false, true);
		if (enemy != noone) {
			global.leftTurn--;
			if (!instance_place(enemy.x + hspd, enemy.y + vspd, obj_par_inst)) {
				enemy.x += hspd;
				enemy.y += vspd;
			} else if (instance_place(enemy.x + hspd, enemy.y + vspd, obj_wall) || (instance_place(enemy.x + hspd, enemy.y + vspd, obj_rock))) {
				with(enemy) {
					instance_destroy();
				}
			}
		}
		// 돌 밀기
		var rock = collision_point(x + hspd, y + vspd, obj_rock, false, true);
		if (rock != noone) {
			global.leftTurn--;
			if (!instance_place(rock.x + hspd, rock.y + vspd, obj_par_inst)) {
				rock.x += hspd;
				rock.y += vspd;
			}
		}
	}
}
	