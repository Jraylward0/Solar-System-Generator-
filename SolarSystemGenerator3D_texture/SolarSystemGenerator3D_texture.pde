// Jacob Aylward
// SolarSystemGenerator3D_texture

import peasy.*;
Planet sun;
PeasyCam cam;
PImage sunTexture;
PImage[] textures = new PImage[3];

/*
* void setup()
* @param
* @return
*/
void setup() {
  size(600, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  //textures[1] = loadImage("venus.jpg");
  textures[1] = loadImage("earth.jpg");
  textures[2] = loadImage("mars.jpg");
  //textures[4] = loadImage("jupiter.jpg");
  //textures[5] = loadImage("saturn.jpg");
  //textures[6] = loadImage("uranus.jpg");
  //textures[7] = loadImage("neptune.jpg");
  //textures[8] = loadImage("pluto.jpg");
  
  
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

/*
* void draw()
* @param
* @return
*/
void draw() {
  background(0);
  ambientLight(255,255,255);
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
}