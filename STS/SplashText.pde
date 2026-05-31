public class SplashText{
  private String text;
  private PVector pos;
  private PVector velocity;
  private PVector acceleration;
  private int lifeTime;
  public SplashText(String txt,int x,int y){
    text=txt;
    pos=new PVector(x,y);
    velocity=new PVector((float)Math.random()*4-2,-10.0);
    acceleration=new PVector(0,1);
    lifeTime=100;
  }
  public void drawText(){
    stroke(0);
    fill(255,lifeTime);
    textSize(lifeTime/2+1);
    text(text,pos.x,pos.y);
    pos.add(velocity);
    velocity.add(acceleration);
    lifeTime--;
    noStroke();
  }
}
    
