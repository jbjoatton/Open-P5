ArrayList particles;

Fan f;
int fSize = 50; // fan size
float fSpeed=0.01; // fan speed
String[] modes = {
  "bulles","traits","star","line"
};
int nb = 0;
int indexModes=0;
String mode=modes[indexModes];

float xoff = 0.0;

void setup() {
  size(800, 600);
  particles = new ArrayList();
  noSmooth();
  noCursor(); //hide cursor
  f = new Fan();
}

void draw() {
  particles.add(new Particle());

  background(0);

  for (int i=0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.run();
    p.display();
    p.wind(mouseX, mouseY);

    if ((p.y>height) || (p.y<0) || (p.x>width) || (p.x<0)) {
      particles.remove(i); // delete particle
    }
  }
  f.display();
  f.update();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (indexModes<3) {
        mode = modes[indexModes+=1];
        println(mode);
      }
    }else if(keyCode == LEFT) {
       if (indexModes>0) {
        mode = modes[indexModes-=1];
        println(mode);
            }
    }
  }
}


