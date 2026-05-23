ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
ViewCardScreen cardView=null;
//boolean cardSelected=false;
Map currentMap;
int floorNum=0;
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
  currentMap=new Map();
  
  textAlign(CENTER);
}
void draw(){
  background(50);
  
  if(thisEncounter!=null){
    thisEncounter.showEnemies();  
    thisEncounter.pickHand();
    theSilent.drawPlayer(180,200);
    thisEncounter.drawCardSelection();
    thisEncounter.drawHand();
    thisEncounter.drawUI();
  }
  currentMap.viewMap();
  drawToolBar();
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
    if(checkMouse(width-50,width,500,550)){
      cardView=null;
    }
  }else if(thisEncounter!=null){
    if(checkMouse(width-170,width-130,5,45)){
        if(currentMap.mapOpened)
          currentMap.mapOpened=false;
        else
          currentMap.mapOpened=true;
      }
    if(!currentMap.mapOpened){
      if (thisEncounter.cardSelect==null){
        if(checkMouse(900,1000,500,540)){
          thisEncounter.endTurn();
        }
        if(checkMouse(25,75,575,625)){
          cardView=new ViewCardScreen(thisEncounter.drawPile);
        }
        if(checkMouse(1005,1055,575,625)){
          cardView=new ViewCardScreen(thisEncounter.discardPile);
        }
        if(checkMouse(width-80,width-40,5,45)){
          cardView=new ViewCardScreen(deck);
        }
      }
    }
  }else if(currentMap.mapOpened){
    Node next=currentMap.nodes[floorNum];
    if(checkMouse((int)next.location.x,(int)next.location.x+20,(int)next.location.y-currentMap.scroll,(int)next.location.y-currentMap.scroll+20)){
      thisEncounter=new Encounter(new Enemy[]{new Cultist(720,200)});
      currentMap.mapOpened=false;
    }
  }
}
public void mouseReleased(){
  if(thisEncounter!=null){
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
}
public void mouseWheel(MouseEvent event){
  if(cardView!=null){
    cardView.scroll+=event.getCount()*10;
  }
  if(currentMap.mapOpened){
    currentMap.scroll+=event.getCount()*10;
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
  fill(30);
  circle(width-150,25,40);
}
public boolean checkMouse(int minX,int maxX,int minY,int maxY){
  return mouseX>minX&&mouseX<maxX&&mouseY>minY&&mouseY<maxY;
}
      
    
  
