void control( piece[] tpiece, piece[] opiece, int piececo, int[] contcord) {
  int side;
  int validself_1 =0; 
  int validself_2 =0; 
  selfschaak =true;
  if (tpiece[piececo].name.charAt(0) == 'W') {
    side = 1;
  } else {
    side = -1;
  }

  //  println(tpiece[piececo].cordinates);
  if (tpiece[piececo].name.charAt(1) == 'P') {
    boolean validself =true;
    int validselfcountx =0;
    int validselfcounty =0;
    for (int k =0; k<demensions; k ++) {
      if (k < demensions/2) {
        if (abs(tpiece[piececo].cordinates[k]- contcord[k]) >1) {
          validself = false;
        }
        if (abs(tpiece[piececo].cordinates[k]- contcord[k]) ==1) {
          validself = false;
          validselfcountx++;
        }
      }
      if (k >= demensions/2) {
        if (abs(tpiece[piececo].cordinates[k]- contcord[k]) >2) {
          validself = false;
        }
        if (abs(tpiece[piececo].cordinates[k]- contcord[k]) >1 && !tpiece[piececo].F) {
          validself = false;
        }
        if (abs(tpiece[piececo].cordinates[k]- contcord[k]) ==1) {
          validselfcounty++;
        }
      }
    }
    if (validselfcounty >0 && validselfcountx>0) {
      validself = true;
    }

    if (validself ==true ) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        schaak(tpiece, opiece, piececo, contcord);
        if (selfschaak) {
          int checkOside =0;
          for (int i =0; i<demensions; i ++) {
            tpiece[piececo].cordinates[i] = contcord[i];
          }
          for (int i =0; i<opiece.length; i++) {
            if ((i%10000 -2000) <6000) {
              if ((i%1000 -200) <600) {
                if ((i%100 -20) <60) {
                  if ((i%10 -2) <6) {
                    if (Arrays.equals(tpiece[piececo].cordinates, opiece[i].cordinates) && opiece[i].exist && tpiece[piececo].exist) {
                      opiece[i].exist =false;
                    }
                  }
                }
              }
            }
          }
          for (int k =0; k<demensions; k ++) {
            if ((k >= demensions/2 &&(tpiece[piececo].cordinates[k] == 7 &&tpiece[piececo].name.charAt(0) == 'W')|| (tpiece[piececo].cordinates[k] == 0 &&tpiece[piececo].name.charAt(0) == 'B'))&& k >=demensions/2) {
              checkOside++;
            }
          }
          if (checkOside == demensions/2 ) {
      //      upgrade(tpiece, piececo);
          } else {
            tpiece[piececo].F = false;
     //        schaakmat(tpiece,opiece);
            switchturn();
          }
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'R') {
    int validself =0;
    for (int i =0; i<demensions; i ++) {
      if (abs(contcord[i]- tpiece[piececo].cordinates[i]) !=0) {
        validself++;
      }
    }
    if (validself ==1) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        schaak(tpiece, opiece, piececo, contcord);
        if (selfschaak) {
          for (int i =0; i<demensions; i ++) {
            tpiece[piececo].cordinates[i] = contcord[i];
          }
          for (int i =0; i<opiece.length; i++) {
            if ((i%10000 -2000) <6000) {
              if ((i%1000 -200) <600) {
                if ((i%100 -20) <60) {
                  if ((i%10 -2) <6) {
                    if (Arrays.equals(tpiece[piececo].cordinates, opiece[i].cordinates) && opiece[i].exist && tpiece[piececo].exist) {
                      opiece[i].exist =false;
                    }
                  }
                }
              }
            }
          }
          tpiece[piececo].F = false;
          schaakmat(tpiece,opiece);
          switchturn();
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'N') {
    for (int i =0; i<demensions; i ++) {
      if (abs(contcord[i]- tpiece[piececo].cordinates[i]) ==1) {
        validself_1++;
      }
      if (abs(contcord[i]- tpiece[piececo].cordinates[i]) ==2) {
        validself_2++;
      }
    }

    if (validself_1 ==demensions-1 && validself_2 ==1) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        for (int i =0; i<demensions; i ++) {
          tpiece[piececo].cordinates[i] = contcord[i];
        }
        for (int m =0; m<opiece.length; m++) {
          if ((m%10000 -2000) <6000) {
            if ((m%1000 -200) <600) {
              if ((m%100 -20) <60) {
                if ((m%10 -2) <6) {
                  if (Arrays.equals(tpiece[piececo].cordinates, opiece[m].cordinates) && opiece[m].exist && tpiece[piececo].exist) {
                    opiece[m].exist =false;
                  }
                }
              }
            }
          }
        }
        tpiece[piececo].F = false;
        switchturn();
      }
    }
  }

  if (tpiece[piececo].name.charAt(1) == 'B') {
    boolean validself =true;
    int r = abs(tpiece[piececo].cordinates[0] - contcord[0]);
    for (int i =0; i<demensions; i ++) {
      if (abs(tpiece[piececo].cordinates[i] - contcord[i]) != r) {
        validself =false;
      }
    }
    if (validself ==true) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        for (int i =0; i<demensions; i ++) {
          tpiece[piececo].cordinates[i] = contcord[i];
        }
        for (int m =0; m<opiece.length; m++) {
          if ((m%10000 -2000) <6000) {
            if ((m%1000 -200) <600) {
              if ((m%100 -20) <60) {
                if ((m%10 -2) <6) {
                  if (Arrays.equals(tpiece[piececo].cordinates, opiece[m].cordinates) && opiece[m].exist && tpiece[piececo].exist) {
                    opiece[m].exist =false;
                  }
                }
              }
            }
          }
        }
        tpiece[piececo].F = false;
        switchturn();
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'K') {
    boolean validself =true;
    boolean validRb =false;
    for (int i =0; i<demensions; i ++) {
      if (abs(tpiece[piececo].cordinates[i] - contcord[i]) >1) {
        validself = false;
      } else if (tpiece[piececo].F) {
        for (int j =0; j<tpiece.length; j ++) {
          if ((j%10000 -2000) <6000) {
            if ((j%1000 -200) <600) {
              if ((j%100 -20) <60) {
                if ((j%10 -2) <6) {
                  int validR=0;
                  int validRy =0;
                  for (int k =0; k<demensions; k ++) {
                    if (tpiece[piececo].F &&tpiece[j].F&& tpiece[j].name.charAt(1) == 'R'&&tpiece[j].exist && ((abs(tpiece[j].cordinates[k] - contcord[k]))==1||(abs(tpiece[j].cordinates[k] - contcord[k]))==0)) {
                      validR++;
                      if (k >=demensions/2 && contcord[k] !=tpiece[piececo].cordinates[k]) {
                        validRy++;
                      }
                      if (validR ==demensions &&validRy ==0) {
                        validRb = true;
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if (tpiece[piececo].F && validRb) {
          validself =true;
        }
      }
    }
    if (validself ==true) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        schaak(tpiece, opiece, piececo, contcord);
        if (selfschaak) {
          for (int i =0; i<demensions; i ++) {
            tpiece[piececo].cordinates[i] = contcord[i];
          }
          for (int m =0; m<opiece.length; m++) {
            if ((m%10000 -2000) <6000) {
              if ((m%1000 -200) <600) {
                if ((m%100 -20) <60) {
                  if ((m%10 -2) <6) {
                    if (Arrays.equals(tpiece[piececo].cordinates, opiece[m].cordinates) && opiece[m].exist && tpiece[piececo].exist) {
                      opiece[m].exist =false;
                    }
                  }
                }
              }
            }
          }
          tpiece[piececo].F = false;
          switchturn();
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'Q') {
    int validselfR =0;
    boolean validselfB =true;
    int r = abs(tpiece[piececo].cordinates[0] - contcord[0]);
    for (int i =0; i<demensions; i ++) {
      if (abs(tpiece[piececo].cordinates[i] - contcord[i]) != r) {
        validselfB =false;
      }
    }
    for (int i =0; i<demensions; i ++) {
      if (abs(contcord[i]- tpiece[piececo].cordinates[i]) !=0) {
        validselfR++;
      }
    }
    if (validselfR ==1 || validselfB) {
      collision(tpiece, opiece, piececo, contcord);
      if (coll) {
        for (int i =0; i<demensions; i ++) {
          tpiece[piececo].cordinates[i] = contcord[i];
        }
        for (int m =0; m<opiece.length; m++) {
          if ((m%10000 -2000) <6000) {
            if ((m%1000 -200) <600) {
              if ((m%100 -20) <60) {
                if ((m%10 -2) <6) {
                  if (Arrays.equals(tpiece[piececo].cordinates, opiece[m].cordinates) && opiece[m].exist && tpiece[piececo].exist) {
                    opiece[m].exist =false;
                  }
                }
              }
            }
          }
        }
        tpiece[piececo].F = false;
        switchturn();
      }
    }
  }
}
