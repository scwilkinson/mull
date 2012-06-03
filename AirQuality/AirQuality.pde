//Air Quality

#include <SoftModem.h>

SoftModem modem;

int sensorType = 1;
int sensorValue;
int sensorValueDEC;

void setup()
{
  //Serial.begin(9600);                                                   // for Debugging
  modem.begin();
  modem.write(sensorType);                                                // tell phone which sensor I am
  delay(500);
}

void loop()
{
  sensorValue = analogRead(0);
  sensorValueDEC = sensorValue, DEC;
  //Serial.println(sensorValue, DEC);                                     // prints the value read
  modem.write(sensorValueDEC);                                            // send the data to the phone
  delay(1000);
}
 
