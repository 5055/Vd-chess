void win(piece[] opiece) {
  win = true;
  fill(255);
  rect(50, 50, width-100, height-100);
  String winText =""+ opiece[0].name.charAt(0)+ "wins";
  if ( opiece[0].name.charAt(0) =='W') {
    winText = "Red Wins";
  }
  if ( opiece[0].name.charAt(0) =='B') {
    winText = "Blue Wins";
  }

  textSize(64);
  fill(0, 102, 153);
  textAlign(CENTER);
  text(winText, width/2, height/2);
}
