
void mousePressed(){
  scaleBar.press(mouseX, mouseY);
}

void mouseReleased(){
  scaleBar.release();
}

void keyPressed(){

 switch(key){
   case 's':    // pressing 's' or 'S' will take a jpg of the processing window
   case 'S':
     saveFrame("heartLight-####.jpg");    // take a shot of that!
     break;

   default:
     break;
 }
}
