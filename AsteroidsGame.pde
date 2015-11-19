SpaceShip HarryPotter;
// Asteroids[] manyAsteroids;
Star[] stars;

public void setup() 
{ background(0);
  size(500,500);
  HarryPotter= new SpaceShip();

  stars = new Star[1000];
  for (int i = 0; i<1000; i++)
  {
      stars[i] = new Star();
  }

  // manyAsteroids = new Asteroids[20];
  // for (int i = 0; i<20; i++)
  // {
  //   manyAsteroids[i] = new Asteroids();
  // }

}
public void draw() 
{ background(0);
 HarryPotter.move();
 HarryPotter.show();

for (int i = 0; i<1000; i++)
  {
      stars[i].show();
  }
  //  for (int i = 0; i<20; i++)
  // {
  //   manyAsteroids[i].show();
  // }

}
 public void keyPressed() {
    if (keyCode == UP) {
      HarryPotter.accelerate(0.3);
    }

    else if (keyCode == LEFT) {
      HarryPotter.rotate(-15);
    }
    else if (keyCode == RIGHT) {
      HarryPotter.rotate(15);
    }
    else if (keyCode == DOWN) {
      HarryPotter.hyperspace();
      
    }
  
  }

class Asteroid extends Floater 
{  private int speedofRot;

    public Asteroid()
    {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(0, 0, 255, 100);
    myCenterX = 0;
    myCenterY = Math.random()*height;
    myDirectionX = (Math.random()*3)-1.5;
    myDirectionY = (Math.random()*3)-1.5;
    myPointDirection = Math.random()*360;
   speedofRot = ((int)(Math.random()*6)-3);
  }

  public void move() { //Same move but with rotate. 
    rotate((int)speedofRot);
    super.move();
  }
   public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return (int)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}  
  public double getDirectionY(){return (int)myDirectionY;} 
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;} 
}




class SpaceShip extends Floater  
{  
  public SpaceShip() {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = -10;
    xCorners[1] = 20;
    yCorners[1] = 0;
    xCorners[2] = -10;
    yCorners[2] = 10;

    myColor = (255);
    myCenterX = (250);
    myCenterY = (250);
    myDirectionX = (0);
    myDirectionY = (0);
    myPointDirection = (0);
  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return (int)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}  
  public double getDirectionY(){return (int)myDirectionY;} 
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;} 

  public void hyperspace()
{
  setX((int)(Math.random()*501)+1);
  setY((int)(Math.random()*501)+1);
  setDirectionX(0);
  setDirectionY(0);
  setPointDirection((int)(Math.random()*361)+1);

}

}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 


  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

public class Star
{  private int posX, posY, mySize;

    public Star() {
    posX=((int)(Math.random()*501)+1);
    posY=((int)(Math.random()*501)+1);
    mySize=((int)(Math.random()*5)+1);

  }

  public void show() {
    noStroke();
    fill(178,212,255);
    ellipse(posX,posY,mySize,mySize);
  }
}


