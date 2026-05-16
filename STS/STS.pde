ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
void setup(){
  background(50);
  size(1080,640);
  PImage pic=loadImage("images/Silent.png");
  theSilent.pic=pic;
  for(int i=0;i<5;i++)deck.add(new Strike());
  thisEncounter=new Encounter(new Enemy[]{new Cultist()});
}
void draw(){
  background(50);
  for(int i=0;i<thisEncounter.hand.size();i++){
    Card card=thisEncounter.hand.get(i);
    card.drawCard((width/2-40)+((i-thisEncounter.hand.size()/2)*100),480);
  }
  theSilent.drawPlayer(180,200);
  drawUI();
}
public void delay(int millis){
  try {
    Thread.sleep(millis);
  }
  catch (InterruptedException e) {
  }
}
public void drawUI(){
  fill(50,255,50);
  triangle(50,550,130,550,90,480);
  fill(255);
  textSize(60);
  text(thisEncounter.energy,75,545);
  fill(30);
  circle(50,600,50);
  circle(1030,600,50);
  fill(255,0,0);
  textSize(40);
  text(thisEncounter.drawPile.size(),40,615);
  text(thisEncounter.discardPile.size(),1020,615);
  fill(40,115,137);
  rect(900,500,100,40);
  fill(255);
  textSize(25);
  text("End Turn",905,510,100,40);
}
