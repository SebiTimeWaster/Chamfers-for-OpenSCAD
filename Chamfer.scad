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
 */
module chamferCube(sizeX, sizeY, sizeZ, chamferHeight = 1, chamferX = [1, 1, 1, 1], chamferY = [1, 1, 1, 1], chamferZ = [1, 1, 1, 1]) {
    chamferCLength = sqrt(chamferHeight * chamferHeight * 2);
    difference() {
        cube([sizeX, sizeY, sizeZ]);
        for(x = [0 : 3]) {
			chamferSide1 = min(x, 1) - floor(x / 3); // 0 1 1 0
			chamferSide2 = floor(x / 2); // 0 0 1 1
			if(chamferX[x]) {
				translate([-0.1, chamferSide1 * sizeY, -chamferHeight + chamferSide2 * sizeZ])
				rotate([45, 0, 0])
				cube([sizeX + 0.2, chamferCLength, chamferCLength]);
			}
			if(chamferY[x]) {
				translate([-chamferHeight + chamferSide2 * sizeX, -0.1, chamferSide1 * sizeZ])
				rotate([0, 45, 0])
				cube([chamferCLength, sizeY + 0.2, chamferCLength]);
			}
			if(chamferZ[x]) {
				translate([chamferSide1 * sizeX, -chamferHeight + chamferSide2 * sizeY, -0.1])
				rotate([0, 0, 45])
				cube([chamferCLength, chamferCLength, sizeZ + 0.2]);
			}
        }
    }
}

/**
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
module chamferCylinder(height, radius, radius2=undef, fragments = 50, chamferHeight = 1, angle = 0) {
	radius2 = (radius2 == undef) ? radius : radius2;
	module cc() {
		translate([0, 0, height - abs(chamferHeight)]) cylinder(abs(chamferHeight), r1 = radius2, r2 = radius2 - chamferHeight, $fn = fragments);
		translate([0, 0, abs(chamferHeight)]) cylinder(height - abs(chamferHeight) * 2, r1 = radius, r2 = radius2, $fn = fragments);
		cylinder(abs(chamferHeight), r1 = radius - chamferHeight, r2 = radius, $fn = fragments);
	}
	module box(brim = abs(min(chamferHeight, 0)) + 1) {
		translate([-radius - brim, 0, -brim]) cube([radius * 2 + brim * 2, radius + brim, height + brim * 2]);
	}
	module hcc() {
		intersection() {
			cc();
			box();
		}
	}
	if(angle <= 0 || angle >= 360) cc();
	else {
		if(angle > 180) hcc();
		difference() {
			if(angle <= 180) hcc();
			else rotate([0, 0, 180]) hcc();
			rotate([0, 0, angle]) box(abs(min(chamferHeight, 0)) + radius);
		}
	}
}
