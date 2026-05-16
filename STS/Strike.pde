public class Strike extends Card{
  public Strike(){
    super(1,1,false,"Deal 6 damage");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=6;
      if(super.upgrade)dmg=9;
      dmg=theSilent.calcAttackDamage(dmg,target);
      target.takeDamage(dmg);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void drawCard(int x,int y){
    fill(255);
    rect(x,y,100,160);
    fill(0);
    text(super.text,x+10,y+80);
  }
}
