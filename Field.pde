

import java.util.Arrays;
import java.lang.Math;

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
  
  
  
  
  
  
  
  
  

  private float waterNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin((x+(sin(offset)*3))*0.2))+((5*cos((y+(sin(offset)))*0.1))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }
  
  private float limeNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin((x+(sin(offset*0.5)*3))*0.2))+((5*cos((y+(sin(offset*0.5)))*0.1))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }

   
  private float fertNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin((x+(sin(offset*2)*3))*0.2))+((5*cos((y+(sin(offset*2)))*0.1))));
  
  if(water>200){water=200;}
  if(water<0){water=0;}
  
  return water;
  }
  
   private float humusNoise(int x, int y, float avg,int offset){
    float water;
  
    water = avg+((5*sin((x+(sin(offset*0.3)*3))*0.2))+((5*cos((y+(sin(offset*0.3)))*0.1))));
  
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
  public float Water(float x, float y)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    return Field[intx/10][inty/10].getWater();
  }
  
  public float Hummus(float x, float y)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    return Field[intx/10][inty/10].getHummus();
  }
  
  public float Lime(float x, float y)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    return Field[intx/10][inty/10].getLime();
  }
  
  public float Fert(float x, float y)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    return Field[intx/10][inty/10].getFert();
  }
  
  
  
  
  //SETTERS FOR FIELD SECTORS (updated with machines)
  public void updateWater(float x, float y, int quantity)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    Field[intx/10][inty/10].incWater(quantity);
  }
  
  public void updateHummus(float x, float y, int quantity)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    Field[intx/10][inty/10].incHummus(quantity);
  }
  
  public void updateLime(float x, float y, int quantity)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    Field[intx/10][inty/10].incLime(quantity);
  }
  
  public void updateFert(float x, float y, int quantity)
  {
    int intx = (int) Math.round(x);
    int inty = (int) Math.round(y);
    Field[intx/10][inty/10].incFert(quantity);
  }



}
