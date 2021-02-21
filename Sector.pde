import java.util.Arrays;

class Sector{  
  
  private float water, hummus, lime, fert;
  
  //a sector contains plants on it and has soil values
  public Sector(float water, float hummus, float lime, float fert)
  {
    this.water = water;
    this.hummus = hummus;
    this.lime = lime;
    this.fert = fert;    
  }
  
  //to get values from a specific sector
  public float getWater() {return water;}
  public float getHummus() {return hummus;}
  public float getLime() {return lime;}
  public float getFert() {return fert;}
  
  //increases sector values with events (tractor, rain, ...) (negative when decreasing)
  public void incWater(int quantity) {water += quantity;}
  public void incHummus(int quantity) {hummus += quantity;}
  public void incLime(int quantity) {lime += quantity;}
  public void incFert(int quantity) {fert += quantity;} 
}
