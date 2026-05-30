public class Player{
  private int HP,maxHP,block,weak,vulnerable,strength,dexterity,frail;
  private int infiniteBlades=0;
  private int accuracy=0;
  private int noxiousFumes=0;
  private boolean fanOfKnives=false,doubleBlock=false,tracking=false;
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
    if(doubleBlock)block+=blk*2;
    else block+=blk;
  }
  public void rest(){
    HP+=(int)(maxHP*.3);
    if(HP>maxHP)
      HP=maxHP;
  }
  public void recieveDebuff(int vuln,int weak){
    vulnerable+=vuln;
    this.weak+=weak;
  }
  public void startPlayerTurn(){
    if(weak>0)weak--;if(vulnerable>0)vulnerable--;if(frail>0)frail--;
    block=0;
    doubleBlock=false;
    for(int i=0;i<infiniteBlades;i++)
      thisEncounter.hand.add(new Shiv());
    if(noxiousFumes>0){
      for(Enemy e:thisEncounter.enemies)
        e.gainPoison(noxiousFumes);
    }
  }
  public void reset(){
    vulnerable=0;
    weak=0;
    strength=0;
    dexterity=0;frail=0;infiniteBlades=0;accuracy=0;noxiousFumes=0;
    fanOfKnives=false;tracking=false;
  }
  public int calcBlock(int blk){
    blk+=dexterity;
    if(frail>0)
      blk=(int)(blk*.75);
    return blk;
  }
  public int calcAttackDamage(int dmg,Enemy target){
     dmg+=strength;
     if(tracking&&target.weak>0)
       dmg*=2;
     if(target.vulnerable>0)
       dmg=(int)(dmg*1.5);
     if(weak>0)
       dmg=(int)(dmg*.75);
     return dmg;
  }
  public void drawPlayer(int x,int y){
    image(pic,x-40,y,200,220);
    fill(255);
    textSize(20);
    text(HP+"/"+maxHP,x,y+200,100,20);
    if(block>0){
      image(loadImage("../images/Block.png"),x-30,y+188,40,40);
      fill(88,198,188);
      text(""+block,x-10,y+215);
    }
    drawStatuses(x,y);
  }
  public void drawStatuses(int x,int y){
    int offset=-40;
    fill(255);
    textSize(10);
    if(strength!=0){
      image(loadImage("../images/Strength.png"),x+offset,y+220,20,20);
      text(strength,x+offset+20,y+240);
      offset+=20;
    }if(dexterity!=0){
      image(loadImage("../images/Dexterity.png"),x+offset,y+220,20,20);
      text(dexterity,x+offset+20,y+240);
      offset+=20;
    }if(infiniteBlades>0){
      //image(loadImage("../images/Infinite_Blade_Icon.png"),x+offset,y+220,20,20);
      text(infiniteBlades,x+offset+20,y+240);
      offset+=20;
    }if(accuracy>0){
      //image(loadImage("../images/Accuracy_Icon.png"),x+offset,y+220,20,20);
      text(accuracy,x+offset+20,y+240);
      offset+=20;
    }if(noxiousFumes>0){
      //image(loadImage("../images/Noxious_Fumes_Icon.png"),x+offset,y+220,20,20);
      text(noxiousFumes,x+offset+20,y+240);
      offset+=20;
    }
    if(vulnerable>0){
      image(loadImage("../images/Vulnerable.png"),x+offset,y+220,20,20);
      text(vulnerable,x+offset+20,y+240);
      offset+=20;
    }if(weak>0){
      image(loadImage("../images/Weak.png"),x+offset,y+220,20,20);
      text(weak,x+offset+20,y+240);
      offset+=20;
    }if(frail>0){
      image(loadImage("../images/Frail.png"),x+offset,y+220,20,20);
      text(frail  ,x+offset+20,y+240);
      offset+=20;
    }
  }
    

}
