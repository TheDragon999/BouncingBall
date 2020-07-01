//controlls the position and speed of the rectangle and the ellipse
int EDGE = 500;
int ORIGIN = 0;

int xCircle = 100;
int yCircle = 250;
int xRect = 400;
int yRect = 400;

int circleXSpeed = 2;
int circleYSpeed = 5;
int rectXSpeed = 5;
int rectYSpeed = 5;

boolean circleLeftToRight = true;
boolean circleTopToBottom = true;
boolean rectLeftToRight = true;

int circleRadius = 25;
int rectWidth = 50;
int rectHeight = 50;

int circleBottom, circleTop, circleLeft, circleRight;
int rectBottom, rectTop, rectLeft, rectRight;

public void setup() {
    size(500,500);
}

public void draw () {
  background(0,0,0); 
  ellipse(xCircle, yCircle, 2 * circleRadius, 2 * circleRadius);
  rect(xRect, yRect, rectWidth, rectHeight);
   
  if(rectLeftToRight){
    xRect += rectXSpeed;
  } else {
    xRect -= rectXSpeed;
  }
  
  if(circleLeftToRight){
    xCircle += circleXSpeed;
  } else {
    xCircle -= circleXSpeed;
  }
  
  if(circleTopToBottom){
    yCircle += circleYSpeed;
  } else {
    yCircle -= circleYSpeed;
  }
  

  
  if((circleHitTheBox("top") && circleTopToBottom) ||( circleHitTheBox("bottom") && !circleTopToBottom)){
    circleTopToBottom = !circleTopToBottom;
  } else if ((circleHitTheBox("right") && !circleLeftToRight) || (circleHitTheBox("left") && circleLeftToRight)){
    circleLeftToRight = !circleLeftToRight;
  }
  
  bounce(xRect, xCircle, yCircle);
  
 
   
}

public boolean circleHitTheBox (String side) {
  
  circleBottom = yCircle + circleRadius;
  circleTop = yCircle - circleRadius;
  circleLeft = xCircle - circleRadius;
  circleRight = xCircle + circleRadius;
  
  rectBottom = yRect + rectHeight;
  rectTop = yRect;
  rectLeft = xRect;
  rectRight = xRect + rectWidth;
  
  
  if(side == "top"){
    return ((circleBottom >= rectTop) && (circleRight >= rectLeft) && (circleLeft <= rectRight));
  }
  
  if (side == "bottom"){
    return ((circleTop <= rectBottom) && (circleRight >= rectLeft) && (circleLeft <= rectRight));
  }
  
  if (side == "left"){
    return((circleRight >= rectLeft) && (circleTop <= rectBottom) && (circleBottom >= rectTop));
  } 
  
  if (side == "right"){
    return((circleLeft <= rectRight) && (circleTop <= rectBottom) && (circleBottom >= rectTop));
  }
  
  else {
    return false;
  }
  
}
//checks if the ellipse has hit an edge, if so makes it bounce
public boolean circleHitTheEdge(int pos) {
  return (pos >= (EDGE - circleRadius)) || (pos <= circleRadius);
}

public void bounce(int xRect, int xCircle, int yCircle){
     if (rectangleHitTheEdge(xRect)) {
     rectLeftToRight = !rectLeftToRight;
   }

   if (circleHitTheEdge(xCircle)) {
     circleLeftToRight = !circleLeftToRight;
   }
  
   if (circleHitTheEdge(yCircle)) {
     circleTopToBottom = !circleTopToBottom;
   }
}


//checks if the rectangle has hit an edge, if so makes it bounce
public boolean rectangleHitTheEdge(int pos) { 
 return (pos >= (EDGE - rectWidth)) || (pos <= ORIGIN); 
}

public void mouseClicked () {
  //fill with a random color 
  fill(random(0,255),random(0,255),random(0,255));
  
}
