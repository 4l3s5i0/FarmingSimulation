
public class LimeSpreader extends SpreaderDrone{
    public LimeSpreader(Field field, float workSpeed, float movingSpeed, int implementWidth, int productTank, int fuelTank, float fuelConsumption){
    super(field, workSpeed,movingSpeed,implementWidth, productTank, fuelTank, fuelConsumption);
    
}

  
  void updateField(float posX, float posY){
    for (int i=0; i<=implementWidth; i++)
    {
      try{
        float deployPosX = posX - (implementWidth/2)+5 + i;
        
        int limestate = (int) field.Lime(deployPosX, posY);
        if (limestate <= 100){
        field.updateLime(deployPosX, posY, (100-limestate));
        product -= (100-limestate);
        }
      }
      catch(Exception e) { }
    }
  }
  
  
  
}
