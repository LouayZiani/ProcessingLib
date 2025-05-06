import gab.opencv.*;
import processing.video.*;
import java.util.*;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;
Rectangle[] faces;

ArrayList<Tile> tiles;
int tileSpeed = 10;
int score = 0;
boolean gameOver = false;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  cam.start();

  initGame();
  textFont(createFont("Arial", 20));
}

void draw() {
  if (cam.available()) {
    cam.read();
    opencv.loadImage(cam);
  }

  image(cam, 0, 0);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(2);

  faces = opencv.detect();

  for (Rectangle face : faces) {
    rect(face.x, face.y, face.width, face.height);
  }

  if (!gameOver) {
    for (Tile t : tiles) {
      t.update();
      t.display();

      for (Rectangle face : faces) {
        if (t.collidesWithFace(face)) {
          gameOver = true;
          noLoop();
        }
      }

      if (t.y > height) {
        t.reset();
      }
    }

    //score
    fill(255);
    textSize(32);
    text("Score: " + score, 20, 40);

    if (frameCount % 30 == 0) score++; // 1 point per second

  } else {
    fill(0, 180);
    rect(0, height/2 - 50, width, 100);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(36);
    text("💀 GAME OVER\nFinal Score: " + score + "\nPress SPACE to restart", width / 2, height / 2);
  }
}

void keyPressed() {
  if (gameOver && key == ' ') {
    resetGame();
  }
}

void resetGame() {
  score = 0;
  gameOver = false;
  initGame();
  loop(); // Resume the draw loop
}

void initGame() {
  tiles = new ArrayList<Tile>();
  for (int i = 0; i < 5; i++) {
    tiles.add(new Tile());
  }
}

class Tile {
  float x, y;
  float w = 80;
  float h = 40;

  Tile() {
    reset();
  }

  void reset() {
    x = random(width - w);
    y = random(-400, -50);
  }

  void update() {
    y += tileSpeed;
  }

  void display() {
    fill(255, 50, 50);
    noStroke();
    rect(x, y, w, h, 8);
  }

  boolean collidesWithFace(Rectangle face) {
    return !(x + w < face.x || x > face.x + face.width || y + h < face.y || y > face.y + face.height);
  }
}
