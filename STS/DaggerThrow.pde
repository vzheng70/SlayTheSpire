public class DaggerThrow extends Card{
  public DaggerThrow(){
    super(1,1,false,"Dagger_Throw");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=9;
      if(super.upgrade)dmg=12;
      theSilent.dealAttackDamage(dmg,target);
      thisEncounter.drawCard();
      thisEncounter.energy-=super.energyCost;
      this.discard();
      thisEncounter.cardSelect=new CardSelectionScreen("Choose a card to discard");
    }
  }
  public void play(){
  }
}
