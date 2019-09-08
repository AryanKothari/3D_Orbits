

PImage earthtext, moontext, suntext;

PShape starshape;

Earth earth;
Moon moon;
Sun sun;

ArrayList<Star> star = new ArrayList<Star>();

import queasycam.*;
QueasyCam cam;

float ZoomX;
float ZoomY;

float earthorbit = 0;
float moonorbit = 0;


float screen = 1;

PVector campos = new PVector(946.6418, 241.8144, 753.149);

void setup()
{
  fullScreen(P3D);
  background(0);
  noStroke();

  earthtext = loadImage("earth.jpg");
  moontext = loadImage("moon.jpg");
  suntext = loadImage("sun.jpg");

  starshape = createShape(SPHERE, 1);

  for (int i =0; i < 4000; i++)
  {
    star.add(new Star());
  }

  earth = new Earth();
  moon  = new Moon();
  sun = new Sun();


  cam = new QueasyCam(this, 20f, 20000f);
  cam.speed = 10;              // default is 3
  cam.sensitivity = 0.5;
  cam.position = campos;
}

void draw()
{
  background(0);
  
  if (screen == 0)
  {
    fill (255, 255, 255, 255);
    textSize(100);
    text("Earth's Orbit", width/4.11, height/4.5);

    fill (255, 255, 255);
    textSize(30);
    text("Created by Aryan Kothari", width/1.371, height/1.04);

    fill(255, 255, 255);
    textSize(35);
    text("ENTER To Start Orbit", width/2.267, height/2.04);

    if (screen == 0 & mousePressed & mouseX >= width/2.32 & mouseX <= width/1.8 & 
      mouseY >= height/2.25 & mouseY <= height/2) //Play button/Go to game
    {
      screen = 1;
    }

    if (keyCode == ENTER)
    {
      screen = 1;
    }
  }

  if (screen == 1)
  {
    campos = new PVector(1296.0366, 305.8501, 1810.0901);
    
    spotLight(255, 255, 255, -1000, height/2, 400, 0, 0, -1, PI/4, -10);

    ZoomX = 1830;
    ZoomY = 720;

    //camera(ZoomX, ZoomY, (height/1.7) / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);

    sun.Draw();
    sun.Rotate();
    earth.Draw();
    earth.Rotate();
    moon.Draw();
    moon.Rotate();
    popMatrix();
    popMatrix();
    popMatrix();


    for (int i = 0; i < star.size(); i++)
    {
      star.get(i).Draw();
    }

    if (keyPressed)
    {
      if (keyCode == 'w')
      {
        ZoomY = ZoomY - 30;
      }
      if (keyCode == 's')
      {
        ZoomY = ZoomY + 30;
      }
      if (keyCode == 'a')
      {
        ZoomX = ZoomX - 30;
      }
      if (keyCode == 'd')
      {
        ZoomX = ZoomX + 30;
      }
    }

    fill(255, 255, 255);
    textSize(30);
    text("ZoomY  " + ZoomY, 1300, 900);
    text("ZoomX  " + ZoomX, 1300, 950);

    fill(255, 255, 255);
    textSize(30);
    text("Earth Orbit:  " + earthorbit, 50, 900);
    text("Moon Orbit:   " + moonorbit, 50, 950);
  }
}
