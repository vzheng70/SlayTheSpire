public class Cultist extends Enemy{
  private int ritual;
  public Cultist(int x,int y){
    super(51,new String[]{"Ritual","Strike"});
    super.x=x;
    super.y=y;
    super.enemyWidth=100;
    super.enemyHeight=200;
    ritual=0;
  }
  public void playTurn(){
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
    //print("drew");
    
    if(thisEncounter.selectedEnemy==this)
      fill(120,120,200);
    else 
      fill(20,20,100);
    rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    drawStatuses();
    if(super.attackPattern[super.move]=="Ritual"){
      drawBuffArrow();
    }else{
      drawAttackIntent(calcAttackDamage(6));
    }
  }
}
