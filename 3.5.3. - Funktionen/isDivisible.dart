// Schreibe eine Funktion isDivisibleBy(int a, int b), die true zurückgibt, wenn a durch b ohne Rest teilbar ist, ansonsten false.

import 'dart:math';

int random1 = Random().nextInt(100) + 1;
int random2 = Random().nextInt(100) + 1;

void main() {
  if (isDivisibleBy(random1, random2) == true) {
    print("Die zufällige Zahl $random1 ist durch $random2 ohne Rest teilbar");
  } else {
    int rest = random1 % random2;
    print(
        "Die zufällige Zahl $random1 ist nicht durch $random2 ohne Rest teilbar. Es bleibt/bleiben $rest übrig.");
  }
}

bool isDivisibleBy(int a, int b) {
  if (a % b == 0) {
    return true;
  } else {
    return false;
  }
}
