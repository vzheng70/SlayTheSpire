public class Slaver extends Enemy{
  public Slaver(int x,int y){
    super(49,new String[]{"Rake","Stab"},"../images/Slaver.png",x,y,200,200);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Rake")){
      int dmg=calcAttackDamage(8);
        theSilent.takeDamage(dmg);
      theSilent.recieveDebuff(0,3);
    }else if(currentMove.equals("Stab")){
      int dmg=calcAttackDamage(13);
      theSilent.takeDamage(dmg);
    }
    super.move++;
    if(super.move>1)
      super.move=0;
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Slaver",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(super.attackPattern[super.move].equals("Rake")){
      drawAttackIntent(calcAttackDamage(8));
      drawDebuffArrow(20);
    }else{
      drawAttackIntent(calcAttackDamage(13));
    }
  }
}
