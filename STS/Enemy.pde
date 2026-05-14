public abstract class Enemy{
  private int HP,maxHP,block,weak,vulnerable;
  private String[] attackPattern;
  private boolean dead;
  public Enemy(int HP, String[] attackPattern){
    this.HP=HP;
    maxHP=HP;
    block=0;
    weak=0;
    vulnerable=0;
    this.attackPattern=attackPattern;
  }
}
