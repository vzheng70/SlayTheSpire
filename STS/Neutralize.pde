public class Neutralize extends Card{
  public Neutralize(){
    super(0,1,false,"Deal 3 damage\nApply 1 weak");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=3;
      if(super.upgrade)dmg=4;
      dmg=theSilent.calcAttackDamage(dmg,target);
      //print(dmg);
      target.takeDamage(dmg);
      target.recieveDebuff(0,1);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
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
