PImage earthtext, moontext, suntext;

PShape starshape;

Earth earth;
Moon moon;
Sun sun;

ArrayList<Star> star = new ArrayList<Star>();

import peasy.*;
PeasyCam cam;

float ZoomX;
float ZoomY;

float earthorbit = 0;
float moonorbit = 0;;

//float scale = 1;

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

  //cam = new PeasyCam(this, 50,50);
}

void draw()
{
  background(0);
  spotLight(255, 255, 255, -1000, height/2, 400, 0, 0, -1, PI/4, -10);


  ZoomX = 1830;
  ZoomY = 720;

  camera(ZoomX, ZoomY, (height/1.7) / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  
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