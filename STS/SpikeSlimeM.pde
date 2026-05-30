public class SpikeSlimeM extends Enemy{
  public SpikeSlimeM(int x,int y){
    super(34,new String[]{"Lick","Tackle"},"../images/Medium_Spike_Slime.png",x,y,150,120);
  }
  public SpikeSlimeM(int x,int y,int HP){
    super(HP,new String[]{"Lick","Tackle"},"../images/Medium_Spike_Slime.png",x,y,150,120);
    super.move=(int)(Math.random()*2);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Lick")){
      theSilent.frail+=2;
    }else if(currentMove.equals("Tackle")){
      int dmg=calcAttackDamage(10);
      theSilent.takeDamage(dmg);
      thisEncounter.discardPile.add(new Slimed());
    }
    super.move++;
    if (super.move>1)
      super.move=0;
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Spike Slime (M)",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(super.attackPattern[super.move].equals("Tackle")){
      drawAttackIntent(calcAttackDamage(10));
    }else
      drawDebuffArrow(0);
  }
}
