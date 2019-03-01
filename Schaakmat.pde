void schaakmat( piece[] tpiece, piece[] opiece) {
  int kingnum=0;
  int Z =0;



  for (int j =0; j<tpiece.length; j++) {
    if ((j%10000 -2000) <6000) {
      if ((j%1000 -200) <600) {
        if ((j%100 -20) <60) {
          if ((j%10 -2) <6) {  
            int[] Scordinate = new int[demensions];
            for (int i =0; i<demensions; i ++) {
              ////     println(npiece[j].name);
              if (opiece[j].name.charAt(1) == 'K') {

                Scordinate[i] =opiece[j].cordinates[i];
              } else {
                Scordinate[i] =opiece[j].cordinates[i];
              }
            }
            npiece[j] = new piece(color(255, 255, 0), Scordinate, opiece[j].name, opiece[j].exist, opiece[j].F);
            if (npiece[j].name.charAt(1) == 'K') {
              kingnum =j;
            }
          }
        }
      }
    }
  }
  while (Z < pow(3, demensions)) {
    int num = Z; 
    int ret =0 ;
    int factor = 1;   
    if (num >0) {
      while (num >0 ) {
        ret += num % 3 * factor;
        num /= 3;
        factor *= 10;
      }
    }
    String dislocate = nf(ret, demensions);

    for (int j =0; j<tpiece.length; j++) {
      if ((j%10000 -2000) <6000) {
        if ((j%1000 -200) <600) {
          if ((j%100 -20) <60) {
            if ((j%10 -2) <6) {  
              int[] Scordinate = new int[demensions];
              for (int i =0; i<demensions; i ++) {

                if (npiece[j].name.charAt(1) == 'K') {
                  Scordinate[i] =opiece[j].cordinates[i]+Integer.parseInt(str(dislocate.charAt(i)-49));
                  if ( i ==0) {
                  }
                } else {
                  Scordinate[i] =opiece[j].cordinates[i];
                }
              }
              npiece[j] = new piece(color(255, 255, 0), Scordinate, opiece[j].name, opiece[j].exist, opiece[j].F);
              if (npiece[j].name.charAt(1) == 'K') {
              }
            }
          }
        }
      }
    }
    schaakmat2(tpiece, npiece, kingnum); 
    int tempxcalc =0;
    int tempycalc =0;
    for (int i =0; i<demensions/2; i ++) {
      float powercalc = pow(10, i); 
      tempxcalc = tempxcalc + npiece[kingnum].cordinates[i]*((int) powercalc);
      tempycalc = tempycalc + npiece[kingnum].cordinates[i+npiece[kingnum].cordinates.length/2]*((int) powercalc);
    }

    ellipse(tempxcalc*pieceSize + pieceSize/2 + displx, tempycalc*pieceSize +pieceSize/2+ disply, pieceSize, pieceSize);
    //    fill(0);
    //  text(name.charAt(1), tempxcalc*pieceSize +pieceSize/2 + displx, tempycalc*pieceSize +pieceSize+ disply);
    Z++;
  }  
  println(schaakmatcount);
  schaakmatcount = 0;
}
void schaakmat2( piece[] opiece, piece[] npiece, int kingnum) {
  boolean lagstop = true;
  //println(npiece[kingnum].cordinates[0],npiece[kingnum].cordinates[1]);
  int[] countcord = new int[demensions];
  int[] nKcord = new int[demensions];
  int[] tcountcord = new int[demensions];
  boolean outB = false;
  boolean outBcancel = false;
  arrayCopy(npiece[kingnum].cordinates, nKcord); 

  for (int i =0; i<wpiece.length; i++) {
    if ((i%10000 -2000) <6000) {
      if ((i%1000 -200) <600) {
        if ((i%100 -20) <60) {
          if ((i%10 -2) <6) {
            for (int k =0; k<demensions; k++) {
              if (npiece[kingnum].cordinates[k]<0 || npiece[kingnum].cordinates[k]>7) {
                outB = true;
              }
            }
            if ((opiece[i].name.charAt(1) == 'R' ||opiece[i].name.charAt(1) == 'Q')&&opiece[i].exist) {
              for (int k =0; k<demensions; k++) {

                arrayCopy(nKcord, tcountcord); 
                for (int j =0; j<8; j++) {
                  tcountcord[k] =tcountcord[k]+1;
                  if (Arrays.equals(tcountcord, opiece[i].cordinates) && opiece[i].exist &&(opiece[i].name.charAt(1) == 'R'||opiece[i].name.charAt(1) == 'Q' )) {
                    //                 println("ggg");

                    Rookschaakmat(npiece, opiece, kingnum, nKcord, i);
                    if (schaakmatrookscheck) {
                      // println(npiece[kingnum].cordinates[0],npiece[kingnum].cordinates[1],npiece[kingnum].cordinates[2],npiece[kingnum].cordinates[3],npiece[kingnum].cordinates[4],npiece[kingnum].cordinates[5]);
                      //println("sss");
                      outBcancel = true;
                      println(npiece[kingnum].cordinates[0], npiece[kingnum].cordinates[1]);
                      schaakmatcount++;
                    }
                  }
                }
                arrayCopy(nKcord, tcountcord); 
                for (int j =0; j<8; j++) {
                  tcountcord[k] =tcountcord[k]-1;
                  if (Arrays.equals(tcountcord, opiece[i].cordinates) && opiece[i].exist &&(opiece[i].name.charAt(1) == 'R'||opiece[i].name.charAt(1) == 'Q' )) {
                    //                 println("ggg");

                    Rookschaakmat(npiece, opiece, kingnum, nKcord, i);
                    if (schaakmatrookscheck) {
                      // println(npiece[kingnum].cordinates[0],npiece[kingnum].cordinates[1],npiece[kingnum].cordinates[2],npiece[kingnum].cordinates[3],npiece[kingnum].cordinates[4],npiece[kingnum].cordinates[5]);
                      //println("sss");
                      outBcancel = true;
                      println(npiece[kingnum].cordinates[0], npiece[kingnum].cordinates[1]);
                      schaakmatcount++;
                    }
                  }
                }
              }
            }




            if ((opiece[i].name.charAt(1) == 'B'||opiece[i].name.charAt(1) == 'Q' )&&opiece[i].exist) {
              int bcordblock = 0;
              int Bfirstcord= opiece[i].cordinates[0] -npiece[kingnum].cordinates[0];
              for (int k =0; k<demensions; k++) {
                if (abs(Bfirstcord) == abs(opiece[i].cordinates[k] -npiece[kingnum].cordinates[k])) {
                  bcordblock++;
                }
              }
              if (bcordblock == demensions) {
                Bischschaakmat(npiece, opiece, kingnum, nKcord, i);
                if (schaakmatrookscheck) {
                  outBcancel = true;
                  println(npiece[kingnum].cordinates[0], npiece[kingnum].cordinates[1]);
                  schaakmatcount++;
                }
              }
            }




            if ((opiece[i].name.charAt(1) == 'N')&&opiece[i].exist) {
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
                schaakmatcount++;
                println(npiece[kingnum].cordinates[0], npiece[kingnum].cordinates[1]);
              }
            }
          }
        }
      }
    }
  }
  if (outB && !outBcancel) { 
    println(npiece[kingnum].cordinates[0], npiece[kingnum].cordinates[1]);
    //  println(npiece[kingnum].cordinates[0],npiece[kingnum].cordinates[1],npiece[kingnum].cordinates[2],npiece[kingnum].cordinates[3],npiece[kingnum].cordinates[4],npiece[kingnum].cordinates[5]);
    schaakmatcount++;
  }
}
void Rookschaakmat(piece[] npiece, piece[] opiece, int piececo, int[] countcord, int pieceR) {
  schaakmatrookscheck = true;
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
                  schaakmatrookscheck = false;
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
                  //       println("tttt");
                  //     println(npiece[4].cordinates[0],npiece[4].cordinates[1]);
                  schaakmatrookscheck = false;
                }
              }
            }
          }
        }
      }
      countcord[k]= countcord[k]+1;
    }
  }
  //  println(schaakmatrookscheck);
  if (!schaakmatrookscheck) {
  }
}
void Bischschaakmat(piece[] npiece, piece[] opiece, int piececo, int[] countcord, int pieceR) {
  boolean bisblock =true;
  boolean block= false;
  int a = 0;
  while ( a< 8) {
    for (int i =0; i<wpiece.length; i++) {
      if ((i%10000 -2000) <6000) {
        if ((i%1000 -200) <600) {
          if ((i%100 -20) <60) {
            if ((i%10 -2) <6) {
              if ((Arrays.equals(countcord, opiece[i].cordinates) && opiece[i].exist && opiece[i].name.charAt(1) != 'B')|| (Arrays.equals(countcord, npiece[i].cordinates)&& npiece[i].exist && npiece[i].name.charAt(1) != 'K')) {
                bisblock = true;
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
    schaakmatrookscheck = false;
  }
}
