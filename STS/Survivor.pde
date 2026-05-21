public class Survivor extends Card{
  public Survivor(){
    super(1,2,false,"Gain 8 block\n discard 1 card");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.gainBlock(8);
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
  public void drawCard(int x,int y){
    if(thisEncounter.selectedCard==this)
      fill(255,230,230);
    else
      fill(255);
    if(thisEncounter.selectedCard==this)
      y-=10;
    rect(x,y,100,160);
      fill(0);
    textSize(13);
    text(super.text,x+10,y+80,80,80);
  }
}
