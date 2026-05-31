public abstract class Enemy{
  private int HP,maxHP,block,weak,vulnerable,strength,x,y,enemyWidth,enemyHeight;
  private String[] attackPattern;
  private int move;
  private int poison;
  private int thorns=0;
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
    block=0;
    if(poison>0){
      takeDamage(poison);
      poison--;
    }    
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
  public int takeDamage(int dmg){
    //print(dmg);
    int temp=0;
    block-=dmg;
    if(block<0){
      HP+=block;
      temp=block;
      thisEncounter.allSplashTxt.add(new SplashText(""+block*-1,x+enemyWidth/2,y+enemyHeight/2));
      block=0;
    }
    if (HP<=0){HP=0;die();}
    return temp;
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
  public void drawBuffArrow(int offset){
    fill(45,234,233);
    rect(x+enemyWidth/2-10+offset, y-50,20,20);
    triangle(x+enemyWidth/2-15+offset,y-50,x+enemyWidth/2+offset,y-60,x+enemyWidth/2+15+offset,y-50);
  }
  public void drawDebuffArrow(int offset){
    fill(160,34,34);
    rect(x+enemyWidth/2-10+offset, y-60,20,20);
    triangle(x+enemyWidth/2-15+offset,y-40,x+enemyWidth/2+offset,y-30,x+enemyWidth/2+15+offset,y-40);
  }
  public void drawBlockIntent(int offset){
    image(loadImage("../images/Block.png"),x+enemyWidth/2-20+offset,y-60,40,40);
  }
  public int drawStatuses(){
    if(block>0){
      //fill(111,255,242);
      image(loadImage("../images/Block.png"),x-30,y+enemyHeight-12,40,40);
      //circle(x-10,y+enemyHeight+8,20);
      fill(88,198,188);
      textSize(20);
      text(""+block,x-10,y+enemyHeight+15);
    }
    int offset=0;
    fill(255);
    textSize(20);
    text(HP+"/"+maxHP,x+enemyWidth/2,y+enemyHeight+15);
    textSize(10);
    
    if(strength!=0){
      image(loadImage("../images/Strength.png"),x+offset,y+enemyHeight+20,20,20);
      text(strength,x+offset+20,y+enemyHeight+40);
      offset+=20;
    }
    if(vulnerable>0){
      image(loadImage("../images/Vulnerable.png"),x+offset,y+enemyHeight+20,20,20);
      text(vulnerable,x+offset+20,y+enemyHeight+40);
      offset+=20;
    }if(weak>0){
      image(loadImage("../images/Weak.png"),x+offset,y+enemyHeight+20,20,20);
      text(weak,x+offset+20,y+enemyHeight+40);
      offset+=20;
    }if(poison>0){
      image(loadImage("../images/Poison.png"),x+offset,y+enemyHeight+20,20,20);
      text(poison  ,x+offset+20,y+enemyHeight+40);
      offset+=20;
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
    return offset;
  }
  public void drawAttackIntent(int dmg){
    fill(229,137,154);
    textSize(25);
    text(dmg,x+enemyWidth/2,y-35);
    if(dmg<=5)
      image(loadImage("../images/Smallest_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg<=19)
      image(loadImage("../images/Small_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg<=14)
      image(loadImage("../images/Medium_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg<=19)
      image(loadImage("../images/Large_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else
      image(loadImage("../images/Largest_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
  }
  public void drawAttackIntent(int dmg,int mult){
    fill(229,137,154);
    textSize(25);
    text(dmg+"x"+mult,x+enemyWidth/2,y-35);
    if(dmg*mult<=5)
      image(loadImage("../images/Smallest_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg*mult<=9)
      image(loadImage("../images/Small_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg*mult<=14)
      image(loadImage("../images/Medium_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else if(dmg*mult<=19)
      image(loadImage("../images/Large_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
    else
      image(loadImage("../images/Largest_Attack_Intent.png"),x+enemyWidth/2-60,y-60,40,40);
  }
}
