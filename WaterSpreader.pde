
public class WaterSpreader extends SpreaderDrone{
    public WaterSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int waterstate = (int) field.Water(deployPosX, posY);
        if (waterstate <= 100){
        field.updateWater(deployPosX, posY, (100-waterstate));
        product -= (100-waterstate);
        }
      }
      catch(Exception e) {
        
      }
    }
  }
}
