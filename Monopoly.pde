PImage background;

Player person;

void setup(){
  background = loadImage("boy with apple.jpg");
  size(900, 900);
  background(123);
  
  person = new Player();
}


void draw(){
  fill(255, 0, 10);
  stroke(0);
  strokeWeight(2);
  rect(100, 100, 20, 20);
  image(background, 10, 10);
}
