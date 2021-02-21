
public class FertSpreader extends SpreaderDrone{
    public FertSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int fertstate = (int) field.Fert(deployPosX, posY);
        if (fertstate <= 100){
        field.updateFert(deployPosX, posY, (100-fertstate));
        product -= (100-fertstate);
        }
      }
      catch(Exception e) {
        
      }
    }
  }

}
