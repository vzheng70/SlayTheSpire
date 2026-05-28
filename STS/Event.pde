public abstract class Event{
  private String[] choices;
  private PImage pic;
  private String text;
  public Event(String[] options,String fileName,String text){
    choices=options;
    pic=loadImage(fileName);
    this.text=text;
  }
  public void drawEvent(){
    image(pic,width/2-400,height/2-300,400,600);
    fill(100);
    rect(width/2,height/2-300,400,600);
    fill(255);
    textSize(30);
    text(text,width/2,height/2-300,400,300);
    for(int i=0;i<choices.length;i++){
      fill(75);
      rect(width/2+10,height/2+540-55*i,380,50);
      fill(255);
      text(choices[i],width/2+10,height/2+540-55*i,380,50);
    }
  }
}
    
