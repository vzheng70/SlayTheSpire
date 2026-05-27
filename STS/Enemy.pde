public abstract class Enemy{
  private int HP,maxHP,block,weak,vulnerable,strength,x,y,enemyWidth,enemyHeight;
  private String[] attackPattern;
  private int move;
  private int poison;
  private boolean dead;
  PImage pic;
  public Enemy(int HP, String[] attackPattern,String fileName,int x,int y,int w,int h){
    this.HP=HP;
    maxHP=HP;
    block=0;
    weak=0;
    vulnerable=0;
    dead=false;
    this.attackPattern=attackPattern;
    move=0;
    strength=0;
    this.x=x;
    this.y=y;
    enemyWidth=w;
    enemyHeight=h;
    pic=loadImage(fileName);
    poison=0;
  }
  public abstract void playTurn();
  public abstract void drawEnemy();
  public void startOfTurn(){    
    if(poison>0){
      takeDamage(poison);
      poison--;
    }
    block=0;
  }
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
    if (HP<=0){HP=0;die();}
  }
  public void gainPoison(int p){
    poison+=p;
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
     //print(dmg);
     return dmg;
  }
  public void drawBuffArrow(){
    fill(45,234,233);
    rect(x+enemyWidth/2-10, y-30,20,20);
    triangle(x+enemyWidth/2-15,y-30,x+enemyWidth/2,y-40,x+enemyWidth/2+15,y-30);
  }
  public void drawStatuses(){
    if(block>0){
      fill(111,255,242);
      circle(x-10,y+enemyHeight+8,20);
      fill(88,198,188);
      textSize(20);
      text(""+block,x-10,y+enemyHeight+15);
    }
    int offset=0;
    fill(255);
    textSize(20);
    text(HP+"/"+maxHP,x+enemyWidth/4,y+enemyHeight,100,20);
    textSize(10);
    
    if(strength>0){
      text(strength,x+offset,y+enemyHeight+20);
      offset+=10;
    }
    if(vulnerable>0){
      text(vulnerable,x+offset,y+enemyHeight+20);
      offset+=10;
    }if(weak>0){
      text(weak,x+offset,y+enemyHeight+20);
      offset+=10;
    }if(poison>0){
      text(poison  ,x+offset,y+enemyHeight+20);
      offset+=10;
    }
    if(thisEncounter.selectedEnemy==this){
      fill(0);
      stroke(0);
      line(x,y,x+20,y);
      line(x,y,x,y+20);
      line(x+enemyWidth,y,x+enemyWidth-20,y);
      line(x+enemyWidth,y,x+enemyWidth,y+20);
      line(x+enemyWidth,y+enemyHeight,x+enemyWidth,y+enemyHeight-20);
      line(x+enemyWidth,y+enemyHeight,x+enemyWidth-20,y+enemyHeight);
      line(x,y+enemyHeight,x,y+enemyHeight-20);
      line(x,y+enemyHeight,x+20,y+enemyHeight);
      noStroke();
    }
  }
  public void drawAttackIntent(int dmg){
    fill(229,137,154);
    textSize(20);
    text(dmg,x+enemyWidth/2,y-30);
  }
}
