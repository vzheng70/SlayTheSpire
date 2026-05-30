public class SkulkingColony extends Enemy{
  private int invincible=20;
  public SkulkingColony(int x,int y){
    super(80,new String[]{"Zoom","Zoom","Inertia","Piercing Stabs"},"../images/Skulking_Colony.png",x,y,220,300);
  }
  public void playTurn(){
    invincible=20;
    startOfTurn(); 
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Zoom")){
      int dmg=calcAttackDamage(16);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Inertia")){
      int dmg=calcAttackDamage(11);
      theSilent.takeDamage(dmg);
      super.strength+=3;
    }else if(currentMove.equals("Piercing Stabs")){
      int dmg=calcAttackDamage(8);
      for(int i=0;i<2;i++)
        theSilent.takeDamage(dmg);
    }
    super.move++;
    if(super.move>=4)
      super.move=0;
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Skulking Colony",super.x+super.enemyWidth/2,super.y-10);
    }
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(super.attackPattern[super.move].equals("Zoom")){
      drawAttackIntent(calcAttackDamage(16));
    }else if(super.attackPattern[super.move].equals("Inertia")){
      drawAttackIntent(calcAttackDamage(11));
      drawBuffArrow(20);
    }else if(super.attackPattern[super.move].equals("Piercing Stabs")){
      drawAttackIntent(calcAttackDamage(8),2);
    }
  }
  public int takeDamage(int dmg){
    if(invincible<dmg)
      dmg=invincible;
    dmg=super.takeDamage(dmg);
    invincible+=dmg;
    if(invincible<0)invincible=0;
    return dmg;
  }
  public int drawStatuses(){
    int offset=super.drawStatuses();
    image(loadImage("../images/Invincible.png"),super.x+offset,super.y+super.enemyHeight+20 ,20,20);
    text(invincible,super.x+offset+20,super.y+super.enemyHeight+40);
    offset+=10;
    return offset;
  }
}
