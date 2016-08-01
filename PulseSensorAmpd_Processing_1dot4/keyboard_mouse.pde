
void mousePressed(){
  scaleBar.press(mouseX, mouseY);
  if(!serialPortFound){
    for(int i=0; i<button.length; i++){
      if(button[i].pressRadio(mouseX,mouseY)){
        try{
          port = new Serial(this, Serial.list()[i], 115200);  // make sure Arduino is talking serial at this baud rate
          delay(1000);
          println(port.read());
          port.clear();            // flush buffer
          port.bufferUntil('\n');  // set buffer full flag on receipt of carriage return
          serialPortFound = true;
        }
        catch(Exception e){
          println("Couldn't open port " + Serial.list()[i]);
        }
      }
    }
  }
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
