public class Cultist extends Enemy{
  private int strength;
  private int ritual;
  public Cultist(){
    String[] attackPattern={"Strike"};
    super(55,attackPattern);
    ritual=0;strength=0;
  }
  public void playTurn(){
    if(thisEncounter.turnNumber==1){
      ritual=5;
    }else
