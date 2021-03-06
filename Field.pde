
import java.util.Arrays;


class Field {
  
  private int sizeX, sizeY, index;
  private float sunlight, avgWater, avgHummus, avgLime, avgFert;
  private String cropType;
  
  private Sector[][] Field;
  
  //creator for a field 
  //sizeX, sizeY, sunlight, cropType, avgWater, avgHummus, avgLime, avgFert, index
  public Field(int sizeX, int sizeY, float sunlight, String cropType, float avgWater, float avgHummus, float avgLime, float avgFert, int index)
  {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.sunlight = sunlight;
    this.avgWater = avgWater;
    this.cropType = cropType;
    this.avgHummus = avgHummus;
    this.avgLime = avgLime;
    this.avgFert = avgFert;
    this.index = index;
    
    //one sector is 10 by 10 meters (for simplicity)
    int sectorsX = (int) sizeX/10;
    int sectorsY = (int) sizeY/10;
    
    //initialize array containing field sectors (plants grow on sectors)
    Field = new Sector[sectorsX][sectorsY];
    
  }
  
  
  
  
  
  
  
  
  

  float waterNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin(x+(sin(offset)*3)))+((5*cos(y+(sin(offset)*3)))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }
  
  float limeNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin(x+(sin(offset*0.5)*3)))+((5*cos(y+(sin(offset*0.5)*3)))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }

   
  float fertNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin(x+(sin(offset*2)*3)))+((5*cos(y+(sin(offset*2)*3)))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }
  
   float humusNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin(x+(sin(offset*0.3)*3)))+((5*cos(y+(sin(offset*0.3)*3)))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }

  
  
  
  
  
  
  //for initializing field sector values
  public void create()
  {
    for(int x = 0; x < Field.length ; x++)
    {
      for(int y = 0; y < Field[x].length; y++)
      {
        Field[x][y] = new Sector(waterNoise(x, y, avgWater, index), humusNoise(x, y, avgHummus, index), limeNoise(x, y, avgLime, index), fertNoise(x, y, avgFert, index));
      }
    }
       
  }
  
  
  
  
  
  //GLOBAL GETTERS (for whole field)
  //size in meters
  public int getSizeX(){return sizeX;}
  public int getSizeY(){return sizeY;}
  
  //one sector is 10 by 10 meters (for simplicity)
  public int getSectorsX(){return Field.length;}
  public int getSectorsY(){return Field[0].length;}
  
  //for noise seed
  public int getIndex(){return index;}
  
  
  
  
  
  
  //GETTERS FOR FIELD SECTORS (for specific sector)
  public float Water(int x, int y)
  {
    return Field[x][y].getWater();
  }
  
  public float Hummus(int x, int y)
  {
    return Field[x][y].getHummus();
  }
  
  public float Lime(int x, int y)
  {
    return Field[x][y].getLime();
  }
  
  public float Fert(int x, int y)
  {
    return Field[x][y].getFert();
  }
  
  
  
  
  //SETTERS FOR FIELD SECTORS (updated with machines)
  public void updateWater(int x, int y, float quantity)
  {
    Field[x][y].incWater(quantity);
  }
  
  public void updateHummus(int x, int y, float quantity)
  {
    Field[x][y].incHummus(quantity);
  }
  
  public void updateLime(int x, int y, float quantity)
  {
    Field[x][y].incLime(quantity);
  }
  
  public void updateFert(int x, int y, float quantity)
  {
    Field[x][y].incFert(quantity);
  }



}
