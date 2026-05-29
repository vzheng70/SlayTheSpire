public class WurmCrawler extends Enemy{
  public WurmCrawler(int x,int y){
    super(58,new String[]{"Goop","Inhale","Goop"},"../images/Wurm_Crawler.png",x,y,250,150);
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Goop")){
      int dmg = calcAttackDamage(6);
      theSilent.takeDamage(dmg);
    }else if(currentMove.equals("Inhale")){
      super.strength+=7;
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
      text("Wriggling Wurm Crawler",super.x+super.enemyWidth/2,super.y-10);
    }
    String currentMove=super.attackPattern[super.move];
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(currentMove.equals("Goop")){
      drawAttackIntent(calcAttackDamage(6));
    }else if(currentMove.equals("Inhale")){
      drawBuffArrow();
    }
  }
}
