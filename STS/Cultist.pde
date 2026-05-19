public class Cultist extends Enemy{
  private int ritual;
  public Cultist(int x,int y){
    super(55,new String[]{"Ritual","Strike"});
    super.x=x;
    super.y=y;
    super.enemyWidth=100;
    super.enemyHeight=200;
    ritual=0;
  }
  public void playTurn(){
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Strike")){
      theSilent.takeDamage(6+super.strength);
    }
    if(ritual>0)super.strength+=ritual;
    if(currentMove.equals("Ritual")){
      ritual=5;
      super.move=1;
    }
  }
  public void drawEnemy(){
    //print("drew");
    
    if(thisEncounter.selectedEnemy==this)
      fill(120,120,200);
    else 
      fill(20,20,100);
    rect(super.x,super.y,super.enemyWidth,super.enemyHeight);
    fill(255);
    textSize(20);
    text(super.HP+"/"+super.maxHP,super.x,super.y+200,100,20);
  }
}
