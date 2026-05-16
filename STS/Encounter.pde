public class Encounter{
  private ArrayList<Card> drawPile,hand,discardPile;
  private int energy,turnNum;
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
    for(Card card:hand)
      card.discard();
    for(Enemy e:enemies){
      e.playTurn();
    }
    startTurn();
  }
}
