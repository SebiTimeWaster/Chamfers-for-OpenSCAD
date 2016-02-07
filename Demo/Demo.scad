// this changed from "use" to "include" with v0.3!!!
include <Chamfers-for-OpenSCAD/Chamfer.scad>;

// cube demos
translate([-27.5, -5, 12]) chamferCube(10, 10, 10);
translate([-12.5, -5, 12]) chamferCube(10, 10, 10, 2);
translate([2.5, -5, 12])   chamferCube(10, 10, 10, 1, [1, 0, 0, 0]);
translate([17.5, -5, 12])  chamferCube(10, 10, 10, 1, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]);

/**
  * With this variable you can GLOBALLY override the standard circle quality of 1.0.
  * This variable will only work when set outside of all blocks.
  */
//globalCircleQuality = 0.1;

// cylinder demos
translate([-30, 0, -5])    chamferCylinder(10, 5);
translate([-15, 0, -5])    chamferCylinder(10, 5, 5, 2);
translate([0, 0, -5])      chamferCylinder(10, 5, 5, -1);
translate([15, 0, -5])     chamferCylinder(10, 5, 5, 1, 90);
translate([30, 0, -5])     chamferCylinder(10, 5, 5, -1, 240);

// cone demos
translate([-30, 0, -20])   chamferCylinder(10, 5, 2, 1, 0, 0.2);
translate([-15, 0, -20])   chamferCylinder(10, 5, 2, 2);
translate([0, 0, -20])     chamferCylinder(10, 5, 2, -1);
translate([15, 0, -20])    chamferCylinder(10, 5, 2, 1, 90);
translate([30, 0, -20])    chamferCylinder(10, 5, 2, -1, 240);

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
  * @param  sizeX          The size of the cube along the x axis
  * @param  sizeY          The size of the cube along the y axis
  * @param  sizeZ          The size of the cube along the z axis
  * @param  chamferHeight  The "height" of the chamfers as seen from
  *                        one of the dimensional planes (The real
  *                        width is side c in a right angled triangle)
  * @param  chamferX       Which chamfers to render along the x axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Left view" (Ctrl + 6)
  * @param  chamferY       Which chamfers to render along the y axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Front view" (Ctrl + 8)
  * @param  chamferZ       Which chamfers to render along the z axis
  *                        in clockwise order starting from the zero
  *                        point, as seen from "Bottom view" (Ctrl + 5)
  *
  * ---------------------------------------------------------------------
  *
  * chamferCylinder returns an cylinder or cone with 45° chamfers on
  * the edges of the cylinder. The chamfers are diectly printable on
  * Fused deposition modelling (FDM) printers without support structures.
  *
  * @param  height         Height of the cylinder
  * @param  radius         Radius of the cylinder (At the bottom)
  * @param  radius2        Radius of the cylinder (At the top)
  * @param  chamferHeight  The "height" of the chamfers as seen from
  *                        one of the dimensional planes (The real
  *                        width is side c in a right angled triangle)
  * @param  angle          The radius of the visible part of a wedge
  *                        starting from the x axis counter-clockwise
  * @param  quality        A circle quality factor where 1.0 is a fairly
  *                        good quality, range from 0.0 to 2.0
  *
  * ---------------------------------------------------------------------
  *
  * circleSegments calculates the number of segments needed to maintain
  * a constant circle quality.
  * If a globalSegementsQuality variable exist it will overwrite the
  * standard quality setting (1.0). Order of usage is:
  * Standard (1.0) <- globalCircleQuality <- Quality parameter
  *
  * @param  r        Radius of the circle
  * @param  quality  A quality factor, where 1.0 is a fairly good
  *                  quality, range from 0.0 to 2.0
  *
  * @return  The number of segments for the circle
  */
 