class Fan {
  float x;
  float y;
  float rotation;

  Fan() {
    x= mouseX;
    y= mouseY;
  }

  void update() {
    x=mouseX;
    y=mouseY;
    rotation+=fSpeed;
  }
  
  void display() {
      noStroke();
      fill(255);
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(rotation);
      rect(-1, 0-(fSize/2), 2, fSize);
      popMatrix();
      if (mousePressed) {
    if(fSpeed<0.8){
      fSpeed+=0.01;
    }
      }
    else {
      if(fSpeed>0.02){
        fSpeed-=0.01;
      }
    }
  }
}

