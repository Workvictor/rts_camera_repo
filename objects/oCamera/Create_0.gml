#macro VIEW_SCALE 1
#macro VIEW_W 960
#macro VIEW_H 540

enum INPUT {
	up = ord("W"),
	down = ord("S"),
	left = ord("A"),
	right = ord("D"),
}

pos = [x,y];

zoomValue = 0.1;
cameraScrollSpeed = 10;
cameraSmothValue = 0.05;

var width = floor(VIEW_W/VIEW_SCALE);
var height = floor(VIEW_H/VIEW_SCALE);

camera_set_view_size(view_camera[0], width, height);
camera_set_view_pos(view_camera[0], x, y);
//camera_set_view_target(view_camera[0], self);
//camera_set_view_speed(view_camera[0], cameraScrollSpeed, cameraScrollSpeed)
display_set_gui_size(width, height);
window_set_size(VIEW_W, VIEW_H);
surface_resize(application_surface, VIEW_W, VIEW_H);
alarm[0]=1;
