ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
ViewCardScreen cardView=null;
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
  thisEncounter.drawUI();
  thisEncounter.pickHand();
  theSilent.drawPlayer(180,200);
  drawToolBar();
  thisEncounter.drawCardSelection();
  thisEncounter.drawHand();
  viewCards();
  
  
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
  if(cardView!=null){
    if(mouseX>width-50&&mouseX<width&&mouseY>500&&mouseY<550){
      cardView=null;
    }
  }else{
    if(mouseX>900&&mouseX<1000&&mouseY>500&&mouseY<540){
      thisEncounter.endTurn();
    }
    if(mouseX>25&&mouseX<75&&mouseY>575&&mouseY<625){
      cardView=new ViewCardScreen(thisEncounter.drawPile);
    }
    if(mouseX>1005&&mouseX<1055&&mouseY>575&&mouseY<625){
      cardView=new ViewCardScreen(thisEncounter.discardPile);
    }
    if(mouseX>width-80&&mouseX<width-40&&mouseY>5&&mouseY<45){
      cardView=new ViewCardScreen(deck);
    }
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
public void mouseWheel(MouseEvent event){
  if(cardView!=null){
    cardView.scroll+=event.getCount()*10;
  }
}
public void viewCards(){
  if (cardView!=null){
    cardView.viewCards();
  }
}
public void drawToolBar(){
  fill(100);
  rect(0,0,width,50);
  fill(30);
  circle(width-60,25,40);
  fill(255,0,0);
  textSize(30);
  text(deck.size(),width-60,35);
}
      
    
  
