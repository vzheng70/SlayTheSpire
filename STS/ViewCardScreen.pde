public class ViewCardScreen{
  private ArrayList<Card> cards;
  private float y=0;
  public ViewCardScreen(ArrayList<Card> cards){
    this.cards=cards;
  }
  public void viewCards(){
    if(y>0)y=0;
    fill(20,70);
    rect(0,0,width,height);
    for(
}
