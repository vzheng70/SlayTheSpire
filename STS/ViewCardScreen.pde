public class ViewCardScreen{
  private ArrayList<Card> cards;
  private int scroll=0;
  public ViewCardScreen(ArrayList<Card> cards){
    this.cards=cards;
  }
  public void viewCards(){
    if(scroll>0)scroll=0;
    fill(20,70);
    rect(0,0,width,height);
    fill(255,0,0);
    rect(width-50,500,50,50);
    int y=-170+scroll;
    int x=width/5;
    for(int i=0;i<cards.size();i++){
      if(i%5==0){
        x=width/5;
        y+=200;
      }
      Card c=cards.get(i);
      c.drawCard(x,y);
      x+=130;
    }
  }
}
