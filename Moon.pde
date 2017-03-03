class Moon
{
  private PShape moon;
  private PVector pos;
  private float angle;
  private float orbitspeed;
  private PVector rotate;
  private float radius; 
  Moon()
  {
    radius = 30;
    moon = createShape(SPHERE, 30);
    moon.setTexture(moontext);
    pos = new PVector(350, 0, 0);
    rotate = new PVector(1.25, -0.4);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(rotate.x);
    rotateX(rotate.y);
    noStroke();
    shape(moon);
  }

  public void Rotate()
  {
    rotate.x = rotate.x + 0.1;
    rotate.y = rotate.y + 0.1;
  }
}