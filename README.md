# Chamfered primitives for OpenSCAD
A library to create primitives with 45° chamfers in OpenSCAD.

## What it does
The commands `chamferCube` and `chamferCylinder` can be used to create chamfered versions of the existing `cube` and `cylinder` commands.

The Chamfers are always at a 45° angle to the ground plane and are printable on Fused deposition modelling (FDM) printers in a good quality.

![Demo of possiblities with chamfers](https://github.com/SebiTimeWaster/OpenSCAD-Chamfer/blob/master/Chamfer.png)

Additionally the `chamferCylinder` can also produce a circular sector (wedge), which the original cylinder command cannot do.

## Installation
* [Download](https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD/releases) the library
* Unpack it to OpenSCAD\libraries
* Restart OpenSCAD

OR

* Open your console
* Go to OpenSCAD\libraries
* Run ```git clone https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD.git```
* Restart OpenSCAD

## Usage
Don't forget to import the library to your script by adding this to the first line:

`use <Chamfers-for-OpenSCAD/Chamfer.scad>;`

Please read the documentation in [Demo.scad](https://github.com/SebiTimeWaster/OpenSCAD-Chamfer/blob/master/Demo/Demo.scad) to see how to use it.
