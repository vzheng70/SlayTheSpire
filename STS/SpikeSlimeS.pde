public class SpikeSlimeS extends Enemy{
  public SpikeSlimeS(int x,int y){
    super(12,new String[]{"Attack"},"../images/Small_Spike_Slime.png",x,y,100,75);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Attack")){
      int dmg=calcAttackDamage(6);
      theSilent.takeDamage(dmg);
    }
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Spike Slime (S)",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(super.attackPattern[super.move].equals("Attack")){
      drawAttackIntent(calcAttackDamage(6));
    }
  }
}
