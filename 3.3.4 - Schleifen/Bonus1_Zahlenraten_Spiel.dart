import "dart:io";
import "dart:math";

void main() {
  int random = Random().nextInt(100) + 1;
  int? userRandom;
  int tries = 0;

  print(
      'Bitte erraten Sie eine Zahl zwischen 1 und 100, oder schreiben Sie "ende", um das Programm zu beenden.');

  do {
    String input = stdin.readLineSync()!;

    userRandom = int.tryParse(input);
    if (userRandom != null) {
      if (userRandom <= 100 && userRandom >= 1) {
        tries++;
        if (userRandom == random) {
          if (tries <= 10) {
            print(
                "Herzlichen Glückwunsch! Das war aber schnell! Nur $tries Versuche!");
          } else {
            print(
                "Herzlichen Glückwunsch! Könnte aber schneller gehen! Leider mit $tries Versuchen!");
          }
          break;
        } else if (userRandom < random) {
          print("Zu niedrig!");
        } else {
          print("Zu hoch!");
        }
      } else if (userRandom > 100) {
        print("Bitte nur unter 100");
      } else if (userRandom < 1) {
        print("Bitte nur über 1");
      }
    } else if (input == "ende") {
      break;
    } else {
      print("Bitte nur Nummern!");
    }
  } while (userRandom != random);
}
