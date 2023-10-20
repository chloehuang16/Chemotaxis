Walker[] bob;
int numStars = 10; 
int trailLength = 45; 
ArrayList<PVector>[] starTrails;
ArrayList<PVector> backgroundStars; 

void setup() {
  size(1000, 1000);
  bob = new Walker[numStars];
  starTrails = new ArrayList[numStars];
  backgroundStars = new ArrayList<PVector>();

  for (int i = 0; i < bob.length; i++) {
    bob[i] = new Walker();
    starTrails[i] = new ArrayList<PVector>();
  }


  for (int i = 0; i < 200; i++) {
    PVector star = new PVector(random(width), random(height));
    backgroundStars.add(star);
  }
}

void draw() {
  background(0);

  // Display background stars
  for (PVector star : backgroundStars) {
    noStroke();
    fill(255);
    ellipse(star.x, star.y, 2, 2);
  }

  for (int i = 0; i < bob.length; i++) {
    bob[i].show();
    bob[i].walk();

    
    PVector position = new PVector(bob[i].myX, bob[i].myY);
    starTrails[i].add(position);

    
    for (int j = 0; j < starTrails[i].size(); j++) {
      PVector pos = starTrails[i].get(j);
      noStroke();
      fill(102, 50); 
      ellipse(pos.x, pos.y, 10, 10); 
    }

    
    if (starTrails[i].size() > trailLength) {
      starTrails[i].remove(0);
    }
  }
}

class Walker {
  int myX, myY, myColor;

  Walker() {
    myX = width / 2;
    myY = height / 2; 
    myColor = color(234,244,219);
  }

  void walk() {
    myX = myX + (int)(Math.random() * 5) + 3;
    myY = myY + (int)(Math.random() * 6) - 10;

    if (myX > width) {
      myX = -50;
      myY = (int)random(height);
    }
  }

  void show() {
    fill(myColor);
    stroke(255);
    strokeWeight(2);
    beginShape();
    vertex(myX, myY - 50);
    vertex(myX + 14, myY - 20);
    vertex(myX + 47, myY - 15);
    vertex(myX + 23, myY + 7);
    vertex(myX + 29, myY + 40);
    vertex(myX, myY + 25);
    vertex(myX - 29, myY + 40);
    vertex(myX - 23, myY + 7);
    vertex(myX - 47, myY - 15);
    vertex(myX - 14, myY - 20);
    endShape(CLOSE);
  }
}
