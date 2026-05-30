public class Rest{
  boolean rested;
  public Rest(){
    rested=false;
  }
  public void drawRest(){
    image(loadImage("../images/Rest_Fire.png"),width/2-150,height/2,300,200);
    if(!rested){
      if(checkMouse(width/2-300,width/2-100,height/2-120,height/2-20)){
        image(loadImage("../images/Rest_icon.png"),width/2-295,height/2-115,210,110);
        fill(255);
        textSize(30);
        text("Heal for 30% of your maximum HP ("+(int)(theSilent.maxHP*.3)+").",width/2,height/2+30);
      }else
        image(loadImage("../images/Rest_icon.png"),width/2-300,height/2-120,200,100);
      if(checkMouse(width/2+100,width/2+300,height/2-120,height/2-20)){
        image(loadImage("../images/Smith_icon.png"),width/2+95,height/2-115,210,110);
        fill(255);
        textSize(30);
        text("Upgrade a card in your deck.",width/2,height/2+30);
    }else
        image(loadImage("../images/Smith_icon.png"),width/2+100,height/2-120,200,100);
    }else{
      drawProceedArrow();
    }
  }
}
      
