void schaak( piece[] tpiece, piece[] opiece, int piececo, int[] Kcords) {
      int[] countcord = new int[demensions];
      int[] nKcord = new int[demensions];
      
      int kingnum=0;
      schaakrookscheck =true;
      for (int j =0; j<tpiece.length; j++) {
        if ((j%10000 -2000) <6000) {
          if ((j%1000 -200) <600) {
            if ((j%100 -20) <60) {
              if ((j%10 -2) <6) {  
                int[] Scordinate = new int[demensions];
                for (int i =0; i<demensions; i ++) {

                  Scordinate[i] =tpiece[j].cordinates[i];
                }
                npiece[j] = new piece(color(255, 255, 0), Scordinate, tpiece[j].name, tpiece[j].exist, tpiece[j].F);
                if (npiece[j].name.charAt(1) == 'K') {
                  kingnum =j;
                }
              }
            }
          }
        }
      }
      arrayCopy(Kcords, npiece[piececo].cordinates );

      arrayCopy(npiece[piececo].cordinates, countcord);
      arrayCopy(npiece[kingnum].cordinates, nKcord); 
      //  println(npiece[0].cordinates);
      /*  if (Arrays.equals(npiece[piececo].cordinates, countcord)) {
       println("g");
       }*/
      int[] tcountcord = new int[demensions];
      for (int i =0; i<wpiece.length; i++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {
                if (opiece[i].name.charAt(1) == 'R' ||opiece[i].name.charAt(1) == 'Q' ) {
                  for (int k =0; k<demensions; k++) {
                    arrayCopy(nKcord, tcountcord); 
                    for (int j =0; j<8; j++) {
                      tcountcord[k] =tcountcord[k]+1;
                      if (Arrays.equals(tcountcord, opiece[i].cordinates) && opiece[i].exist &&(opiece[i].name.charAt(1) == 'R'||opiece[i].name.charAt(1) == 'Q' )) {

                        Rookschaak(npiece, opiece, kingnum, nKcord, i);
                        if (schaakrookscheck) {
                          selfschaak = false;
                          println(selfschaak);
                        }
                      }
                    }
                    arrayCopy(nKcord, tcountcord); 
                    for (int j =0; j<8; j++) {
                      tcountcord[k] =tcountcord[k]-1;
                      if (Arrays.equals(tcountcord, opiece[i].cordinates) && opiece[i].exist &&(opiece[i].name.charAt(1) == 'R'||opiece[i].name.charAt(1) == 'Q' )) {
                        //           println("ggg");
                        Rookschaak(npiece, opiece, kingnum, nKcord, i);
                        if (schaakrookscheck) {
                          selfschaak = false;
                        }
                      }
                    }
                  }
                }
                if (opiece[i].name.charAt(1) == 'B'||opiece[i].name.charAt(1) == 'Q' ) {
                  int bcordblock = 0;
                  int Bfirstcord= opiece[i].cordinates[0] -npiece[kingnum].cordinates[0];
                  for (int k =0; k<demensions; k++) {
                    if (abs(Bfirstcord) == abs(opiece[i].cordinates[k] -npiece[kingnum].cordinates[k])) {
                      bcordblock++;
                    }
                  }
                  if (bcordblock == demensions) {
                    Bischschaak(npiece, opiece, kingnum, nKcord, i);
                    if (schaakrookscheck) {
                      selfschaak = false;
                    }
                  }
                }
                if (opiece[i].name.charAt(1) == 'N') {
                  int N1 =0;
                  int N2 = 0;
                  for (int k =0; k<demensions; k++) {
                    if ( abs(opiece[i].cordinates[k]- npiece[kingnum].cordinates[k]) == 2) {
                      N2++;
                    }
                    if ( abs(opiece[i].cordinates[k]- npiece[kingnum].cordinates[k]) == 1) {
                      N1++;
                    }
                  }
                  if (N1 == demensions-1 && N2 ==1) {
                    selfschaak = false;
                  }
                }
                if (opiece[i].name.charAt(1) =='P') {
                  int PX =0;
                  int PY = 0;
                  for (int k =0; k<demensions; k++) {
                    if (( abs(opiece[i].cordinates[k]- npiece[kingnum].cordinates[k]) == 1)&& k < demensions/2) {

                      PX++;
                    }
                    if ( (opiece[i].cordinates[k]- npiece[kingnum].cordinates[k]) == 1 && k >=demensions/2 && npiece[i].name.charAt(0) =='W') {
                      PY++;
                    }
                    if ( (opiece[i].cordinates[k]- npiece[kingnum].cordinates[k]) == -1 && k >=demensions/2 && npiece[i].name.charAt(0) =='B') {
                      PY++;
                    }

                    if ( PX == demensions/2 && PY ==1) {
                      println("zzz");
                      selfschaak = false;
                    }
                  }
                }
              }
            }
          }
        }
      }
    
  
}
void Rookschaak(piece[] npiece, piece[] opiece, int piececo, int[] countcord, int pieceR) {
  boolean block = false;
  for (int k =0; k<demensions; k++) {
    while (countcord[k] -opiece[pieceR].cordinates[k] >0) {
      for (int i =0; i<wpiece.length; i++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {
                if ((Arrays.equals(countcord, opiece[i].cordinates) && opiece[i].exist)|| (Arrays.equals(countcord, npiece[i].cordinates)&& npiece[i].exist && npiece[i].name.charAt(1) != 'K')) {
                  //         println("aa");
                  schaakrookscheck = false;
                }
              }
            }
          }
        }
      }
      countcord[k]= countcord[k]-1;
    }

    while (countcord[k] -opiece[pieceR].cordinates[k] <0) {
      for (int i =0; i<wpiece.length; i++) {
        if ((i%10000 -2000) <6000) {
          if ((i%1000 -200) <600) {
            if ((i%100 -20) <60) {
              if ((i%10 -2) <6) {
                if ((Arrays.equals(countcord, opiece[i].cordinates) && opiece[i].exist)|| (Arrays.equals(countcord, npiece[i].cordinates)&& npiece[i].exist && npiece[i].name.charAt(1) != 'K')) {
                  //         println("tttt");
                  schaakrookscheck = false;
                }
              }
            }
          }
        }
      }
      countcord[k]= countcord[k]+1;
    }
  }
}
void Bischschaak(piece[] npiece, piece[] opiece, int piececo, int[] countcord, int pieceR) {
  boolean block= false;
  int a = 0;
  while ( a< 8) {
    for (int i =0; i<wpiece.length; i++) {
      if ((i%10000 -2000) <6000) {
        if ((i%1000 -200) <600) {
          if ((i%100 -20) <60) {
            if ((i%10 -2) <6) {
              if ((Arrays.equals(countcord, opiece[i].cordinates) && opiece[i].exist && opiece[i].name.charAt(1) != 'B')|| (Arrays.equals(countcord, npiece[i].cordinates)&& npiece[i].exist && npiece[i].name.charAt(1) != 'K')) {
                block = true;
                println(opiece[i].name);
              }
            }
          }
        }
      }
    }
    for (int k =0; k<demensions; k++) {
      if (countcord[k]-opiece[pieceR].cordinates[k] <=0) {
        countcord[k]++;
      }
      if (countcord[k]-opiece[pieceR].cordinates[k] >= 0) {
        countcord[k]--;
      }
    }
    a++;
  }
  if (block == true) {
    schaakrookscheck = false;
  }
}
