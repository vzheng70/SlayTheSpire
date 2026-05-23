public class Encounter{
  private ArrayList<Card> drawPile,hand,discardPile;
  private int energy,turnNum;
  private Enemy selectedEnemy;
  private Card selectedCard=null;
  private CardSelectionScreen cardSelect=null;
  private Enemy[] enemies;
  public Encounter(Enemy[] enemyLst){
    theSilent.reset();
    enemies=enemyLst;
    turnNum=0;
    drawPile=new ArrayList<Card>();
    hand=new ArrayList<Card>();
    discardPile=new ArrayList<Card>();
    ArrayList<Card> tempDeck=new ArrayList<Card>();
    for(Card card:deck){
      tempDeck.add(card);
    }
    while(tempDeck.size()>0){
      drawPile.add(tempDeck.remove((int)(Math.random()*tempDeck.size())));
    }
    startTurn();
  }
  public void startTurn(){
    turnNum++;
    energy=3;
    theSilent.startPlayerTurn();
    for(int i=0;i<5;i++){
      if(drawPile.size()==0){
        reshuffle();
      }
      //delay(200);
      hand.add(drawPile.remove(drawPile.size()-1));
      //drawHand();
    }
  }
  public void reshuffle(){
    while(discardPile.size()>0){
      drawPile.add(discardPile.remove((int)(Math.random()*discardPile.size())));
    }
  }
  public void endTurn(){
    //println("turn end");
    while(hand.size()>0)
      hand.get(0).discard();
    for(Enemy e:enemies){
      if(!e.dead)
        e.playTurn();
    }
    selectedCard=null;
    startTurn();
  }
  
  public void showEnemies(){
      boolean selected=false;
      for(int i=0;i<enemies.length;i++){
        Enemy e=enemies[i];
        if(!e.dead){
          if(mouseX>e.x&&mouseX<e.x+e.enemyWidth&&mouseY>e.y&&mouseY<e.y+e.enemyHeight){
            selectedEnemy=e;
            selected=true;
          }
          
          e.drawEnemy();
        }
      }
      if (!selected)
        selectedEnemy=null;    
  }
  public void pickHand(){
    if(cardView==null){
      boolean selected=false;
      for(int i=0;i<hand.size();i++){
        Card card=hand.get(i);
        //card.drawCard((width/2-40)+((i-hand.size()/2)*100),480);
        int cardX=(width/2-40)+((i-hand.size()/2)*100);
        if(mouseX>cardX&&mouseX<cardX+100&&mouseY>480&&mouseY<640&&!mousePressed){
          selectedCard=card;
          selected=true;
        }
      }
      if (!selected&&!mousePressed)
        selectedCard=null;
      if(selectedCard!=null&&mousePressed){
        fill(0);
        line((width/2)+((hand.indexOf(selectedCard)-hand.size()/2)*100),500,mouseX,mouseY);
      }
    }
  }
  public void drawHand(){
    for(int i=0;i<hand.size();i++){
      Card card=hand.get(i);
      int cardX=(width/2-40)+((i-hand.size()/2)*100);
      card.drawCard(cardX,480);
    }
  }
  public void drawCardSelection(){
    if(cardSelect!=null){
      fill(20,50);
      rect(0,0,width,height);
      fill(255);
      textSize(100);
      text(cardSelect.txt,width/2,height/3);
      if(selectedCard!=null&&mousePressed){
        cardSelect.cardSelected=selectedCard;
        cardSelect.discardSelectedCard();
        cardSelect=null;
      }
    }
  }
  public void drawUI(){
    fill(50,255,70);
    triangle(50,550,130,550,90,480);
    fill(255);
    textSize(60);
    text(energy,90,545);
    fill(30);
    circle(50,600,50);
    circle(1030,600,50);
    fill(255,0,0);
    textSize(40);
    text(drawPile.size(),50,615);
    text(discardPile.size(),1030,615);
    fill(40,115,137);
    rect(900,500,100,40);
    fill(255);
    textSize(25);
    text("End Turn",900,510,100,40);
  }
}
