// Inherit the parent event

randomize();

var cam = instance_create_layer(x, y, layer, obj_cam);
cam.target = id;

event_inherited();

max_vida = 10;
vida_atual = max_vida;

max_velh = 4;
max_velv = 6;
dash_vel = 5;
showState = false;

combo = 0;
damage = noone;
attackReady = true;

coins = 0;