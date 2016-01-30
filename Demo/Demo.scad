use <Chamfer/Chamfer.scad>;

// cube demos
translate([-30, 0, 15])   chamferCube(10, 10, 10);
translate([-15, 0, 15])   chamferCube(10, 10, 10, 2);
translate([0, 0, 15])     chamferCube(10, 10, 10, 1, [1, 0, 0, 0]);
translate([15, 0, 15])    chamferCube(10, 10, 10, 1, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]);

// cylinder demos 
translate([-30, 0, 0])    chamferCylinder(10, 5);
translate([-15, 0, 0])    chamferCylinder(10, 5, 5, 150, 2);
translate([0, 0, 0])      chamferCylinder(10, 5, 5, 150, -1);
translate([15, 0, 0])     chamferCylinder(10, 5, 5, 150, 1, 90);
translate([30, 0, 0])     chamferCylinder(10, 5, 5, 150, -1, 240);

// cone demos 
translate([-30, 0, -15])  chamferCylinder(10, 5, 2, 50, 1);
translate([-15, 0, -15])  chamferCylinder(10, 5, 2, 150, 2);
translate([0, 0, -15])    chamferCylinder(10, 5, 2, 150, -1);
translate([15, 0, -15])   chamferCylinder(10, 5, 2, 150, 1, 90);
translate([30, 0, -15])   chamferCylinder(10, 5, 2, 150, -1, 240);


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
 * @param  fragments      How fine the cylinder gets reproduced
 * @param  chamferHeight  The "height" of the chamfers as seen from 
 *                        one of the dimensional planes (The real 
 *                        width is side c in a right angled triangle)
 * @param  angle          The radius of the visible part of a wedge
 *                        starting from the x axis counter-clockwise        
 */
 
