public class DeadEnemy extends Enemy{
  public DeadEnemy(){
    super(1,null,"../images/Deadly_Poison.png",0,0,0,0);
    super.dead=true;
  }
  public void playTurn(){}
  public void drawEnemy(){}
}
