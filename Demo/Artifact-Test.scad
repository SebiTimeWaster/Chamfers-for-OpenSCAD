/**
  * This code is published under a
  * Creative Commons Attribution-NonCommercial-ShareAlike 3.0
  * licence, please respect it.
  *
  * Chamfered primitives for OpenSCAD v1.2 - By TimeWaster
  */

include <Chamfers-for-OpenSCAD/Chamfer.scad>;

/**
  * This code is only for testing purposes, please ignore.
  */

difference() {
    cube([137, 8, 10]);
    translate([8, 0, 0]) cylinders();
}

translate([8, 0, 20]) cylinders();

translate([0, 0, 38 ]) {
    difference() {
        cube([137, 8, 10]);
        translate([8, 0, 0]) cylinders(3);
    }

    translate([8, 0, 20]) cylinders(3);
}

module cylinders(r2=5) {
    translate([0, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=2);
    translate([15, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=2, ch2=-2);
    translate([30, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=-2, ch2=2);
    translate([45, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=-2);

    translate([60, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=2, ch2=-0);
    translate([75, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=-2, ch2=0);
    translate([90, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=0, ch2=2);
    translate([105, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=0, ch2=-2);

    translate([120, 0, -1]) chamferCylinder(r=5, r2=r2, h=12, ch=0);
}
