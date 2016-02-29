



void serialEvent(Serial port){ 
   String inData = port.readStringUntil('\n');

   if (inData == null) {                 // bail if we didn't get anything
     return;
   }   
   if (inData.isEmpty()) {                // bail if we got an empty line
     return;
   }
   inData = trim(inData);                 // cut off white space (carriage return)   
   if(inData.length() <= 0) {             // bail if there's nothing there
     return;
   }

   if (inData.charAt(0) == 'S'){          // leading 'S' for sensor data
     inData = inData.substring(1);        // cut off the leading 'S'
     Sensor = int(inData);                // convert the string to usable int
   }
   if (inData.charAt(0) == 'B'){          // leading 'B' for BPM data
     inData = inData.substring(1);        // cut off the leading 'B'
     BPM = int(inData);                   // convert the string to usable int
     beat = true;                         // set beat flag to advance heart rate graph
     heart = 20;                          // begin heart image 'swell' timer
   }
 if (inData.charAt(0) == 'Q'){            // leading 'Q' means IBI data 
     inData = inData.substring(1);        // cut off the leading 'Q'
     IBI = int(inData);                   // convert the string to usable int
   }
   if (inData.charAt(0) == 'H'){          // leading 'H' for HRV data
     inData = inData.substring(1);        // cut off the leading 'H'
     HRV = int(inData);                   // convert the string to usable int
   }
}