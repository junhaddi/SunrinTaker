event_inherited();

scr_player_move(64);

// 골인
if (x == obj_goal.x && y == obj_goal.y) {
	room_goto_next();
}