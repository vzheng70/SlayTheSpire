ArrayList<Card> deck=new ArrayList<Card>();
Encounter thisEncounter;
Player theSilent=new Player(70);
void setup(){
  background(50);
  size(1080,640);
  for(int i=0;i<5;i++)deck.add(new Strike());
  thisEncounter=new Encounter(new Enemy[]{new Cultist()});
}
void draw(){
  background(50);
  for(int i=0;i<thisEncounter.hand.size();i++){
    Card card=thisEncounter.hand.get(i);
    card.drawCard((width/2-40)+((i-thisEncounter.hand.size()/2)*100),480);
  }
  circle(0,0,90);
}
public void delay(int millis){
  try {
    Thread.sleep(millis);
  }
  catch (InterruptedException e) {
  }
}
