public class SpikeSlimeL extends Enemy{
  public SpikeSlimeL(int x,int y){
    super(70,new String[]{"Split","Lick","Tackle"},"../images/Large_Spike_Slime.png",x,y,250,175);
    super.move=1;
  }
  public void playTurn(){
    startOfTurn();
    if(super.dead)
      return;
    String currentMove=super.attackPattern[super.move];
    if(currentMove.equals("Lick")){
      theSilent.frail+=3;
    }else if(currentMove.equals("Tackle")){
      int dmg=calcAttackDamage(18);
      theSilent.takeDamage(dmg);
      for(int i=0;i<2;i++)
        thisEncounter.discardPile.add(new Slimed());
    }else if(currentMove.equals("Split")){
      thisEncounter.enemies[0]=new SpikeSlimeM(super.x-100,super.y+100,super.HP);
      thisEncounter.enemies[1]=new SpikeSlimeM(super.x+175,super.y+100,super.HP);
      die();
    }
    super.move++;
    if(super.move>=3)
      super.move=1;
    endOfTurn();
  }
  public void drawEnemy(){   
    String currentMove=super.attackPattern[super.move];
    image(pic,super.x,super.y,super.enemyWidth,super.enemyHeight);
    if(thisEncounter.selectedEnemy==this){
      fill(255);
      textSize(25);
      text("Spike Slime (L)",super.x+super.enemyWidth/2,super.y-10);
    }
    drawStatuses();
    if(currentMove.equals("Split")){
      image(loadImage("../images/Stunned.png"),super.x+super.enemyWidth/2-20,super.y-60,40,40);
    }else if(currentMove.equals("Tackle")){
      drawAttackIntent(calcAttackDamage(18));
      drawDebuffArrow(20);
    }else if(currentMove.equals("Lick")){
      drawDebuffArrow(0);
    }
  }
  @Override
  public int takeDamage(int dmg){
    int hit=super.takeDamage(dmg);
    if(super.HP<super.maxHP*.5)
      super.move=0;
    return hit;
  }
}
