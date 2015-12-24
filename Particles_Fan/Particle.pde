class Particle {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float r;


  Particle() {
    x= width/2;
    y= height/2;
    xspeed= random(-0.5, 0.5);
    yspeed= random(-0.5, 0.5);
    r=random(5,15);
  }

  void run() {
    x = x+xspeed;
    y = y+yspeed;
  }

  void wind(float posx,float posy){
    float d = dist(posx,posy,x,y);
    float r = atan2(mouseY-y,mouseX-x)+PI;
   
    if(d<fSize){
        xspeed = xspeed + (d * cos(r))/(100/fSpeed);
        yspeed = yspeed + (d * sin(r))/(100/fSpeed); 
  }
}

  void display() {
    fill(0,255,255);
    if(mode=="bulles"){
      noStroke();
      ellipse(x,y, r, r);
    }else if(mode=="traits"){
      //rect(x,y, r*10, 1); 
      stroke(255);
     line(x,y, x+(random(-10,10)), y+(random(-10,10))); 
    }else if(mode=="star"){
      stroke(random(0,255));
      point(x,y);
    }else if(mode=="line"){
      stroke(0,255,255);
     line(x,y, width/2, height/2); 
    }
  }
}

