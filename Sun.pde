class Sun
{
  private PShape sun;
  private PVector pos;
  private PVector rotate;

  Sun()
  {
    sun = createShape(SPHERE, 500);
    sun.setTexture(suntext);
    pos = new PVector(-2000, height/2, -500);
    rotate = new PVector(1.25, -0.4);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(rotate.x);
    rotateX(rotate.y);
    noStroke();
    lights();
    shape(sun);
  }

  public void Rotate()
  {
    rotate.x = rotate.x + 0.01;
    rotate.y = rotate.y + 0.01;
  }
}