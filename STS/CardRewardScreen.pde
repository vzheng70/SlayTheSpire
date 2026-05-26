public class CardRewardScreen{
  private ArrayList<Card> cardPool=new ArrayList<Card>(Arrays.asList(new BladeDance(),new BackFlip(),new PoisonStab()));
  private Card[] cardReward=new Card[3];
  private boolean seeReward=false;
  public CardRewardScreen(){
    for(int i=0;i<cardReward.length;i++){
      cardReward[i]=cardPool.remove((int)(Math.random()*cardPool.size()));
    }
  }
  public void drawCardReward(){
    if(seeReward){
      for(int i=0;i<cardReward.length;i++){
        Card card=cardReward[i];
        int cardX=(width/2-60)+((i-1)*120);
        card.drawCard(cardX,480,120);
      }
    }else {
      fill(100);
      rect(width/2-150,height/2-150,300,300);
      if(cardReward!=null){
        fill(150);
        rect(width/2-120,height/2-120,240,50);
      }
    }
  }
}
        
