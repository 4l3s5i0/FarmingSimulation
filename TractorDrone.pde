import java.lang.Math;

abstract class TractorDrone {

  int implementWidth, productTank, fuelTank ;
  float fuelConsumption, posX, posY, workSpeed, movingSpeed, product, fuel;
  int lastWorkedWP=0;
  boolean taskComplete = false;
  
  public TractorDrone(float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption)
  {
   this.workSpeed = workSpeed;
   this.movingSpeed = movingSpeed; 
   this.implementWidth = implementWidth;
   this.productTank = productTank;
   this.fuelTank = fuelTank;
   this.fuelConsumption = fuelConsumption;
   product = 0;
   fuel = fuelTank;
  }
  
  
  //tasks a Drone needs to do
  abstract void fieldWork();
  
  
  //GETTERS
  public float getPosX(){return posX;}
  public float getPosY(){return posY;}
  public int getImplementWidth(){return implementWidth;}
  public float getProductTank(){return productTank;}
  public float getFuelTank(){return fuelTank;}
  
 
 
  
  
  //SETTERS
  public void setStartingPos(int x, int y)
  {
    this.posX = x;
    this.posY = y;
  }
  
  protected void emptyProduct()
  {
    this.product = 0;
  }
  
  //start of the DRIVING skills
  //detects if the drone needs to return to refill
  public boolean needsStation()
  {
    //println("Do I need product? :O");
    if (needProduct() || needFuel())
    {
      println("i need Product!");
      goToStation();
      return true;
    }
    return false;
  }
    //shortage detection for Product
   abstract boolean needProduct(); //if empty then true for seeds and spreader, if full then true for harvester
  
    //shortage detection for fuel
   public boolean needFuel()
  {
   float distanceToStation = posX + posY;
   float fuelToStation = distanceToStation * fuelConsumption;
   if(fuelTank -20 <fuelToStation)
   return true;
   else
   return false;
  }  
  
  //goes back to the station at (0,0) 
  public void goToStation(){
    driveTo(this.posX, this.implementWidth/2, this.movingSpeed);
    driveTo(0,0, this.movingSpeed);
    println("im going there :D (goToStation)");
    atStation();
  }
  //drives to the station with spcified speed
  public boolean driveTo(float xPoint, float yPoint, float speed){
      
     if(xPoint-this.posX>speed||xPoint-this.posX<-speed){
        if(xPoint>this.posX){
          this.posX+=speed;
        }else if(xPoint<this.posX){
          this.posX-=speed;
        }
      }
      else{
        this.posX=xPoint;
      }
      
      if(yPoint-this.posY>speed||yPoint-this.posY<-speed){
        if(yPoint>this.posY){
          this.posY+=speed;
        }
        else if(yPoint<this.posY){
          this.posY-=speed;
        }
      }
      else{
      this.posY=yPoint;
      }
      if(yPoint-this.posY>speed||yPoint-this.posY<-speed||xPoint-this.posX>speed||xPoint-this.posX<-speed){
      return false;
      }
      else{return true;}
    }
  
   public boolean atStation(){
    //println("im here");
    println("I'm at: " + posX + ", " + posY);
    if (posX <= 30 && posY <= 30)
    {
      //println("what do i do now?");
        tankProduct();
        tankFuel();
      return true;
    }
    return false;
  }

  //refills the fuel
  protected void tankFuel()
  {
    this.fuel = fuelTank;
    println("fueltank" + fuel);
  }
  //refills the Product
  protected void tankProduct()
  {
    this.product = productTank;
    println("producttank" + product);
  }
  
 //TOBE FINISHED
  //how the Drone drives through the field

   public void workField(Field field){
      println(this.lastWorkedWP);
    int[][] waypoints = new int[(field.sizeX/(this.implementWidth*2))*4][2];
    for(int i = 0; i<waypoints.length/4; i++){
      for(int j = 0; j<4; j++){
        
        if(j==2||j==3){
           waypoints[i*4+j][1]=this.implementWidth/2;
        }else{
           waypoints[i*4+j][1]=field.sizeY-this.implementWidth/2;
        }
        
        if(j==0){
          waypoints[i*4+j][0]=i*2*this.implementWidth+(this.implementWidth/2);
        }else if(j==1||j==2){
          waypoints[i*4+j][0]=i*2*this.implementWidth+this.implementWidth+(this.implementWidth/2);
        }else if(j==3){
          waypoints[i*4+j][0]=i*2*this.implementWidth+(2*this.implementWidth)+(this.implementWidth/2);
        }
      }
    }
    
    if(!driveTo(waypoints[this.lastWorkedWP][0],waypoints[this.lastWorkedWP][1], this.workSpeed)){
       driveTo(waypoints[this.lastWorkedWP][0],waypoints[this.lastWorkedWP][1], this.workSpeed);
     }else{
       if(!this.taskComplete){
       this.lastWorkedWP++;
     }
       if(this.lastWorkedWP==waypoints.length-2){
         this.lastWorkedWP=0;
         this.taskComplete = true;
       }
     }
  }
  
  
  
  
  
  
  //GRAPHICAL DISPLAY
  
  void show(){
    push();
      fill(0);
      rect(this.posX-8, this.posY-8, 16, 16);
      fill(100);
      line(this.posX-(this.implementWidth/2), this.posY, this.posX+(this.implementWidth/2), this.posY);
    pop();
  }
  
}
