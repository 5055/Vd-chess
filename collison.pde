void collision( piece[] tpiece, piece[] opiece, int piececo, int[] contcord) {
  coll = true;
  int[] collcord = new int[demensions];
  int[] collcalc = new int[demensions];
  arrayCopy(contcord, collcord); 
  if (tpiece[piececo].name.charAt(1) == 'R') {
    for (int i =0; i<demensions; i ++) {
      if (abs(collcord[i] - tpiece[piececo].cordinates[i])> 0) {
        for (int k =0; k<collcord.length; k++) {
          collcalc[k] = collcord[k];
        }
        while (abs(collcalc[i] - tpiece[piececo].cordinates[i])> 0) {
          for (int j =0; j<tpiece.length; j++) {
            if ((j%10000 -2000) <6000) {
              if ((j%1000 -200) <600) {
                if ((j%100 -20) <60) {
                  if ((j%10 -2) <6) {     

                    if (Arrays.equals(collcalc, tpiece[j].cordinates) && tpiece[j].exist) {
                      coll = false;
                    }
                    if (Arrays.equals(collcalc, opiece[j].cordinates)&& collcalc[i] != contcord[i] &&opiece[j].exist) {
                      coll = false;
                    }
                  }
                }
              }
            }
          }
          //  println(collcalc[i]);
          if (collcalc[i]-tpiece[piececo].cordinates[i]>0) {
            collcalc[i]= collcalc[i]-1;
          }
          if (collcalc[i]- tpiece[piececo].cordinates[i]<0) {
            collcalc[i]= collcalc[i]+1;
          }
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'N') {
    for (int k =0; k<demensions; k++) {
      collcalc[k] = collcord[k];
    }
    for (int i =0; i<tpiece.length; i ++) {
      if ((i%10000 -2000) <6000) {
        if ((i%1000 -200) <600) {
          if ((i%100 -20) <60) {
            if ((i%10 -2) <6) {   
              if (Arrays.equals(collcalc, tpiece[i].cordinates) && tpiece[i].exist) {
                coll = false;
              }
            }
          }
        }
      }
    }
  } 

  if (tpiece[piececo].name.charAt(1) == 'B') {
    for (int k =0; k<demensions; k++) {
      collcalc[k] = collcord[k];
    }
    for (int j =0; j<demensions; j ++) {
      while (collcalc[0]-tpiece[piececo].cordinates[0] !=0) {
        //  println(collcalc[0]-tpiece[piececo].cordinates[0]);
        for (int i =0; i<tpiece.length; i ++) {
          if ((i%10000 -2000) <6000) {
            if ((i%1000 -200) <600) {
              if ((i%100 -20) <60) {
                if ((i%10 -2) <6) {   
                  if (Arrays.equals(collcalc, tpiece[i].cordinates) && tpiece[i].exist) {
                    println("bbbb");
                    coll = false;
                  }
                  if (Arrays.equals(collcalc, opiece[i].cordinates) && opiece[i].exist && !Arrays.equals(collcalc, collcord)) {
                    coll = false;
                  } else if (Arrays.equals(collcalc, opiece[i].cordinates)&& Arrays.equals(collcalc, collcord) && opiece[i].exist) {
                    opiece[i].exist = false;
                  }
                }
              }
            }
          }
        }

        for (int k =0; k<collcord.length; k++) {
          if (collcalc[k]-tpiece[piececo].cordinates[k] >0) {
            collcalc[k] = collcalc[k]-1;
            //  println(collcalc[k]);
          }
          if (collcalc[k]-tpiece[piececo].cordinates[k] <0) {
            collcalc[k] = collcalc[k]+1;
            // println(collcalc[k]);
          }
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'K') {
    int rookening = 0;
    for (int k =0; k<demensions; k++) {
      collcalc[k] = collcord[k];
    }
    for (int k =0; k<demensions; k++) {
      if (abs(collcalc[k] - tpiece[piececo].cordinates[k])==1 ||abs(collcalc[k] - tpiece[piececo].cordinates[k])==1) {
        rookening++;
      }
    }
    if (rookening != 0 || !tpiece[piececo].F) {

      for (int i =0; i<tpiece.length; i ++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {   
                if (Arrays.equals(collcalc, tpiece[i].cordinates) && tpiece[i].exist) {
                  coll = false;
                }
              }
            }
          }
        }
      }
    } else if (rookening == 0) {
      int blockpoint = 0;
      for (int i =0; i<tpiece.length; i ++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {   
                int circelcheck =0;
                int circelchecky =0;
                for (int k =0; k<demensions; k++) {
                  if (k <demensions/2) {
                    if (((abs(collcalc[k] -tpiece[i].cordinates[k])==1||abs(collcalc[k] -tpiece[i].cordinates[k])==0)) &&(tpiece[i].name.charAt(1) != 'R'||(tpiece[i].name.charAt(1) == 'R' &&!tpiece[i].F) )&& tpiece[i].exist) {
                      circelcheck++;   
                      println("qqq");
                    }
                  }
                  if (k >=demensions/2) {
                    if (collcalc[k] !=tpiece[i].cordinates[k]) {
                      circelchecky++;
                    }
                  }

                  if (circelcheck ==demensions/2 && circelchecky ==0) {
                    blockpoint++;
                    coll =false;
                  }
                }
              }
            }
          }
        }
      } 
      if (blockpoint ==0) {

        for (int i =0; i<tpiece.length; i ++) {
          if ((i%10000 -2000) <6000) {
            if ((i%1000 -200) <600) {
              if ((i%100 -20) <60) {
                if ((i%10 -2) <6) {   
                  int rookcount =0;
                  for (int k =0; k<demensions; k++) {
                    if (((abs(collcalc[k] -tpiece[i].cordinates[k])==1||abs(collcalc[k] -tpiece[i].cordinates[k])==0)) &&tpiece[i].name.charAt(1) == 'R' &&tpiece[i].exist) {
                      rookcount++;
                    }
                  }

                  if (rookcount ==demensions ) {
                    for (int k =0; k<demensions; k++) {
                      tpiece[i].cordinates[k] =collcalc[k] +(collcalc[k] -tpiece[i].cordinates[k]);
                    }
                    rookcount = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  if (tpiece[piececo].name.charAt(1) == 'Q') {
    int Q_RB = 0;
    for (int k =0; k<demensions; k++) {
      collcalc[k] = collcord[k];
    }
    for (int i=0; i<demensions; i++) {
      if (collcalc[i]-tpiece[piececo].cordinates[i] !=0) {
        Q_RB++;
      }
    }
    if (Q_RB ==1) {
      for (int i =0; i<demensions; i ++) {
        if (abs(collcord[i] - tpiece[piececo].cordinates[i])> 0) {
          while (abs(collcalc[i] - tpiece[piececo].cordinates[i])> 0) {
            for (int j =0; j<tpiece.length; j++) {
              if ((j%10000 -2000) <6000) {
                if ((j%1000 -200) <600) {
                  if ((j%100 -20) <60) {
                    if ((j%10 -2) <6) {     

                      if (Arrays.equals(collcalc, tpiece[j].cordinates) && tpiece[j].exist) {
                        coll = false;
                      }
                      if (Arrays.equals(collcalc, opiece[j].cordinates)&& collcalc[i] != contcord[i] &&opiece[j].exist) {
                        coll = false;
                      }
                    }
                  }
                }
              }
            }
            //  println(collcalc[i]);
            if (collcalc[i]-tpiece[piececo].cordinates[i]>0) {
              collcalc[i]= collcalc[i]-1;
            }
            if (collcalc[i]- tpiece[piececo].cordinates[i]<0) {
              collcalc[i]= collcalc[i]+1;
            }
          }
        }
      }
    } else if (Q_RB >1) {
      for (int j =0; j<demensions; j ++) {
        while (collcalc[0]-tpiece[piececo].cordinates[0] !=0) {
          //  println(collcalc[0]-tpiece[piececo].cordinates[0]);
          for (int i =0; i<tpiece.length; i ++) {
            if ((i%10000 -2000) <6000) {
              if ((i%1000 -200) <600) {
                if ((i%100 -20) <60) {
                  if ((i%10 -2) <6) {   
                    if (Arrays.equals(collcalc, tpiece[i].cordinates) && tpiece[i].exist) {
                      println("bbbb");
                      coll = false;
                    }
                    if (Arrays.equals(collcalc, opiece[i].cordinates) && opiece[i].exist && !Arrays.equals(collcalc, collcord)) {
                      coll = false;
                    } else if (Arrays.equals(collcalc, opiece[i].cordinates)&& Arrays.equals(collcalc, collcord) && opiece[i].exist) {
                      opiece[i].exist = false;
                    }
                  }
                }
              }
            }
          }

          for (int k =0; k<collcord.length; k++) {
            if (collcalc[k]-tpiece[piececo].cordinates[k] >0) {
              collcalc[k] = collcalc[k]-1;
              //  println(collcalc[k]);
            }
            if (collcalc[k]-tpiece[piececo].cordinates[k] <0) {
              collcalc[k] = collcalc[k]+1;
              // println(collcalc[k]);
            }
          }
        }
      }
    }
  }
  if (tpiece[piececo].name.charAt(1) == 'P') {
    int P1= 0;
    int P2 =0;
    for (int k =0; k<demensions; k++) {
      collcalc[k] = collcord[k];
    }
    for (int i=0; i<demensions; i++) {
      if (abs(collcalc[i]-tpiece[piececo].cordinates[i]) ==1) {
        P1++;
      }
    }
    for (int i=0; i<demensions; i++) {
      if (abs(collcalc[i]-tpiece[piececo].cordinates[i]) ==2) {
        P2++;
      }
    }
    if (P1 ==0 &&P2 ==0) {
      coll = false;
    }
    if (P1 ==1) {


      for (int i =0; i<tpiece.length; i ++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {   
                if (Arrays.equals(collcalc, tpiece[i].cordinates) && tpiece[i].exist) {
                  coll =false;
                }
                if (Arrays.equals(collcalc, opiece[i].cordinates) && opiece[i].exist) {
                  coll =false;
                }
              }
            }
          }
        }
      }
    }
    if (P2 ==1) {
      for (int i =0; i<demensions; i ++) {
        if (abs(collcord[i] - tpiece[piececo].cordinates[i])> 0) {
          for (int k =0; k<collcord.length; k++) {
            collcalc[k] = collcord[k];
          }
          while (abs(collcalc[i] - tpiece[piececo].cordinates[i])> 0) {
            for (int j =0; j<tpiece.length; j++) {
              if ((j%10000 -2000) <6000) {
                if ((j%1000 -200) <600) {
                  if ((j%100 -20) <60) {
                    if ((j%10 -2) <6) {     

                      if (Arrays.equals(collcalc, tpiece[j].cordinates) && tpiece[j].exist) {
                        coll = false;
                      }
                      if (Arrays.equals(collcalc, opiece[j].cordinates) &&opiece[j].exist) {
                        coll = false;
                      }
                      if (!tpiece[piececo].F) {
                        coll = false;
                      }
                    }
                  }
                }
              }
            }
            //  println(collcalc[i]);
            if (collcalc[i]-tpiece[piececo].cordinates[i]>0) {
              collcalc[i]= collcalc[i]-1;
            }
            if (collcalc[i]- tpiece[piececo].cordinates[i]<0) {
              collcalc[i]= collcalc[i]+1;
            }
          }
        }
      }
    }
    if (P1 >1) {
      boolean hit =false;
      for (int i =0; i<tpiece.length; i ++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {   
                if (Arrays.equals(collcalc, opiece[i].cordinates) && opiece[i].exist) {
                  hit =true;
                }
              }
            }
          }
        }
      }
      if (!hit) {
        coll = false;
      }
    }
  }

  java.util.Arrays.fill(collcord, 0);
  java.util.Arrays.fill(collcalc, 0);
}
