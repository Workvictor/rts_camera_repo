var camera = view_camera[0];
var width = camera_get_view_width(camera);
var height = camera_get_view_height(camera);

var zoom = (mouse_wheel_down() - mouse_wheel_up())*zoomValue;
if(zoom!=0){
	var zoomMax = 3;
	var dx = width * zoom;
	var dy = height * zoom;
	var nextW = width + dx;
	var nextH = height + dy;
	//width = clamp(width+dx, VIEW_W/3, room_width);
	//height = clamp(height+dy, VIEW_H/3, room_width/16*9);
	if(
		room_width>=nextW and 
		room_height >= nextH and 
		VIEW_W/nextW < zoomMax and 
		VIEW_H/nextH < zoomMax
	) {
		width += dx;
		height += dy;
	}
}
var whl = floor(width/2);
var hhl = floor(height/2);

var boundsX = [whl, room_width - whl];
var boundsY = [hhl, room_height - hhl];

var input = [
	(keyboard_check(INPUT.right) - keyboard_check(INPUT.left)) * cameraScrollSpeed,
	(keyboard_check(INPUT.down) - keyboard_check(INPUT.up)) * cameraScrollSpeed
];

pos[0] = clamp(pos[0] + input[0], boundsX[0], boundsX[1]);
pos[1] = clamp(pos[1] + input[1], boundsY[0], boundsY[1]);

x=lerp(x, pos[0], cameraSmothValue);
y=lerp(y, pos[1], cameraSmothValue);

camera_set_view_size(camera, width, height);
camera_set_view_pos(camera, x-boundsX[0], y-boundsY[0]);

