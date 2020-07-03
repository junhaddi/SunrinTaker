// 주인공 사망
if (global.leftTurn <= 0) {
	room_restart();
	show_debug_message("LOOP");
}

// 게임 재시작
if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}

//==================== 개발자 모드 ====================//
if (keyboard_check_pressed(ord("1"))) {
	room_goto(rm_stage1);
}
if (keyboard_check_pressed(ord("2"))) {
	room_goto(rm_stage2);
}

if (keyboard_check_pressed(ord("3"))) {
	room_goto(rm_stage3);
}

if (keyboard_check_pressed(ord("4"))) {
	room_goto(rm_stage4);
}
if (keyboard_check_pressed(ord("5"))) {
	room_goto(rm_stage5);
}

if (keyboard_check_pressed(ord("6"))) {
	room_goto(rm_stage6);
}

if (keyboard_check_pressed(ord("7"))) {
	room_goto(rm_stage7);
}

if (keyboard_check_pressed(ord("8"))) {
	room_goto(rm_stage8);
}



