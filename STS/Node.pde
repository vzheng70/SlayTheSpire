public class Node{
  PVector location;
  //1 is combat, 2 is event, 3 is rest, 4 is elite
  int type;
  public Node(int x,int y,int type){
    location=new PVector(x,y);
    this.type=type;
  }
  public void drawNode(int x,int y){
    if(type==1)
      image(loadImage("../images/Enemy_node.png"),x,y,20,20);
    else if(type==2)
      image(loadImage("../images/Unknown_node.png"),x,y,20,20);
    else if(type==3)
      image(loadImage("../images/Rest_node.png"),x,y,20,20);
    else
      image(loadImage("../images/Elite_node.png"),x,y,30,20);
  }
}
