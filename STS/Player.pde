public class Player{
  private int HP,maxHP,block,weak,vulnerable,strength;
  PImage pic;
  public Player(int HP){
    this.HP=HP;
    maxHP=HP;
    block=0;
    weak=0;
    vulnerable=0;
    strength=0;
  }
  public void takeDamage(int dmg){
    if(vulnerable>=1)
      block-=(int)(dmg*1.5);
    else
      block-=dmg;
    if(block<0){
      HP+=block;
      block=0;
    }
    if (HP<0)HP=0;
  }
  public void gainBlock(int blk){
    block+=blk;
  }
  public void recieveDebuff(int vuln,int weak){
    vulnerable+=vuln;
    this.weak+=weak;
  }
  public void startPlayerTurn(){
    weak--;vulnerable--;
    block=0;
  }
  public void reset(){
    vulnerable=0;
    weak=0;
    strength=0;
  }
  public int calcAttackDamage(int dmg,Enemy target){
     dmg+=strength;
     if(target.vulnerable>0)
       dmg=(int)(dmg*1.5);
     return dmg;
  }
  public void drawPlayer(int x,int y){
    fill(200,255,200);
    rect(x,y,100,200);
    fill(255);
    textSize(20);
    text(HP+"/"+maxHP,x,y+200,100,20);
    if(block>0){
      fill(111,255,242);
      circle(x-10,y+200,10);
      fill(88,198,188);
      text(block,x-10,y+200);
    }
    //image(pic,x,y);
  }
    

}
