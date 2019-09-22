/**
  * This code is published under a
  * Creative Commons Attribution-NonCommercial-ShareAlike 3.0
  * licence, please respect it.
  *
  * Chamfered primitives for OpenSCAD v1.0
  */


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
  */
module chamferCube(size, chamfers = [undef, undef, undef], ch = 1, ph1 = 1, ph2 = undef, ph3 = undef, ph4 = undef, sizeX = undef, sizeY = undef, sizeZ = undef, chamferHeight = undef, chamferX = undef, chamferY = undef, chamferZ = undef) {
    if(size[0]) {
        chamferCubeImpl(size[0], size[1], size[2], ch, chamfers[0], chamfers[1], chamfers[2]);
    } else {
        // keep backwards compatibility
        size     = (sizeX == undef) ? size : sizeX;
        chamfers = (sizeY == undef) ? chamfers : sizeY;
        ch       = (sizeZ == undef) ? ch : sizeZ;
        ph1      = (chamferHeight == undef) ? ph1 : chamferHeight;
        ph2      = (chamferX == undef) ? ph2 : chamferX;
        ph3      = (chamferY == undef) ? ph3 : chamferY;
        ph4      = (chamferZ == undef) ? ph4 : chamferZ;
        
        chamferCubeImpl(size, chamfers, ch, ph1, ph2, ph3, ph4);
    }
}
    
module chamferCubeImpl(sizeX, sizeY, sizeZ, chamferHeight, chamferX, chamferY, chamferZ) {
    chamferX = (chamferX == undef) ? [1, 1, 1, 1] : chamferX;
    chamferY = (chamferY == undef) ? [1, 1, 1, 1] : chamferY;
    chamferZ = (chamferZ == undef) ? [1, 1, 1, 1] : chamferZ;
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
  *                good quality, range from 0.0 to 2.0
  */
module chamferCylinder(h, r, r2 = undef, ch = 1, ch2 = undef, a = 0, q = -1.0, height = undef, radius = undef, radius2 = undef, chamferHeight = undef, chamferHeight2 = undef, angle = undef, quality = undef) {
    // keep backwards compatibility
    h   = (height == undef) ? h : height;
    r   = (radius == undef) ? r : radius;
    r2  = (radius2 == undef) ? r2 : radius2;
    ch  = (chamferHeight == undef) ? ch : chamferHeight;
    ch2 = (chamferHeight2 == undef) ? ch2 : chamferHeight2;
    a   = (angle == undef) ? a : angle;
    q   = (quality == undef) ? q : quality;
    
    height         = h;
    radius         = r;
    radius2        = (r2 == undef) ? r : r2;
    chamferHeight  = ch;
    chamferHeight2 = (ch2 == undef) ? ch : ch2;
    angle          = a;
    quality        = q;
    
    module cc() {
        if(chamferHeight2 != 0) {
            translate([0, 0, height - abs(chamferHeight2)]) cylinder(abs(chamferHeight2), r1 = radius2, r2 = radius2 - chamferHeight2, $fn = circleSegments(radius2, quality));
        }
        translate([0, 0, abs(chamferHeight)]) cylinder(height - abs(chamferHeight2) - abs(chamferHeight), r1 = radius, r2 = radius2, $fn = circleSegments(max(radius, radius2), quality));
        if(chamferHeight != 0) {
            cylinder(abs(chamferHeight), r1 = radius - chamferHeight, r2 = radius, $fn = circleSegments(radius, quality));
        }
    }
    module box(brim = abs(min(chamferHeight2, 0)) + 1) {
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
            rotate([0, 0, angle]) box(abs(min(chamferHeight2, 0)) + radius);
        }
    }
}

/**
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
  */
function circleSegments(r, q = -1.0) = (r * PI * 4 + 40) * ((q >= 0.0) ? q : globalCircleQuality);

// set global quality to 1.0, can be overridden by user
globalCircleQuality = 1.0;
