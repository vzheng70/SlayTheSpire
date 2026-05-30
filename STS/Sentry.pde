public class Sentry extends Enemy{
  public Sentry(int x,int y){
    super(41,new String[]{"Wave","Beam"},"../images/Sentry.png",x,y,100,200);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Wave")){
      for(int i=0;i<3;i++)
        thisEncounter.discardPile.add(new Dazed());
    }else if(currentMove.equals("Beam")){
      int dmg=calcAttackDamage(10);
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
      text("Sentry",super.x+super.enemyWidth/2,super.y-10);
    }
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(super.attackPattern[super.move].equals("Wave")){
      drawDebuffArrow(0);
    }else{
      drawAttackIntent(calcAttackDamage(10));
    }
  }
}
