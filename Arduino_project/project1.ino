#include <SoftwareSerial.h>
#include <Servo.h>

Servo myServo;
const int servoPin = 9; //fir portocaliu de la servo - de control, conectat la pin digital 9

const int trig_pin = 12;  //pin pt trig de la ultrasonic
const int echo_pin = 11;  //pin pt echo de la ultrasonic
const int buzzer_pin = 8; //pin digital 8 pt buzzer pasiv
const int touch_pin = A0;  //senzorul de atingere, conectat la pin analogic
int distance_cm;
long duration;
int buzzerCountPlayer1 = 0;  //counter pentru scorul primului jucator
int buzzerCountPlayer2 = 0;  //counter pentru scorul jucatorului 2
bool buzzerState = false;  //urmareste starea buzzerului
int player = 2; //variabila care detecteaza care jucator arunca, 1 pt juc 1, 2 pt juc 2
bool playerSwitched = false;  //urmareste schimbarea jucatorilor
int previousPlayer1Count = -1; //stocheaza scorul anterior al jucatorului 1
int previousPlayer2Count = -1;  //stocheaza scorul anterior al juc 2

SoftwareSerial bluetooth(10, 11); // RX, TX

void setup()
{
  Serial.begin(9600);
  bluetooth.begin(9600);

  pinMode(trig_pin, OUTPUT);
  pinMode(echo_pin, INPUT);
  pinMode(buzzer_pin, OUTPUT);
  pinMode(touch_pin, INPUT);

  playerSwitched = false;

  myServo.attach(servoPin);
}

void loop()
{
  //verifica starea senzorului touch
  int touchValue = analogRead(touch_pin);

  //daca senzorul este atins, se schimba jucatorul
  if (touchValue > 500 && !playerSwitched) 
  {
    switchPlayer();
    playerSwitched = true;  //se seteaza flag-ul la true, ca sa se evite schimbarea repetata
  } 
  else if (touchValue <= 500) 
  {
    playerSwitched = false;  //se reseteaza flag-ul cand senzorul de atingere este eliberat
  }

  //senzorul ultrasonic a detectat mingea
  digitalWrite(trig_pin, LOW);
  delayMicroseconds(2);
  digitalWrite(trig_pin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig_pin, LOW);
  //retine timpul necesar ca pulsul sa se deplaseze de la senzor la obiect si inapoi, se mas in microsecunde
  duration = pulseIn(echo_pin, HIGH); 
  //converteste durata de timp a perioadei de la senzorul ultrasonic, in distanta corespunzatoare in cm
  //0.034: viteza sunetului in aer la temperatura camerei este de aprox 343 m/s(=0.0343cm/microsec
  // /2.0: se calculeaza distanta pentru un singur sens 
  distance_cm = (duration * 0.034) / 2.0;

  //daca mingea este indepartata sau daca senzorul nu reuseste sa citeasca corect distanta, nu suna buzzerul
  if (distance_cm >= 10 || distance_cm <= 0)
  {
    if (buzzerState)  //daca buzzer e on, se opreste pt ca obiectul nu e aproape
    {
      buzzerState = false;  //se dezactiveaza buzzer-ul
    }
    digitalWrite(buzzer_pin, HIGH); //pt ca folosesc buzzer activ, acesta va fi dezactivat pe HIGH
  }
  else//mingea se afla in cos
  {
    if (!buzzerState) 
    {
      incrementCounter(); //se incrementeaza counter-ul jucatorului curent
      buzzerState = true; //se activeaza buzzer-ul
    }
    digitalWrite(buzzer_pin, LOW); //folosesc buzzer activ, deci va fi activ pe LOW
  }

  delay(100);

  // afisam doar cand una din valori se modifica
  if (buzzerCountPlayer1 != previousPlayer1Count || buzzerCountPlayer2 != previousPlayer2Count)
  {
    Serial.println("Juc1: " + String(buzzerCountPlayer1) + " Juc2: " + String(buzzerCountPlayer2));
    bluetooth.println("Juc1: " + String(buzzerCountPlayer1) + " Juc2: " + String(buzzerCountPlayer2));

    previousPlayer1Count = buzzerCountPlayer1;
    previousPlayer2Count = buzzerCountPlayer2;
  }
}

void switchPlayer()
{
  //se face switch intre jucatori
  if (player == 1)
  {
    player = 2;
  }
  else
  {
    player = 1;
  }
}

void incrementCounter()
{
  //creste scorul pentru jucatorul curent - cel care a inscris acum
  if (player == 2)
  {
    buzzerCountPlayer2++;
  }
  else
  {
    buzzerCountPlayer1++;
  }

 // Verifica daca vreun jucator are 10 puncte
  if (buzzerCountPlayer1 == 5 || buzzerCountPlayer2 == 5) {
      myServo.write(90);  //ridicam bariera spre premiu, rotim cu 90 grade servomotorul

      //jocul s-a terminat, resetam counterele si afisam mesaj 
      if(buzzerCountPlayer1 == 5)
      {
      Serial.println("A castigat jucatorul 1!");
      bluetooth.println("A castigat jucatorul 1!");
      }
      else
      {
      Serial.println("A castigat jucatorul 2!");
      bluetooth.println("A castigat jucatorul 2!");        
      }

      delay(5000);
      buzzerCountPlayer1 = 0;
      buzzerCountPlayer2 = 0;
  }
   if(buzzerCountPlayer1 == 0 || buzzerCountPlayer2 == 0)
      {
        myServo.write(0); //resetare bariera odata cu resetare scor
      }
}






