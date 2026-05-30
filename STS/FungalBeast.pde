public class FungalBeast extends Enemy{
  public FungalBeast(int x,int y){
    super(26,new String[]{"Headbutt","Grow","Headbutt"},"../images/Fungal_Beast.png",x,y,200,150);
    super.move=(int)(Math.random()*2);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Headbutt")){
      int dmg=calcAttackDamage(6);
        theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Grow")){
      super.strength+=5;
    }
    super.move++;
    if(super.move>2)
      super.move=0;
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Fungi Beast",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(super.attackPattern[super.move].equals("Headbutt")){
      drawAttackIntent(calcAttackDamage(6));
    }else{
      drawBuffArrow(0);
    }
  }
  public void die(){
    theSilent.recieveDebuff(2,0);
    super.die();
  }
}
