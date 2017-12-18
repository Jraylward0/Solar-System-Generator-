// Jacob Aylward
// SolarSystemGenerator3D

import peasy.*;
Planet sun;
PeasyCam cam;

/*
* void setup()
* @param
* @return
*/
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0);
  sun.spawnMoons(4, 1);
}

/*
* void draw()
* @param
* @return
*/
void draw() {
  background(0);
  lights();
  sun.show();
  sun.orbit();
}