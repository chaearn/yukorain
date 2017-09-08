Rain r1;
import processing.sound.*;
SoundFile sunny;
SoundFile rain;
int numDrops = 40;
float Speed;
PImage yuko;
PImage sky;
boolean rainy;

Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(600, 600);
  background(255);
  smooth(10000000);
  Speed = random(1, 10);
  noStroke();
  sky = loadImage("bg.png");
  yuko = loadImage("yuko.png");

  sunny = new SoundFile(this, "sunny.wav");
  rain = new SoundFile(this, "rain.wav");
  rain.loop();
  sunny.loop();
  
  //if (rainy != true) {
  //  sunny.play();
  //  rain.stop();
  //} else if (rainy == true) {
  //  rain.play();
  //  sunny.stop();
  //}
  
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}

void draw() {


  image(yuko, pmouseX+40, 335);

  println(pmouseX);

  if(mouseX>=500 || mouseX <=-120){
    rain.amp(0);
    sunny.amp(0.8);
  } else {
    rain.amp(0.8);
    sunny.amp(0);
  }
  
  if (pmouseX>=500 || pmouseX <=-120 ) {
    fill(255, 80);
    rect(0, 0, 600, 600);
    image(sky, 0, 0);
    rainy = false;
    
  } else {

    fill((random(0, 40)), 80);
    rect(0, 0, 600, 600);
    //Loop through array to use objects.
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall();
    }
    for (int i = 0; i < drops.length; i++) {
      drops[i].fall2();
    }
    rainy = true;
    //rain.loop();
  }

  //if(rainy == false){
  //  rain.stop();
  //  sunny.play();
  //}

  //if(mousePressed == true && mouseButton == LEFT){
  //  rain.loop();
  //  rainy = true;
  //}

  //if(rainy == true && mouseButton == LEFT){
  //  rain.stop();
  //  //sunny.play();

  //}


  //if(rainy == true){
  //  rain.play();
  //} 
  //else {
  //  sunny.loop();
  //}
}

class Rain {
  float r = random(600);
  float y = random(-height);



  void fall() {
    y = y + 7;
    fill(255, 180);
    ellipse(r, y, 1, 1);

    if (y>height) {
      r = random(600);
      y = random(-200);
    }

    if (y >=0) {
      y += Speed;
    }
  }
  void fall2() {
    y = y + 7;
    fill(255, 180);
    ellipse(r, y, 1, 1);

    if (y>height) {
      r = random(600);
      y = random(-200);
    }

    if (y >=0) {
      y += Speed;
    }
  }
}