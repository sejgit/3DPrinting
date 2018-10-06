// JellyB Tech 12th November 2013
// Play with at your own peril...

base_length =61;
base_width  =100;
m3_bolt_diameter =1.6;
m3_nut_size = 6;
m3_nut_height = 2.5;
initial_hole_offset = 3.75;
x_hole_offset = 54;
y_hole_offset = 92;
extrusion_height = 15;
$fn=12;

difference(){
	union(){
		base();
		rear_mount();
		}
	board_holes();
	extrusion_holes();
	cut_centre();
}

// Centre cutout

module cut_centre(){
	hull(){
		translate(v=[initial_hole_offset + 7,initial_hole_offset + 7,0])
		cylinder(r=3,h=4);
		translate(v=[x_hole_offset - initial_hole_offset,initial_hole_offset + 7,0])
		cylinder(r=3,h=4);
		translate(v=[x_hole_offset - initial_hole_offset,y_hole_offset - initial_hole_offset,0])
		cylinder(r=3,h=4);
		translate(v=[initial_hole_offset + 7,y_hole_offset - initial_hole_offset,0])
		cylinder(r=3,h=4);
		}
}
	
// Extrusion mount holes

module extrusion_holes(){
	translate(v=[base_length * 0.1,base_width + 13,extrusion_height/2])
	rotate(a=[90,0,0])
	cylinder(r=m3_bolt_diameter +0.1 ,h=7);
	translate(v=[base_length * 0.9,base_width + 13,extrusion_height/2])
	rotate(a=[90,0,0])
	cylinder(r=m3_bolt_diameter +0.1 ,h=7);
}

// Printrboard mount holes

module board_holes(){
	translate(v=[initial_hole_offset,initial_hole_offset,m3_nut_height + 0.2])
	cylinder(r=m3_bolt_diameter,h=6);
	translate(v=[initial_hole_offset,initial_hole_offset,0])
	cylinder(r=m3_nut_size / 2 / cos(180 / 6),h=m3_nut_height, $fn=6);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset,m3_nut_height + 0.2])
	cylinder(r=m3_bolt_diameter,h=6);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset,0])
	cylinder(r=m3_nut_size / 2 / cos(180 / 6),h=m3_nut_height, $fn=6);
	translate(v=[initial_hole_offset,initial_hole_offset + y_hole_offset,m3_nut_height + 0.2])
	cylinder(r=m3_bolt_diameter,h=6);
	translate(v=[initial_hole_offset,initial_hole_offset + y_hole_offset,0])
	cylinder(r=m3_nut_size / 2 / cos(180 / 6),h=m3_nut_height, $fn=6);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset + y_hole_offset,m3_nut_height + 0.2])
	cylinder(r=m3_bolt_diameter,h=6);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset + y_hole_offset,0])
	cylinder(r=m3_nut_size / 2 / cos(180 / 6),h=m3_nut_height, $fn=6);
}

// Base
module base(){
	hull(){
		cylinder(r=5,h=2);
		translate(v=[base_length,0,0])
		cylinder(r=5,h=2);
		translate(v=[-5,base_width-1,0])
		cube(size=[base_length + 10,6,2]);
		}
	translate(v=[initial_hole_offset,initial_hole_offset,0])
	cylinder(r=4.5,h=5);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset,0])
	cylinder(r=4.5,h=5);
	translate(v=[initial_hole_offset,initial_hole_offset + y_hole_offset,0])
	cylinder(r=4.5,h=5);
	translate(v=[initial_hole_offset + x_hole_offset,initial_hole_offset + y_hole_offset,0])
	cylinder(r=4.5,h=5);
}

// Rear Mount
module rear_mount(){
	difference(){
		hull(){
			translate(v=[-5,base_width + 5,0])
			cube(size=[base_length + 10,7,extrusion_height - 5]);
			translate(v=[0,base_width + 12,extrusion_height - 5])
			rotate(a=[90,0,0])
			cylinder(r=5,h=5);
			translate(v=[base_length,base_width + 12,extrusion_height - 5])
			rotate(a=[90,0,0])
			cylinder(r=5,h=5);
			}
		translate(v=[-6,base_width + 5,4])
		rotate(a=[0,90,0])
		cylinder(r=2,h=base_length + 15);
		translate(v=[-6,base_width + 2,4])
		cube(size=[base_length + 15,5,extrusion_height]);
		}
}
