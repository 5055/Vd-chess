class piece {
  color c;
  String name;
  boolean exist;
  boolean F;
  int[] cordinates; 

  piece(color tempC, int[] tempcordinates, String tempName, boolean tempExist, boolean tempfirstm) {
    c = tempC ;
    name = tempName;
    exist =tempExist;
    F = tempfirstm;
    cordinates = tempcordinates;
  }
  void move(int amove, int bmove) {                                                         //Bewegen

    //  xpos+= amove;
    //  ypos+= bmove;
    //  F =false;
  }


  void display() {
       if (name.charAt(1) != 'R'&& name.charAt(1) != 'K') {
     exist =false;
     }

    int tempxcalc =0;
    int tempycalc =0;
    if (exist) {
      stroke(0);
      fill(c);
      for (int i =0; i<demensions/2; i ++) {
        float powercalc = pow(10, i); 
        tempxcalc = tempxcalc + cordinates[i]*((int) powercalc);
        tempycalc = tempycalc + cordinates[i+cordinates.length/2]*((int) powercalc);
      }

      ellipse(tempxcalc*pieceSize + pieceSize/2 + displx, tempycalc*pieceSize +pieceSize/2+ disply, pieceSize, pieceSize);
      fill(0);
      text(name.charAt(1), tempxcalc*pieceSize +pieceSize/2 + displx, tempycalc*pieceSize +pieceSize+ disply);

      if (c == color(255, 255, 0)) {
        ellipse(tempxcalc*pieceSize*2 + pieceSize/2 + displx, tempycalc*pieceSize +pieceSize/2+ disply, pieceSize, pieceSize);
      }
    }
  }
}
