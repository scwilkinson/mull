//Soil Moisture

#include <SoftModem.h>

#define moisture_input 0
#define divider_top 2
#define divider_bottom 5

int moisture; // analogical value obtained from the experiment

int SoilMoisture(){
  int reading;
  // set driver pins to outputs
  pinMode(divider_top,OUTPUT);
  pinMode(divider_bottom,OUTPUT);

  // drive a current through the divider in one direction
  digitalWrite(divider_top,HIGH);
  digitalWrite(divider_bottom,LOW);

  // wait a moment for capacitance effects to settle
  delay(1000);

  // take a reading
  reading=analogRead(moisture_input);

  // reverse the current
  digitalWrite(divider_top,LOW);
  digitalWrite(divider_bottom,HIGH);

  // give as much time in 'revers'e as in 'forward'
  delay(1000);

  // stop the current
  digitalWrite(divider_bottom,LOW);

  return reading;
  moisture = reading;
  
}

SoftModem modem;

int sensorType = 3;

int moistureDEC;

void setup () {
  
 modem.begin();
 //Serial.begin(9600);
 modem.print(sensorType);
 delay(500);
  
}

void loop (void) {
  
  moistureDEC = moisture, DEC;
  modem.print(moistureDEC);
  delay(1000);
  //Serial.print("Soil moisture: ");
  //Serial.print(moisture); // print the analogical measurement of the experiment
  // later i will improve here a calculation for derive Soil Moisture in %
  //Serial.println();
  //delay(1000);
}
