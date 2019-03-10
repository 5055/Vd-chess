void mousePressed() {
  if(!win){
  if (!upgradeP) {
    coords = new int[0];
    int xCoord = mouseX; 
    int yCoord = mouseY;
    String roundedx = "" + int(floor((xCoord/pieceSize)));
    String roundedy = "" + int(floor((yCoord/pieceSize)));
    while (roundedx.length() < rdemensions) {
      if (roundedx.length() < rdemensions) {
        roundedx = "0" + roundedx;
      }
    }
    while (roundedy.length() < rdemensions) {
      if (roundedy.length() < rdemensions) {
        roundedy = "0" + roundedy;
      }
    }
    // println(roundedx);
    for (int i = 0; i < rdemensions; i++) {
      int Dx;

      Dx = roundedx.charAt(roundedx.length()-i-1) -48;

      coords =   append(coords, Dx);
    }
    for (int i = 0; i < rdemensions; i++) {
      int Dy;

      Dy = roundedy.charAt(roundedy.length()-i-1) -48;

      coords =   append(coords, Dy);
    }
    // println(selectP);
    // println(wpiece[0].cordinates);
    if (selectP == null) {
      for (int i =0; i<wpiece.length; i ++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {

                //println(wpiece[0].cordinates);
                //  println(wpiece[0].cordinates); // 3 returned 1 bij (0,0,0,0,0,0,0)
                if (Arrays.equals(wpiece[i].cordinates, coords) &&wpiece[i].exist) {
                  selectP ="" + i;
                }
                if (Arrays.equals(bpiece[i].cordinates, coords)&&bpiece[i].exist) {
                  selectP ="" + i;
                }
              }
            }
          }
        }
      }
    } else if (selectP != null) {
      int piecendata = Integer.parseInt(selectP); 
      if (turn) {
        control(wpiece, bpiece, piecendata, coords);
      } else if (!turn) {
        control(bpiece, wpiece, piecendata, coords);
      }
      selectP = null;
    }

    // println(selectP);
    // selectP = null;
    update();
  }
  }
}
