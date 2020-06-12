// 주인공 사망
if (!global.life > 0) {
	room_restart();
}

// 게임 재시작
if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}