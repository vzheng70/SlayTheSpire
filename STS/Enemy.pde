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
    dead=false;
    this.attackPattern=attackPattern;
  }
  public abstract void playTurn();
  public void die(){
    dead=true;
  }
  public void takeDamage(int dmg){
    if(vulnerable>=1)
      block-=(int)(dmg*1.5);
    else
      block-=dmg;
    if(block<0)
      HP+=block;
    if (HP<0)HP=0;
  }
  public void gainBlock(int blk){
    block+=blk;
  }
  public void recieveDebuff(int vuln,int weak){
    vulnerable+=vuln;
    this.weak+=weak;
  }
}
