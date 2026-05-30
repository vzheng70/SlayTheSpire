public class AcidSlimeS extends Enemy{
  public AcidSlimeS(int x,int y){
    super(11,new String[]{"Lick","Tackle"},"../images/Small_Acid_Slime.png",x,y,100,75);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Lick")){
      theSilent.recieveDebuff(0,2);
    }else if(currentMove.equals("Tackle")){
      int dmg=calcAttackDamage(4);
      theSilent.takeDamage(dmg);
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
      text("Acid Slime (S)",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(super.attackPattern[super.move].equals("Tackle")){
      drawAttackIntent(calcAttackDamage(4));
    }else
      drawDebuffArrow(0);
  }
}
