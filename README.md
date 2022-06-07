# Chamfered primitives for OpenSCAD

A library to create primitives with 45° chamfers in OpenSCAD.

## What it does

The commands `chamferCube` and `chamferCylinder` can be used to create chamfered versions of the existing `cube` and `cylinder` commands.

The Chamfers are always at a 45° angle to the ground plane and are printable on Fused deposition modelling (FDM) printers in a good quality.

![Demo of possiblities with chamfers](https://github.com/SebiTimeWaster/OpenSCAD-Chamfer/blob/master/Chamfer.png)

Additionally

-   The `chamferCylinder` can also produce a circular sector (wedge), what the cylinder command cannot
-   The `circleSegments` function calculates the amount of segments needed for a certain circle radius, it reproduces a much better quality than $fa and $fs settings
-   A `globalCircleQuality` variable can be set to globally override the standard setting of 1.0, but the quality setting in `chamferCylinder` stil has precedence over this variable

## Installation

First find out where your library folder is by opening OpenSCAD and clicking "File -> Show Library Folder", then do:

-   [Download](https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD/releases) the library (Download the ZIP!)
-   Unpack it to the library folder
-   Restart OpenSCAD

OR

-   Open your console
-   Go to the library folder
-   Run `git clone https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD.git`
-   Restart OpenSCAD

## Usage

Don't forget to import the library to your script by adding this to the first line:

`include <Chamfers-for-OpenSCAD/Chamfer.scad>;`

Please read the documentation in [Demo.scad](https://github.com/SebiTimeWaster/OpenSCAD-Chamfer/blob/master/Demo/Demo.scad) to see how to use it.

## Changelog

v1.2:

-   Added the possibility to create arbitrary sided "cylinders" to create geometric shapes like extruded triangles and so on
-   Fixed regression introduced in v1.1 where certain radius combinations result in wrong form generation due to broken segment calculation
-   Improved demo file formatting

v1.1:

-   Improved preview rendering of cylinders (see [Artifact-Test.scad](https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD/blob/master/Demo/Artifact-Test.scad))

v1.0:

-   Changed parameters of `chamferCube` and `chamferCylinder` to work similar to the original `cube` and `cylinder` commands. This is not a breaking change, but please contact me should you encounter compatibility problems.
-   Changed license from GPL 3.0 to Creative Commons license to give users more freedom.

v0.4:

-   Added separate chamfer parameters for the top and bottom sides of cylinders

v0.3:

-   Added a global override for the standard circle quality

v0.2:

-   Added new circle quality feature (segment calculator) which introduces an incompatibility with v0.1
-   Prevented cylinders with height 0 from being created when setting chamferHeight to 0
