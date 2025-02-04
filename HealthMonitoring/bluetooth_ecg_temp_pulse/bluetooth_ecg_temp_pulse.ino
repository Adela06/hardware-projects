#include <SPI.h>
#include <SD.h>

//pinii analogici pentru senzori
const int ecgPin = A0;       
const int tempPin = A1;      
const int gsrPin = A2;       

//pin pentru modulul sd
const int chipSelect = 10; 

//prag pentru nivelul de stres
const int stressThreshold = 600;

void setup() {
  Serial.begin(9600); 

  //initializare card sd
  if (!SD.begin(chipSelect)) {
    Serial.println("Eroare: Card SD nedetectat!");
    while (1);//oprire executie daca cardul nu e gasit
  }
  Serial.println("Card SD initializat cu succes!");
}

void loop() {
  if (Serial.available() > 0) {
    char command = Serial.read();
    if (command == 'r') { //la comanda 'r'
      readSDCard();//citire card sd
    }
  }

  //deschidere fisier scriere
  File dataFile = SD.open("datalog.txt", FILE_WRITE);

  if (dataFile) {
    //se citesc val de la senzori
    int ecgValue = analogRead(ecgPin);
    int tempValue = analogRead(tempPin);
    int gsrValue = analogRead(gsrPin);  

    //convertire valoare LM35 in grade Celsius
    float voltage = tempValue * (5.0 / 1023.0);  //convertire la voltaj
    float temperature = voltage * 100.0; //LM35 produce 10mV pe fiecare grad Celsius

    //timp in secunde
    float time = millis() / 1000.0;

    //scrierea datelor in fisierul de pe sd
    dataFile.print(time);
    dataFile.print(",");
    dataFile.print(ecgValue);
    dataFile.print(",");
    dataFile.print(temperature);
    dataFile.print(",");
    dataFile.println(gsrValue);

    //afisare date in serial
    Serial.print("Timp: ");
    Serial.print(time);
    Serial.print(" | ECG: ");
    Serial.print(ecgValue);
    Serial.print(" | Temp: ");
    Serial.print(temperature);
    Serial.print(" | GSR: ");
    Serial.println(gsrValue);

    //mesaj la depasirea nivelului de stres
    if (gsrValue > stressThreshold) {
      Serial.println("Nivel de stres depasit sau e neconectat!");
    }

    //grafic pentru egc
    Serial.print("*G");
    Serial.print("X");
    Serial.print(time);
    Serial.print("Y");
    Serial.print(ecgValue);
    Serial.println("*");

    //grafic pentru temperatura
    Serial.print("*T");
    Serial.print("X");
    Serial.print(time);
    Serial.print("Y");
    Serial.print(temperature);
    Serial.println("*");

    //grafic pentru GSR
    Serial.print("*P");
    Serial.print("X");
    Serial.print(time);
    Serial.print("Y");
    Serial.print(gsrValue);
    Serial.println("*");

    dataFile.close(); 
  } 
  else {
    Serial.println("Eroare: Nu pot deschide fisierul pentru scriere!");
    delay(1000); 
  }

  delay(100);
}

//functie pentru citirea continutului cardului SD
void readSDCard() {
  File dataFile = SD.open("datalog.txt");
  if (dataFile) {
    Serial.println("Continutul fisierului datalog.txt:");
    while (dataFile.available()) {
      Serial.write(dataFile.read()); 
    }
    dataFile.close(); 
  } else {
    Serial.println("Eroare: Nu pot citi fisierul!");
  }
}
