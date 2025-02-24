// --- Draw White Team Counters (top left) ---
draw_set_color(c_white);
var whiteText = "White Counters: " + string(global.whiteCounters);
draw_text(10, 10, whiteText);

// --- Draw Black Team Counters (top right) ---
draw_set_color(c_black);
var blackText = "Black Counters: " + string(global.blackCounters);
var blackTextWidth = string_width(blackText);
draw_text(room_width - blackTextWidth - 10, 10, blackText);
