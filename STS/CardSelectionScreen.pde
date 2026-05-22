public class CardSelectionScreen{
  private String txt;
  private Card cardSelected=null;
  public CardSelectionScreen(String txt){
    this.txt=txt;
  }
  public void discardSelectedCard(){
    if(cardSelected!=null)
      cardSelected.discard();
  }
}
