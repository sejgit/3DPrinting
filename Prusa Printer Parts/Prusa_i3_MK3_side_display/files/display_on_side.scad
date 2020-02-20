vyska=10;
$fn=20;
difference(){
    union(){
        translate([-4-11,-5,0])cube([36,5,vyska]);//stycna plocha
        cube([7,7,vyska]);//zasouvac9 klin
        translate([11+8-1,11,0])cube([2,2,vyska]);//pojistka
        translate([11+8,0,0])cube([2,15,vyska]);//plocha pojistky
    }
    //srouby a zapusteni
    translate([3.5,10,vyska/2])rotate([90,0,0])cylinder(d=3.5,h=50);
    translate([3.5,15-3.5,vyska/2])rotate([90,0,0])cylinder(d=6,h=15);

    translate([3.5-10,10,vyska/2])rotate([90,0,0])cylinder(d=3.5,h=50);
    translate([3.5-10,15-3.5,vyska/2])rotate([90,0,0])cylinder(d=6,h=15);
}

