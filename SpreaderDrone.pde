public abstract class SpreaderDrone extends TractorDrone{
  private Field field;
  public SpreaderDrone(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
  super(workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    this.field = field;
}
  public void atStation(){
  tankProduct();
  tankFuel();
}
  abstract void updateField(float posX, float posY);
  
    public void fieldWork(){
  
    if (!needsStation()){
      workField(field);
      updateField(this.getPosX(), this.getPosY());
     // lastX = posX;
      //lastY = posY;
      }
      
  }
  
  boolean needProduct(){
  if (product <= 10){
    return true;
  }
  else
    return false;
  }
  

}
