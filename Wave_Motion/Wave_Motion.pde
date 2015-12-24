
import controlP5.*;

ControlP5 cp5;

int density = 20;
Circle[] circles;
int index;
float s;
float shifting = 30;
int grid = 50;
String shape = "ellipse";

void setup() {
  size(800, 600);


  cp5 = new ControlP5(this);

  cp5.addSlider("density")
     .setPosition(20,20)
     .setRange(5,30)
     .setColorActive(color(200))
     .setColorBackground(color(0, 0, 0))
     .setColorForeground(color(255))
     ;
  cp5.addSlider("shifting")
     .setPosition(20,40)
     .setRange(0,50)
          .setColorActive(color(200))
     .setColorBackground(color(0, 0, 0))
     .setColorForeground(color(255))
     ;
  cp5.addSlider("grid")
     .setPosition(20,60)
     .setRange(0,255)
          .setColorActive(color(200))
     .setColorBackground(color(0, 0, 0))
     .setColorForeground(color(255))
     ;

  circles = new Circle[int(sq(density))];
}

void draw() {
  background(150);
  for (int i=0; i<density; i++) {
    for (int j=0; j<density; j++) {
      circles[i] = new Circle(i*(width/density), j*(height/density), (i+j)*shifting, (width/density*1.5));
      circles[i].display(s);
    }
  }
  s+=5;
}

class Circle
{
  float xPos, yPos;
  float radius;
  float shifting;

  Circle(float x, float y, float s, float r) {
    radius = r;
    xPos = radius/2+x;
    yPos = radius/2+y;
    shifting = s;
  }


  void display(float a) {
    noFill();
    strokeWeight(1);
    stroke(0,255,255, grid);
    ellipseMode(CENTER);
    pushMatrix();
      ellipse(xPos, yPos, radius, radius);
      translate(xPos, yPos);
      rotate(radians(shifting+a));
      translate(radius/2, 0);

      //scale(sin(radians(shifting+a)));

      switch(shape){
        case "line":
          strokeWeight(2);
          stroke(0,255,255);
          line(-10, 0, 10, 0);
        break;
        case "ellipse":
          noStroke();
          fill(0,255,255);
          ellipse(0, 0, 10, 10);
        break;
      }
    popMatrix();
  }
}

void keyPressed(){
  if(shape=="ellipse"){
    shape="line";
  }else{
    shape="ellipse";
  }
}