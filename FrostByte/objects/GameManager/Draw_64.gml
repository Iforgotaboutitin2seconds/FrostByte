// --- Draw White Team Counters (top left) ---
draw_set_color(c_white);
var whiteText = "White: " + string(global.whiteCounters);
draw_text(10, 10, whiteText);

// --- Draw Black Team Counters (top right) ---
draw_set_color(c_black);
var blackText = "Black: " + string(global.blackCounters);
var blackTextWidth = string_width(blackText);
draw_text(room_width + 100, 10, blackText);
