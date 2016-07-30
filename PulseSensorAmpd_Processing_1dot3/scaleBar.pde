
/*
    THIS SCROLLBAR OBJECT IS BASED ON THE ONE FROM THE BOOK "Processing" by Reas and Fry
*/

class Scrollbar{
 int x,y;               // the x and y coordinates
 float sw, sh;          // width and height of scrollbar
 float pos;             // position of thumb
 float posMin, posMax;  // max and min values of thumb
 boolean rollover;      // true when the mouse is over
 boolean locked;        // true when it's the active scrollbar
 float minVal, maxVal;  // min and max values for the thumb

 Scrollbar (int xp, int yp, int w, int h, float miv, float mav){ // values passed from the constructor
  x = xp;
  y = yp;
  sw = w;
  sh = h;
  minVal = miv;
  maxVal = mav;
  pos = x - sh/2;
  posMin = x-sw/2;
  posMax = x + sw/2;  // - sh;
 }

 // updates the 'over' boolean and position of thumb
 void update(int mx, int my) {
   if (over(mx, my) == true){
     rollover = true;            // when the mouse is over the scrollbar, rollover is true
   } else {
     rollover = false;
   }
   if (locked == true){
    pos = constrain (mx, posMin, posMax);
   }
 }

 // locks the thumb so the mouse can move off and still update
 void press(int mx, int my){
   if (rollover == true){
    locked = true;            // when rollover is true, pressing the mouse button will lock the scrollbar on
   }else{
    locked = false;
   }
 }

 // resets the scrollbar to neutral
 void release(){
  locked = false;
 }

 // returns true if the cursor is over the scrollbar
 boolean over(int mx, int my){
  if ((mx > x-sw/2) && (mx < x+sw/2) && (my > y-sh/2) && (my < y+sh/2)){
   return true;
  }else{
   return false;
  }
 }

 // draws the scrollbar on the screen
 void display (){

  noStroke();
  fill(255);
  rect(x, y, sw, sh);      // create the scrollbar
  fill (250,0,0);
  if ((rollover == true) || (locked == true)){
   stroke(250,0,0);
   strokeWeight(8);           // make the scale dot bigger if you're on it
  }
  ellipse(pos, y, sh, sh);     // create the scaling dot
  strokeWeight(1);            // reset strokeWeight
 }

 // returns the current value of the thumb
 float getPos() {
  float scalar = sw / sw;  // (sw - sh/2);
  float ratio = (pos-(x-sw/2)) * scalar;
  float p = minVal + (ratio/sw * (maxVal - minVal));
  return p;
 }
 }