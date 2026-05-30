public class Cultist extends Enemy{
  private int ritual;
  public Cultist(int x,int y){
    super(51,new String[]{"Ritual","Strike"},"../images/Cultist.png",x,y,200,200);
    ritual=0;
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Strike")){
      int dmg = calcAttackDamage(6);
      theSilent.takeDamage(dmg);
    }
    if(ritual>0)super.strength+=ritual;
    if(currentMove.equals("Ritual")){
      ritual=5;
      super.move=1;
    }
    endOfTurn();
  }
  public void drawEnemy(){
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Cultist",super.x+super.enemyWidth/2,super.y-10);
    }
    //rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(super.attackPattern[super.move].equals("Ritual")){
      drawBuffArrow(0);
    }else{
      drawAttackIntent(calcAttackDamage(6));
    }
  }
  @Override
  public int drawStatuses(){
    int offset=super.drawStatuses();
    if(ritual>0){
      image(loadImage("../images/Ritual.png"),super.x+offset,super.y+super.enemyHeight+20 ,20,20);
      text(ritual,super.x+offset+20,super.y+super.enemyHeight+40);
      offset+=10;
    }
    return offset;
  }
}
