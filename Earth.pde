class Earth
{
  private PShape earth;
  private PVector pos;
  private PVector rotate;
  private float radius; 
  private PVector scale;

  Earth()
  {
    radius = 200;
    earth = createShape(SPHERE, radius);
    earth.setTexture(earthtext);
    pos = new PVector(1600, 0, 0);
    rotate = new PVector(1.25, -0.4);
    scale = new PVector (1,1,1);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(rotate.x);
    rotateX(rotate.y);
    fill(255);
    noStroke(); 
    shape(earth);
  }

  public void Rotate()
  {
    //rotate.x = rotate.x + 0.1;
    rotate.z = rotate.z + 0.1;
    //radius = radius * scale.x;
    //radius = radius * scale.y;
    //radius = radius * scale.z;   
    //zoom();
  }
  
  private void completedorbit()
  {
  }
  
}