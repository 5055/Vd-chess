import java.util.Arrays; 
int[] coords = {};
String selectP =null;
boolean turn =true;
boolean validcol =false;
float spieceSize = 10;
float pieceSize = spieceSize;
int demensions =4;
int upgradeunit =0;
char upgradetype='W';
float rdemensions =demensions/2;
float tNumpieces = pow( 8, ceil(rdemensions)) ;
int Numpieces =(int) (tNumpieces+tNumpieces*(rdemensions));
boolean schaakSelf = false;
float displx =0;
float disply =0;
int updatenumber = 0;
String type = "K";
boolean coll = true;
boolean selfschaak =true;
boolean schaakrookscheck =true;
boolean schaakmatrookscheck = true;
boolean upgradeP = false;
boolean win = false;
boolean sco = true;
piece[] wpiece; 
piece[] npiece; 
piece[] bpiece;
void setup() {
  size(800, 800); 
  float Numpiecescalc=1;
  for (int i =0; i<demensions/2; i ++) {
    Numpiecescalc = Numpiecescalc/8 *10;
  }
  wpiece =new piece[(int)(Numpieces*Numpiecescalc)];
  bpiece =new piece[(int)(Numpieces*Numpiecescalc)];
  npiece =new piece[(int)(Numpieces*Numpiecescalc)];
  for (int i =0; i<wpiece.length; i ++) {
    if ((i%10000 -2000) <6000) {
      if ((i%1000 -200) <600) {
        if ((i%100 -20) <60) {
          if ((i%10 -2) <6) {
            type ="K";
            int[] cordinate = new int[demensions];
            String tempcord = nf(i, demensions); 
            for (int j =0; j<demensions; j ++) {
              String fillcord =""+ tempcord.charAt(tempcord.length()-j-1);
              int numfillcord = Integer.parseInt(fillcord);

              if ( j <demensions/2) {
                cordinate[j] = numfillcord;
                if ((numfillcord ==0||numfillcord ==7) && type != "R") {
                  type = "R";
                } else if ((numfillcord ==1 ||numfillcord ==6)&& type != "R"&& type != "N") {
                  type = "N";
                } else if ((numfillcord ==2 ||numfillcord ==5) && type != "R"&& type != "N"&& type != "B") {
                  type = "B";
                } else if ((numfillcord ==4) && type != "R"&& type != "N"&& type != "B"&& type != "Q"&& type != "K") {
                  type = "K";
                } else if ((numfillcord ==3) && type != "R"&& type != "N"&& type != "B"&& type != "Q") {
                  type = "Q";
                }
              }

              if ( j ==demensions/2) {
                int fill =demensions/2;
                while (numfillcord >0) {
                  if (numfillcord ==1) {
                    cordinate[fill] = 1;
                    type ="P";
                    numfillcord =numfillcord-1;
                  } else {
                    fill++; 
                    numfillcord = numfillcord-1;
                  }
                }
              }

              wpiece[i] = new piece(color(255, 0, 0), cordinate, 'W' +type, true, true);
            }
          }
        }
      }
    }
  }
  for (int i =0; i<bpiece.length; i ++) {
    if ((i%10000 -2000) <6000) {
      if ((i%1000 -200) <600) {
        if ((i%100 -20) <60) {
          if ((i%10 -2) <6) {
            type ="K";
            int[] cordinate = new int[demensions];
            java.util.Arrays.fill(cordinate, 7);
            String tempcord = nf(i, demensions); 
            for (int j =0; j<demensions; j ++) {
              String fillcord =""+ tempcord.charAt(tempcord.length()-j-1);
              int numfillcord = Integer.parseInt(fillcord);
              if (j<demensions/2) { 
                cordinate[j] = numfillcord;
                if ((numfillcord ==0||numfillcord ==7) && type != "R") {
                  type = "R";
                } else if ((numfillcord ==1 ||numfillcord ==6)&& type != "R"&& type != "N") {
                  type = "N";
                } else if ((numfillcord ==2 ||numfillcord ==5) && type != "R"&& type != "N"&& type != "B") {
                  type = "B";
                } else if ((numfillcord ==4) && type != "R"&& type != "N"&& type != "B"&& type != "Q"&& type != "K") {
                  type = "K";
                } else if ((numfillcord ==3) && type != "R"&& type != "N"&& type != "B"&& type != "Q") {
                  type = "Q";
                }
              } else if ( j ==demensions/2) {
                int fill =demensions/2;
                while (numfillcord >0) {
                  if (numfillcord ==1) {
                    cordinate[fill] = 6;
                    type ="P";
                    numfillcord =numfillcord-1;
                  } else {
                    fill++; 
                    numfillcord = numfillcord-1;
                  }
                }
              }

              bpiece[i] = new piece(color(0, 0, 255), cordinate, 'B' +type, true, true);
            }
          }
        }
      }
    }
  }


  update();
  // println(Numpieces);
  // println(wpiece[70].cordinates);
}
void draw() {
  if (updatenumber < 20) {
    update();
    updatenumber++;
  }
}
void mouseDragged() {
  println(pieceSize);
  updatenumber =0;
  if (displx>0) {
    displx =0;
  }
  if (disply>0) {
    disply =0;
  }
  displx =displx -(pmouseX - mouseX);
  disply =disply -(pmouseY - mouseY);
}

void mouseWheel(MouseEvent event) {
  int nmouseX = (int)(mouseX/100);
  int nmouseY = (int)(mouseY/100);
 // println(nmouseX);
  if(sco){
    sco = false;
  if(-event.getCount()>0 && pieceSize <spieceSize*10 ){
  displx =displx * pow( 10, -event.getCount()) -nmouseX*1000;
  println(displx);
  disply =disply * pow( 10, -event.getCount())- nmouseY*1000;
  pieceSize=pieceSize* 10;
  }
  else  if(-event.getCount()<0&& pieceSize >pow( 10,(2-demensions/2))*10){
    pieceSize=pieceSize/ 10;
    displx = floor((floor(displx/100)*10-4*floor(displx/100))/100)*100;
    disply = floor((floor(disply/100)*10-4*floor(disply/100))/100)*100;
  }
  update();
  sco = true;
}
}
void keyTyped() {
  // println(key);
  if (upgradeP == true) {
    if (upgradetype =='W') {

      if (key == 'Q' ||key == 'R'|| key == 'N' ||key == 'B' ||key == 'q' ||key == 'r'|| key == 'n' ||key == 'b') {

        wpiece[upgradeunit].name = 'W' + str(key).toUpperCase()+ "";
        wpiece[upgradeunit].F = false;
        switchturn();
        upgradeP = false;
        update();
      }
    } else if (upgradetype =='B') {

      if (key == 'Q' ||key == 'R'|| key == 'N' ||key == 'B' ||key == 'q' ||key == 'r'|| key == 'n' ||key == 'b') {
        bpiece[upgradeunit].name = 'B' + str(key).toUpperCase()+ "";
        bpiece[upgradeunit].F = false;
        switchturn();
        upgradeP = false;
        update();
      }
    }
  }
}
