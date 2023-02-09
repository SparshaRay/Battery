import android.os.BatteryManager ;
import android.content.Context;
import processing.sound.*;

SinOsc sine;
int batlvl;

void setup()  {
  
  fullScreen();
  background(100);
  textSize(40);
  text("start0", 100, 100);
  sine = new SinOsc(this);  
  sine.freq(440);
  thread("task");
  
}

void task ()  {
  
  Context ctx = getContext();
  BatteryManager bm = (BatteryManager)ctx.getSystemService(Context.BATTERY_SERVICE);
  
  while (true)  {
    delay(5000);
    batlvl = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    if (batlvl<65 || batlvl>90)  {
      for (int i=0; i<3; i++)  {
        sine.play();
        delay(500);
        sine.stop();
        delay(500);
      }
    }
    delay(1000*60*10);
  }
  
}
