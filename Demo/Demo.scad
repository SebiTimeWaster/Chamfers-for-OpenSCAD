/**
  * This code is published under a
  * Creative Commons Attribution-NonCommercial-ShareAlike 3.0
  * licence, please respect it.
  *
  * Chamfered primitives for OpenSCAD v1.0
  */

// this changed from "use" to "include" with v0.3!!!
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


// cube demos
translate([-27.5, -5, 12]) chamferCube([10, 10, 10]);
translate([-12.5, -5, 12]) chamferCube([10, 10, 10], ch=2);
translate([2.5, -5, 12])   chamferCube([10, 10, 10], chamfers=[[1, 0, 0, 0]]);
translate([17.5, -5, 12])  chamferCube([10, 10, 10], [[0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]], 3);

/**
  * With this variable you can GLOBALLY override the standard circle quality of 1.0,
  * but the quality setting in chamferCylinder still has precedence over this variable.
  * This variable will only work when set outside of all blocks.
  */
//globalCircleQuality = 0.1;

// cylinder demos
translate([-30, 0, -5])    chamferCylinder(10, 5);
translate([-15, 0, -5])    chamferCylinder(10, 5, 5, 2, 4);
translate([0, 0, -5])      chamferCylinder(10, 5, 5, 3, -1);
translate([15, 0, -5])     chamferCylinder(10, 5, 5, 1, undef, 90);
translate([30, 0, -5])     chamferCylinder(10, 5, 5, -1, a=240);

// cone demos
translate([-30, 0, -20])   chamferCylinder(h=10, r=5, r2=2, ch=1, ch2=0);
translate([-15, 0, -20])   chamferCylinder(10, 5, 2, 3, 1);
translate([0, 0, -20])     chamferCylinder(10, 5, 2, -1);
translate([15, 0, -20])    chamferCylinder(10, 5, 2, 1, a=90);
translate([30, 0, -20])    chamferCylinder(10, 5, 2, -1, a=240);

// circleSegments demo
translate([-15, 0, -35])   cylinder(h=10, r=5, $fn=circleSegments(5, 0.5));
translate([0, 0, -35])     cylinder(h=10, r=5, $fn=circleSegments(5));
translate([15, 0, -35])    cylinder(h=10, r=5, $fn=circleSegments(5, 1.5));
// number of segments depends on circle radius
translate([-15, 0, -50])   cylinder(h=10, r=1, $fn=circleSegments(1));
translate([0, 0, -50])     cylinder(h=10, r=3, $fn=circleSegments(3));
translate([15, 0, -50])    cylinder(h=10, r=5, $fn=circleSegments(5));

/**
  * chamferCube returns an cube with 45° chamfers on the edges of the
  * cube. The chamfers are diectly printable on Fused deposition
  * modelling (FDM) printers without support structures.
  *
  * @param  size      The size of the cube along the [x, y, z] axis, 
  *                     example: [1, 2, 3]
  * @param  chamfers  Which chamfers to render along the [x, y, z] axis, 
  *                     example: [[0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]]
  *                     X axis: 4 values in clockwise order starting from 
  *                     the zero point, as seen from "Left view" (Ctrl + 6)
  *                     Y axis: 4 values in clockwise order starting from
  *                     the zero point, as seen from "Front view" (Ctrl + 8)
  *                     Z axis: 4 values in clockwise order starting from
  *                     the zero point, as seen from "Bottom view" (Ctrl + 5)
  * @param  ch        The "height" of the chamfers as seen from
  *                     one of the dimensional planes (The real
  *                     length is side c in a right angled triangle)
  *
  * ---------------------------------------------------------------------
  *
  * chamferCylinder returns an cylinder or cone with 45° chamfers on
  * the edges of the cylinder. The chamfers are diectly printable on
  * Fused deposition modelling (FDM) printers without support structures.
  *
  * @param  h    Height of the cylinder
  * @param  r    Radius of the cylinder (At the bottom)
  * @param  r2   Radius of the cylinder (At the top)
  * @param  ch   The "height" of the chamfer at radius 1 as
  *                seen from one of the dimensional planes (The 
  *                real length is side c in a right angled triangle)
  * @param  ch2  The "height" of the chamfer at radius 2 as
  *                seen from one of the dimensional planes (The 
  *                real length is side c in a right angled triangle)
  * @param  a    The angle of the visible part of a wedge
  *                starting from the x axis counter-clockwise
  * @param  q    A circle quality factor where 1.0 is a fairly
  *                good quality, range from 0.0 to 2.0-
  *
  * ---------------------------------------------------------------------
  *
  * circleSegments calculates the number of segments needed to maintain
  * a constant circle quality.
  * If a globalSegementsQuality variable exist it will overwrite the
  * standard quality setting (1.0). Order of usage is:
  * Standard (1.0) <- globalCircleQuality <- Quality parameter
  *
  * @param  r  Radius of the circle
  * @param  q  A quality factor, where 1.0 is a fairly good
  *              quality, range from 0.0 to 2.0
  *
  * @return  The number of segments for the circle
  *
  */
 