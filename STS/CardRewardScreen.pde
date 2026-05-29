public class CardRewardScreen{
  private ArrayList<Card> cardPool=new ArrayList<Card>(Arrays.asList(new BladeDance(),new BackFlip(),new PoisonStab(),new Acrobatics(),new DeadlyPoison(),new DaggerThrow(),
  new SuckerPunch(),new InfiniteBlades(),new Accuracy(),new Footwork(),new NoxiousFumes(),new SneakyStrike(),new Deflect(),new LegSweep(),new CalcGamba(),new CrippleCloud()));
  private Card[] cardReward=new Card[3];
  private boolean seeReward=false;
  public CardRewardScreen(){
    for(int i=0;i<cardReward.length;i++){
      cardReward[i]=cardPool.remove((int)(Math.random()*cardPool.size()));
    }
  }
  public void drawCardReward(){
    //print(seeReward);
    if(seeReward){
      for(int i=0;i<cardReward.length;i++){
        Card card=cardReward[i];
        int cardX=(width/2-100)+((i-1)*200);
        if(checkMouse(cardX,cardX+200,height/2-125,height/2+125))
          card.drawCard(cardX,height/2-125,210);
        else
          card.drawCard(cardX,height/2-125,200);
      }
      fill(40,115,137);
      rect(width/2-100,height/2+175,200,50);
      fill(255);
      textSize(50);
      text("Skip",width/2,height/2+215);
    }else {
      fill(100);
      rect(width/2-150,height/2-150,300,300);
      if(cardReward!=null){
        fill(150);
        rect(width/2-120,height/2-120,240,50);
      }
      drawProceedArrow();
    }
  }
  public void addCard(){
    if(mousePressed&&checkMouse(width/2-100,width/2+100,height/2+175,height/2+225)){
      seeReward=false;
      return;
    }
    for(int i=0;i<cardReward.length;i++){
        Card card=cardReward[i];
        int cardX=(width/2-100)+((i-1)*200);
        if(mousePressed&&checkMouse(cardX,cardX+200,height/2-125,height/2+125)){
          deck.add(card);
          seeReward=false;
          cardReward=null;
          return;
        }
      }
  }
}
        
