//controlls the position and speed of the rectangle and the ellipse
int xpos= 250;
int ypos = 100;
int xspeed= 5;
int rectpos = 225;
int rectspeed = 5;
int EDGE = 500;
int WIDTH = 50;
int HEIGHT = 50;
int ORIGIN = 0;
int RADIUS = 50;
int YPOS_OFFSET = 4 ;


public void setup() {
    size(500,500);
}

public void draw () {
  background(0,0,0); 
  ellipse(xpos,ypos,2*RADIUS,2* RADIUS);
  rect(rectpos,375,WIDTH,HEIGHT);
   
   xpos += xspeed;
   rectpos += rectspeed;
   
 
   if (rectangleHitTheEdge(rectpos)) {
     rectspeed = -rectspeed;
   }

   
   
   if (circleHitTheEdge(xpos)) {
     xspeed =-xspeed;
   }
  
   
}




//checks if the ellipse has hit an edge, if so makes it bounce
public boolean circleHitTheEdge(int pos) {
  return (pos >= (EDGE- RADIUS)) || (pos<= RADIUS);
}


//checks if the rectangle has hit an edge, if so makes it bounce
public boolean rectangleHitTheEdge(int pos) { 
 return (pos >= (EDGE - WIDTH)) || (pos <= ORIGIN); 
}

public void mouseClicked () {
  //fill with a random color 
  fill(random(0,255),random(0,255),random(0,255));
  
  if ( circleHitTheEdge(ypos)) { 
      ypos = ypos + YPOS_OFFSET;
  }

  
}
