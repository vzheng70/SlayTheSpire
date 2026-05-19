public abstract class Enemy{
  private int HP,maxHP,block,weak,vulnerable,strength,x,y,enemyWidth,enemyHeight;
  private String[] attackPattern;
  private int move;
  private boolean dead;
  public Enemy(int HP, String[] attackPattern){
    this.HP=HP;
    maxHP=HP;
    block=0;
    weak=0;
    vulnerable=0;
    dead=false;
    this.attackPattern=attackPattern;
    move=0;
    strength=0;
  }
  public abstract void playTurn();
  public abstract void drawEnemy();
  public void endOfTurn(){
    if(weak>0)
      weak--;
    if(vulnerable>0)
      vulnerable--;
  }
  public void die(){
    dead=true;
  }
  public void takeDamage(int dmg){
    //print(dmg);
    if(vulnerable>=1)
      block-=(int)(dmg*1.5);
    else
      block-=dmg;
    if(block<0){
      HP+=block;
      block=0;
    }
    if (HP<0){HP=0;die();}
  }
  public void gainBlock(int blk){
    block+=blk;
  }
  public void recieveDebuff(int vuln,int weak){
    vulnerable+=vuln;
    this.weak+=weak;
  }
  public int calcAttackDamage(int dmg){
     dmg+=strength;
     if(theSilent.vulnerable>0)
       dmg=(int)(dmg*1.5);
     if(weak>0)
       dmg=(int)(dmg*.75);
     print(dmg);
     return dmg;
  }
}
