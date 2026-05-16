public class Cultist extends Enemy{
  private int ritual;
  public Cultist(){
    super(55,new String[]{"Ritual","Strike"});
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
}
