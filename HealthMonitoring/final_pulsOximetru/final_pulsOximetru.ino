#include <Wire.h>
#include "MAX30100_PulseOximeter.h"

#define REPORTING_PERIOD_MS     1000
#define CUTOFF_FREQUENCY        1.0  //frecv de taierefiltrului (in Hz)
#define SAMPLING_FREQUENCY      10.0 //frecv de esantionare a semnalului (in Hz)

PulseOximeter pox;

uint32_t tsLastReport = 0;

//coef filtrului Butterworth
float b0, b1, b2, a0, a1, a2;
float x1 = 0, x2 = 0, y1 = 0, y2 = 0; //stocarea valorilor anterioare ale semnalului
float filteredHeartRate = 0;

//calculează coef filtrului Butterworth de ordinul 2
void calculateFilterCoefficients() {
    float w0 = 2 * 3.14159265 * CUTOFF_FREQUENCY / SAMPLING_FREQUENCY; //frecv de taiere normalizata
    float cosW0 = cos(w0);
    float alpha = sin(w0) / 2.0;

    //coef filtrului Butterworth de ordinul 2
    b0 = (1 - cosW0) / 2;
    b1 = 1 - cosW0;
    b2 = (1 - cosW0) / 2;
    a0 = 1 + alpha; 
    a1 = -2 * cosW0;
    a2 = 1 - alpha;

    //normalizarea coeficientilor
    b0 /= a0;
    b1 /= a0;
    b2 /= a0;
    a1 /= a0;
    a2 /= a0;

    //coef finali
    a0 = 1.0; //a0 este 1, deci nu are nevoie de normalizare
}

void onBeatDetected() {
    Serial.println("Beat!");
}

void setup() {
    Serial.begin(115200);

    Serial.print("Initializare puls oximetru..");

    if (!pox.begin()) {
        Serial.println("FAILED");
        for(;;);
    } else {
        Serial.println("SUCCESS");
    }

    //init coeficienti pentru filtrul Butterworth
    calculateFilterCoefficients();

    pox.setOnBeatDetectedCallback(onBeatDetected);
}

void loop() {
    pox.update();

    //obtinere ritmul cardiac
    float heartRate = pox.getHeartRate();

    //aplicare filtrul Butterworth doar daca e un ritm valid
    if (heartRate > 0) {
        //aplic filtru
        filteredHeartRate = b0 * heartRate + b1 * x1 + b2 * x2 - a1 * y1 - a2 * y2;

        //actualizare valori
        x2 = x1;
        x1 = heartRate;
        y2 = y1;
        y1 = filteredHeartRate;
    }

    //trim val pe serial
    if (millis() - tsLastReport > REPORTING_PERIOD_MS) {
        Serial.print("Heart rate:");
        Serial.print(filteredHeartRate);
        Serial.print("bpm / SpO2:");
        Serial.print(pox.getSpO2());
        Serial.println("%");

        tsLastReport = millis();
    }
}
