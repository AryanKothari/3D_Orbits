class Star
{
  private PVector pos;

  Star()
  {
    pos = new PVector(random(-3000, 3000), random(-3000, 3000), random(-3000,3000));
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(1.25);
    rotateX(-0.4);
    noStroke();
    fill(255,255,255);
    shape(starshape);
    popMatrix();
  }
}