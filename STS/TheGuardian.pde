public class theGuardian extends Enemy{
  private int modeShift=40;
  private int counter=0;
  private boolean defensive;
  public theGuardian(int x,int y){
    super(250,new String[]{"Defensive Mode","Roll","Twin Slam","Charge Up","Fierce Bash","Vent Steam","Whirlwind"},"../images/Guardian.png",x,y,350,300);
    super.move=3;
  }
  public void playTurn(){
    startOfTurn(); 
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Charge Up")){
      gainBlock(9);
    }else if(currentMove.equals("Fierce Bash")){
      int dmg=calcAttackDamage(36);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Vent Steam")){
      theSilent.recieveDebuff(3,3);
    }else if(currentMove.equals("Whirlwind")){
      int dmg=calcAttackDamage(5);
      for(int i=0;i<4;i++)
        theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Defensive Mode")){
      super.thorns=4;
    }else if(currentMove.equals("Roll")){
      int dmg=calcAttackDamage(10);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Twin Slam")){
      int dmg=calcAttackDamage(8);
      for(int i=0;i<2;i++)
        theSilent.takeDamage(dmg);
      super.move=5;
      defensive=false;
      super.thorns=0;
      modeShift=40+10*counter;
    }
        
    super.move++;
    if(super.move>6)
      super.move=3;
    endOfTurn();
  }
  public void drawEnemy(){
    if(defensive)
      image(loadImage("../images/Guardian_Defensive.png"),super.x+50,super.y+100,super.enemyWidth-100,super.enemyHeight-100);
    else
      image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("The Guardian",super.x+super.enemyWidth/2,super.y-10);
    }
    String currentMove=super.attackPattern[super.move];
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(currentMove.equals("Charge Up")){
      drawBlockIntent(0);
    }else if(currentMove.equals("Fierce Bash")){
      drawAttackIntent(calcAttackDamage(36));
    }else if(currentMove.equals("Vent Steam")){
      drawDebuffArrow(0);
    }else if(currentMove.equals("Whirlwind")){
      drawAttackIntent(calcAttackDamage(5),4);
    }else if(currentMove.equals("Defensive Mode")){
      drawBuffArrow(0);
    }else if(currentMove.equals("Roll")){
      drawAttackIntent(calcAttackDamage(10));
    }else if(currentMove.equals("Twin Slam")){
      drawAttackIntent(calcAttackDamage(8),2);
      drawBuffArrow(40);
    }
  }
  public int takeDamage(int dmg){
    dmg=super.takeDamage(dmg);
    if(!defensive){
      modeShift+=dmg;
      if(modeShift<=0){
        modeShift=0;
        defensive=true;
        super.move=0;
        counter++;
        super.block=20;
      }
    }
    return dmg;
  }
  public int drawStatuses(){
    int offset=super.drawStatuses();
    if(modeShift!=0){
      image(loadImage("../images/Mode_Shift.png"),super.x+offset,super.y+super.enemyHeight+20 ,20,20);
      text(modeShift,super.x+offset+20,super.y+super.enemyHeight+40);
    }
    if(super.thorns>0){
      image(loadImage("../images/thorns.png"),super.x+offset,super.y+super.enemyHeight+20 ,20,20);
      text(super.thorns,super.x+offset+20,super.y+super.enemyHeight+40);
    }
    offset+=10;
    return offset;
  }
}
