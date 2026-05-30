public class Lagavulin extends Enemy{
  public Lagavulin(int x,int y){
    super(112,new String[]{"Stunned","Asleep","Asleep","Asleep","Smash","Smash","Siphon Soul"},"../images/Lagavulin.png",x,y,250,300);
    super.move=1;
    super.block=8;
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Smash")){
      int dmg = calcAttackDamage(20);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Siphon Soul")){
      theSilent.strength-=2;
      theSilent.dexterity-=2;
    }
    super.move++;
    if(currentMove.equals("Stunned"))
     super.move=4;
    if(super.move>=7)
      super.move=4;
    endOfTurn();
  }
  public void drawEnemy(){   
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Asleep"))
      image(loadImage("../images/Lagavulin_Asleep.png"),super.x,super.y+150,250,150);
    else
      image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Lagavulin",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(currentMove.equals("Asleep")){
      image(loadImage("../images/Sleeping.png"),super.x+super.enemyWidth/2-20,super.y-60,40,40);
    }else if(currentMove.equals("Stunned")){
      image(loadImage("../images/Stunned.png"),super.x+super.enemyWidth/2-20,super.y-60,40,40);
    }else if(currentMove.equals("Smash")){
      drawAttackIntent(calcAttackDamage(20));
    }else if(currentMove.equals("Siphon Soul")){
      drawDebuffArrow(0);
    }
  }
  @Override
  public int takeDamage(int dmg){
    int hit=super.takeDamage(dmg);
    if(super.HP<super.maxHP&&super.attackPattern[super.move].equals("Asleep"))
      super.move=0;
    return hit;
  }
  @Override
  public void endOfTurn(){
    super.endOfTurn();
    if(super.attackPattern[super.move].equals("Asleep"))
      super.block+=8;
  }
}
