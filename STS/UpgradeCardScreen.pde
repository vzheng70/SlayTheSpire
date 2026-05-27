public class UpgradeCardScreen extends ViewCardScreen{
  public UpgradeCardScreen(ArrayList<Card> cards){
    super(cards);
  }
  @Override
  public void viewCards(){
    if(super.scroll<0)super.scroll=0;
    fill(20,70);
    rect(0,0,width,height);
    fill(255,0,0);
    rect(width-50,500,50,50);
    int y=-170-super.scroll;
    int x=width/5;
    for(int i=0;i<super.cards.size();i++){
      if(i%5==0){
        x=width/5;
        y+=200;
      }
      Card c=super.cards.get(i);
      
      if(checkMouse(x,x+130,y,y+163)){
        c.drawCard(x,y,140);
        if(mousePressed){
          c.upgrade();
          cardView=null;
        }
      }else{
        c.drawCard(x,y,130);
      }
      x+=130;
    }    
  }
    
}
