// The simulation code for the blinky example. This is only included when
// building the application for the simulator platform.
//
// To use the simulator you must implement all of the hardware APIs used
// by your application. The blinky example application uses the Led APIs
// implemented below.

#include "myriota_user_api.h"

static int led_state = 0;

void LedTurnOn(void) {
  led_state = 1;
  printf("%ld %s Led=%d\n", time(NULL), __func__, led_state);
}

void LedTurnOff(void) {
  led_state = 0;
  printf("%ld %s Led=%d\n", time(NULL), __func__, led_state);
}

void LedToggle(void) {
  led_state = led_state ? 0 : 1;
  printf("%ld %s Led=%d\n", time(NULL), __func__, led_state);
}
