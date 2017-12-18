// Jacob Aylward
// SolarSystemGenerator3D-Planet

class Planet {
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed;
  PVector v;

  PShape globe;

/*
* Planet()
* @param r, d, o
* @return r, d, o
*/
  Planet(float r, float d, float o) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
  }

/*
* void orbit()
* @param
* @return
*/
  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

/*
* void spawnMoons()
* @param total, level
* @return new Planet
*/
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r), (radius+r)*2);
      float o = random(-0.1, 0.1);
      planets[i] = new Planet(r, d, o);
      if (level < 2) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

/*
* void show()
* @param
* @return
*/
  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    sphere(radius);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}