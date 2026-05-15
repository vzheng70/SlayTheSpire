public class Encounter{
  private ArrayList<Card> drawPile,hand,discardPile;
  private int energy,turnNum;
  Enemy[] enemies;
  public Encounter(Enemy[] enemyLst){
    enemies=enemyLst;
    energy=3;
    turnNum=0;
    ArrayList<Card> tempDeck=deck.clone();
    while(tempDeck.size()>0){
      drawPile.add(tempDeck.remove(random()*tempDeck.size())
}
