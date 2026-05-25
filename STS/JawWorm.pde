public class JawWorm extends Enemy{
  public JawWorm(int x,int y){
    super(41,new String[]{"Chomp","Thrash","Bellow"},"../images/Jaw_Worm.png",x,y,200,100);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Chomp")){
      int dmg = calcAttackDamage(12);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Thrash")){
      gainBlock(5);
      int dmg = calcAttackDamage(6);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Bellow")){
      gainBlock(9);
      super.strength+=5;
    }
    super.move++;
    if(super.move>2)
      super.move=0;
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    String currentMove=super.attackPattern[super.move];
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(currentMove.equals("Chomp")){
      drawAttackIntent(calcAttackDamage(12));
    }else if(currentMove.equals("Thrash")){
      drawAttackIntent(calcAttackDamage(6));
    }else{
      drawBuffArrow();
    }
  }
}
    
