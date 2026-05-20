ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
//boolean cardSelected=false;
void setup(){
  background(50);
  size(1080,640);
  PImage pic=loadImage("images/Silent.png");
  theSilent.pic=pic;
  for(int i=0;i<5;i++){
    deck.add(new Strike());
    deck.add(new Defend());
  }
  deck.add(new Neutralize());
  deck.add(new Survivor());
  thisEncounter=new Encounter(new Enemy[]{new Cultist(720,200)});
  textAlign(CENTER);
}
void draw(){
  background(50);
  thisEncounter.showEnemies();
  thisEncounter.drawHand();
  thisEncounter.pickHand();
  theSilent.drawPlayer(180,200);
  
  thisEncounter.drawUI();
  if(theSilent.HP<=0){
    fill(255,0,0);
    textSize(100);
    text("YOU DIED",width/3,height/2);
    noLoop();
  }
}
public void delay(int millis){
  try {
    Thread.sleep(millis);
  }
  catch (InterruptedException e) {
  }
}
public void mousePressed(){
  if(mouseX>900&&mouseX<1000&&mouseY>500&&mouseY<540){
    thisEncounter.endTurn();
  }
}
public void mouseReleased(){
  Card card=thisEncounter.selectedCard;
  if(card!=null){
    if(card.cardType>1&&mouseY<450){
      //print("played");
      card.play();
    }else{
      if(thisEncounter.selectedEnemy!=null)
        card.play(thisEncounter.selectedEnemy);
    }
  }
  thisEncounter.selectedCard=null;
}
      
    
  
