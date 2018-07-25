// Demonstrates how to control the LED.

#include "myriota_user_api.h"

static time_t Blinky() {
  LedTurnOn();
  printf("Led On\n");
  Sleep(1);
  LedTurnOff();
  printf("Led Off\n");
  Sleep(1);
  LedToggle();
  printf("Led On\n");
  Sleep(1);
  LedTurnOff();
  printf("Led Off\n");
  return SecondsFromNow(1);  // this job should run again after 1 second
}

void AppInit() { ScheduleJob(Blinky, ASAP()); }
