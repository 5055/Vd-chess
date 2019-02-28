void update() {
  int b;
  background(207, 255, 150);

  for (int i =0; i < pow( 10, demensions/2); i++) {
    if ((i%10000 -2000) <6000) {
      if ((i%1000 -200) <600) {
        if ((i%100 -20) <60) {
          if ((i%10 -2) <6) {
            if (demensions %2 ==0) {
              for (int j =0; j < pow( 10, demensions/2); j++) {
                if ((j%10000 -2000) <6000) {
                  if ((j%1000 -200) <600) {
                    if ((j%100 -20) <60) {
                      if ((j%10 -2) <6) {
                        b = (i + j)%2;
                        if ( b ==1) {
                          fill (255);
                          rect(i*pieceSize+displx, j*pieceSize+disply, pieceSize, pieceSize);
                        }
                        if ( b ==0) {
                          fill (0);
                          rect(i*pieceSize+displx, j*pieceSize+disply, pieceSize, pieceSize);
                        }
                      }
                    }
                  }
                }
              }
            } else {
              for (int j =0; j < pow( 10, demensions/2); j++) {
                if ((i%10000 -2000) <6000) {
                  if ((j%1000 -200) <600) {
                    if ((j%100 -20) <60) {
                      if ((j%10 -2) <6) {
                        b = (i + j)%2;
                        if ( b ==1) {
                          fill (255);
                          rect(i*pieceSize+displx, j*pieceSize + disply, pieceSize, pieceSize);
                        }
                        if ( b ==0) {
                          fill (0);
                          rect(i*pieceSize+displx, j*pieceSize+ disply, pieceSize, pieceSize);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } 
  for (int i =0; i<wpiece.length; i++) {
    if ((i%10000 -2000) <6000) {
      if ((i%1000 -200) <600) {
        if ((i%100 -20) <60) {
          if ((i%10 -2) <6) {
            wpiece[i].display(); 
            bpiece[i].display();
          }
        }
      }
    }
  }
}
void switchturn() {
  if (turn) {
    turn = false;
  } else if (!turn) {
    turn = true;
  }
}
