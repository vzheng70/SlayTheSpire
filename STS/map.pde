public class Map{
  private boolean mapOpened;
  private int scroll=0;
  private Node[] nodes;
  public Map(){
    mapOpened =true;
    nodes = new Node[16];
    for(int i=0;i<nodes.length;i++){
      if(i==0){
        nodes[i]=new Node(width/2+((int)(Math.random()*20-10)),i*-100+500,1);
      }else{
        double rand=Math.random();
        if(rand<.4)
          nodes[i]=new Node(width/2+((int)(Math.random()*20-10)),i*-100+500,1);
        else if(rand<.8)
          nodes[i]=new Node(width/2+((int)(Math.random()*20-10)),i*-100+500,2);
        else if(rand<.9)
          nodes[i]=new Node(width/2+((int)(Math.random()*20-10)),i*-100+500,3);
        else
          nodes[i]=new Node(width/2+((int)(Math.random()*20-10)),i*-100+500,4);
      }
    }
  }
  public void viewMap(){    
    if(scroll<-1170)scroll=-1170;
    if(scroll>0)scroll=0;
    if(mapOpened==true){
      fill(20,90);
      rect(0,0,width,height);
      fill(232,165,94);
      rect(width/2-200,0,400,height);
      for(int i=0;i<nodes.length;i++){
        Node n=nodes[i];
        n.drawNode((int)n.location.x,(int)n.location.y-scroll);
        if(i<floorNum){
          fill(255,0,0);
          quad(n.location.x+2, n.location.y-scroll,n.location.x+20,n.location.y-scroll+18,n.location.x+18,n.location.y-scroll+20,n.location.x,n.location.y-scroll+2);
          quad(n.location.x+2, n.location.y-scroll+20,n.location.x,n.location.y-scroll+18,n.location.x+18,n.location.y-scroll,n.location.x+20,n.location.y-scroll+2);
        }          
        if(i>0){
          fill(20);
          stroke(0);
          line(n.location.x+10,n.location.y-scroll+20,nodes[i-1].location.x+10,nodes[i-1].location.y-scroll);
          noStroke();
        }
      }
    }
  }
}
