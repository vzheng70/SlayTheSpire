public class ViewCardScreen{
  private ArrayList<Card> cards;
  private int scroll=0;
  public ViewCardScreen(ArrayList<Card> cards){
    this.cards=cards;
  }
  public void viewCards(){
    if(scroll<0)scroll=0;
    fill(20,70);
    rect(0,0,width,height);
    fill(255,0,0);
    rect(width-50,500,50,50);
    fill(255);
    quad(width-40,505,width-5,540,width-10,545,width-45,510);
    quad(width-40,545,width-45,540,width-10,505,width-5,510);
    int y=-170-scroll;
    int x=width/5;
    for(int i=0;i<cards.size();i++){
      if(i%5==0){
        x=width/5;
        y+=200;
      }
      Card c=cards.get(i);
      c.drawCard(x,y,130);
      x+=130;
    }
  }
}
