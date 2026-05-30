import java.util.*;
ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
ViewCardScreen cardView=null;
CardRewardScreen cardRewards=null;
Rest currentRest=null;
Map currentMap;
int floorNum=0;
int fightNum=4;
ArrayList<String> easyPool=new ArrayList<>(Arrays.asList("Cultist","Jaw Worm","Fuzzy Wurm Crawler","Slimes"));
ArrayList<String> hardPool=new ArrayList<>(Arrays.asList("Slaver","Rats","Big Slime","Cultist&Slime","Small Slimes"));
ArrayList<String> elitePool=new ArrayList<>(Arrays.asList("Lagavulin","Sentries","Skulking Colony"));
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
  //deck.add(new LegSweep());
  //deck.add(new Tracking());
  currentMap=new Map();
  
  textAlign(CENTER);
}
void draw(){
  background(50);
  
  if(thisEncounter!=null){
    thisEncounter.drawEncounter();
    if(thisEncounter.finished){
      if(thisEncounter.elite)
        cardRewards=new CardRewardScreen(true);
      else
        cardRewards=new CardRewardScreen();
      thisEncounter=null;      
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
        else
          startHardEncounter();
        fightNum++;        
      }else if(next.type==3){
        currentRest=new Rest();
      }else if(next.type==4){
        startEliteEncounter();
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
  //selector="Slimes";
  if(selector.equals("Cultist"))
    thisEncounter=new Encounter(new Enemy[]{new Cultist(720,200)});
  else if(selector.equals("Jaw Worm"))
    thisEncounter=new Encounter(new Enemy[]{new JawWorm(720,300)});
  else if(selector.equals("Fuzzy Wurm Crawler"))
    thisEncounter=new Encounter(new Enemy[]{new WurmCrawler(720,250)});
  else if(selector.equals("Slimes"))
    thisEncounter=new Encounter(new Enemy[]{new AcidSlimeS(620,300),new SpikeSlimeM(770,250)});
    
}
public void startHardEncounter(){
  String selector=hardPool.remove((int)(Math.random()*hardPool.size()));
  selector="Big Slime";
  if(selector.equals("Slaver"))
    thisEncounter=new Encounter(new Enemy[]{new Slaver(720,200)});
  else if(selector.equals("Rats"))
    thisEncounter=new Encounter(new Enemy[]{new FungalBeast(570,250),new FungalBeast(820,250)});
  else if(selector.equals("Big Slime"))
    thisEncounter=new Encounter(new Enemy[]{new DeadEnemy(),new SpikeSlimeL(620,200),new DeadEnemy()});
  else if(selector.equals("Small Slimes"))
    thisEncounter=new Encounter(new Enemy[]{new SpikeSlimeS(520,300),new SpikeSlimeS(620,290),new AcidSlimeS(720,310),new SpikeSlimeS(820,305),new AcidSlimeS(920,300),});
  else if(selector.equals("Cultist&Slime"))
    thisEncounter=new Encounter(new Enemy[]{new AcidSlimeS(620,300),new Cultist(770,200)});
}
public void startEliteEncounter(){
  String selector=elitePool.get((int)(Math.random()*elitePool.size()));
 // selector="Sentries";
  if(selector.equals("Lagavulin"))
    thisEncounter=new Encounter(new Enemy[]{new Lagavulin(720,120)},true);
  else if(selector.equals("Sentries")){
    Enemy sentry2=(new Sentry(670,200));
    sentry2.move=1;
    thisEncounter=new Encounter(new Enemy[]{new Sentry(520,200),sentry2,new Sentry(820,200)},true);
  }else if(selector.equals("Skulking Colony"))
    thisEncounter=new Encounter(new Enemy[]{new SkulkingColony(720,120)},true);
  
}
public void mouseReleased(){
  if(thisEncounter!=null){
    Card card=thisEncounter.selectedCard;
    if(card!=null){
      if(thisEncounter.selectedEnemy!=null)
          card.play(thisEncounter.selectedEnemy);
      else if(mouseY<450){
        card.play();
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
  image(loadImage("../images/Map.png"),width-165,10,30,30);
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
  
