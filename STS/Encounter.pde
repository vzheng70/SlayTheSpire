public class Encounter{
  private ArrayList<Card> drawPile,hand,discardPile;
  private int energy,turnNum;
  private Enemy selectedEnemy;
  private Card selectedCard;
  Enemy[] enemies;
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
      hand.add(drawPile.remove(drawPile.size()-1));
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
  public Card cardSelection(String txt){
    while(true){
      fill(255);
      textSize(50);
      text(txt,width/2,height/3);
      for(int i=0;i<hand.size();i++){
        Card card=hand.get(i);
        int cardX=(width/2-40)+((i-thisEncounter.hand.size()/2)*100);
        if(mouseX>cardX&&mouseX<cardX+100&&mouseY>480&&mouseY<640&&mousePressed){
          return card;
        }
      }
    }
    //return hand.get(0);
  }
}
