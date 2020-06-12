var grid = argument0;

// 주인공 이동
var left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
var right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

var hspd = (right - left) * grid;
var vspd = (down - up) * grid;

if (hspd != 0) {
	if (!instance_place(x + hspd, y, obj_wall)) {
		x += hspd;
	}
} else {
	if (!instance_place(x, y + vspd, obj_wall)) {
		y += vspd;
	}
}

// TODO 걷는 애니메이션 출력
if (hspd != 0 && vspd != 0) {
	global.life--;
}

// 나쁜놈 말기
var enemy = collision_point(x, y, obj_enemy, false, true);
if (enemy != noone) {
	if (instance_place(enemy.x + hspd, enemy.y + vspd, obj_wall)) {
		with(enemy) {
			instance_destroy();
		}
	} else {
		enemy.x += hspd;
		enemy.y += vspd;
	}
}

// 나쁜놈 말기
var rock = collision_point(x, y, obj_rock, false, true);
if (rock != noone) {
	show_debug_message(rock);
	var solidList = [obj_enemy, obj_rock];
	for (var i = 0; i < array_length_1d(solidList); i++) {
		if (!instance_place(rock.x + hspd, rock.y + vspd, solidList[i])) {
			rock.x += hspd;
			rock.y += vspd;
			break;
		}
	}
}