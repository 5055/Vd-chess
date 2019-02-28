 void schaakmat( piece[] tpiece, piece[] opiece) {
      int[] countcord = new int[demensions];
      int[] nKcord = new int[demensions];
      int kingnum=0;
      
      
      
            for (int j =0; j<tpiece.length; j++) {
        if ((j%10000 -2000) <6000) {
          if ((j%1000 -200) <600) {
            if ((j%100 -20) <60) {
              if ((j%10 -2) <6) {  
                int[] Scordinate = new int[demensions];
                for (int i =0; i<demensions; i ++) {

                  Scordinate[i] =opiece[j].cordinates[i];
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
      
      
      
      
      
}
