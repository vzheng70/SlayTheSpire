import java.util.*;
ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
ViewCardScreen cardView=null;
CardRewardScreen cardRewards=null;
Rest currentRest=null;
Map currentMap;
int floorNum=0;
int fightNum=0;
ArrayList<String> easyPool=new ArrayList<>(Arrays.asList("Cultist","Jaw Worm","Fuzzy Wurm Crawler"));
void setup(){
  background(50);
  size(1080,640);
  PImage pic=loadImage("../images/Silent.png");
  theSilent.pic=pic;
  noStroke();
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
    thisEncounter.drawEncounter();
    if(thisEncounter.finished){
      thisEncounter=null;
      cardRewards=new CardRewardScreen();
    }
  }
  if(currentRest!=null)
    currentRest.drawRest();
  drawCardReward();

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

public void mousePressed(){
  if(cardView!=null){
    if(checkMouse(width-50,width,500,550)){
      cardView=null;
    }
  }else if(checkMouse(width-80,width-40,5,45)){
    cardView=new ViewCardScreen(deck);
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
      }
    }
  }else if(currentMap.mapOpened){
    Node next=currentMap.nodes[floorNum];
    if(checkMouse((int)next.location.x,(int)next.location.x+20,(int)next.location.y-currentMap.scroll,(int)next.location.y-currentMap.scroll+20)){
      cardRewards=null;
      currentMap.mapOpened=false;
      currentRest=null;
      thisEncounter=null;
      if(next.type==1){
        if(fightNum<3)
          startEasyEncounter();
        fightNum++;        
      }else if(next.type==3){
        currentRest=new Rest();
      }
      floorNum++;

    }
    if(checkMouse(width-170,width-130,5,45)){
       currentMap.mapOpened=false;
    }
  }else if(cardRewards!=null){
    if(!cardRewards.seeReward){
      if(checkMouse(width/2-120,width/2+120,height/2-120,height/2-70)&&cardRewards.cardReward!=null){
        delay(100);
        cardRewards.seeReward=true;
      }
    }
    if(checkMouse(width-170,width-130,5,45)||checkMouse(800,1000,375,500)){
        currentMap.mapOpened=true;
    }
  }else if(currentRest!=null){
    if(!currentRest.rested){
      if(checkMouse(width/2-300,width/2-100,height/2-120,height/2-20)){
        theSilent.rest();
        currentRest.rested=true;
      }else if(checkMouse(width/2+100,width/2+300,height/2-120,height/2-20)){
        ArrayList<Card> unupgraded=new ArrayList<Card>();
        for(Card c:deck){
          if(!c.upgrade)
            unupgraded.add(c);
        }
        delay(100);
        cardView=new UpgradeCardScreen(unupgraded);
        currentRest.rested=true;
      }
    }else if(checkMouse(width-170,width-130,5,45)||checkMouse(800,1000,375,500)){
        currentMap.mapOpened=true;
    }    
  }else{
    if(checkMouse(width-170,width-130,5,45)){
       currentMap.mapOpened=true;
    }
  }
}
public void startEasyEncounter(){
  String selector=easyPool.remove((int)(Math.random()*easyPool.size()));
  if(selector.equals("Cultist"))
    thisEncounter=new Encounter(new Enemy[]{new Cultist(720,200)});
  else if(selector.equals("Jaw Worm"))
    thisEncounter=new Encounter(new Enemy[]{new JawWorm(720,300)});
  else if(selector.equals("Fuzzy Wurm Crawler"))
    thisEncounter=new Encounter(new Enemy[]{new WurmCrawler(720,250)});
    
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
public void drawCardReward(){
  if(cardRewards!=null){
    cardRewards.drawCardReward();
    if(cardRewards.seeReward){
      cardRewards.addCard();
    }
  }
}
public void viewCards(){
  if (cardView!=null){
    cardView.viewCards();
  }
}
public void drawProceedArrow(){
  fill(255,0,0);
  rect(800,400,150,75);
  triangle(950,375,950,500,1000,437);
  fill(0);
  textSize(50);
  text("Proceed",890,455);
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
  fill(242,224,159);
  text(floorNum,width/2,35);
  fill(232,12,12);
  text(theSilent.HP+"/"+theSilent.maxHP,120,35);
}
public boolean checkMouse(int minX,int maxX,int minY,int maxY){
  return mouseX>minX&&mouseX<maxX&&mouseY>minY&&mouseY<maxY;
}

public void delay(int millis){
  try {
    Thread.sleep(millis);
  }
  catch (InterruptedException e) {
  }
}      
    
  
