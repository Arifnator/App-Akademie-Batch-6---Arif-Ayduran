/* Implementierung eines Taschenrechners
Aufgabe:
Programmiere einen  Taschenrechner, der grundlegende arithmetische Operationen
(Addition,Subtraktion,Multiplikation,Division) unterstützt.

GrundlegendeFunktionen:
- Subtrahieren
- Addieren
- Multiplizieren
- Dividieren

Jede dieser Aktionen soll in eine eigene Funktion verpackt werden. Die Funktion soll
dabei zwei Argumente bekommen und eines zurückgeben.

Weiterführendes
1. Verwende Benutzereingaben für die Zahlen
2. Verwende Benutzereingaben für die Aktion(+,-,*,/)
3. Achte auf Fehlerbehandlung(z.B. Teilen durch 0)
4. Gebe dem benutzer die Möglichkeit den Prozess so oft zu wiederholen wie er
möchte

- “try catch” und wie man damit fehler behandelt
*/

import 'dart:io';

void main() {
  while (true) {
    try {
      print("Bitte geben Sie die erste Zahl an, mit der Sie rechnen möchten:");
      double number1 = double.parse(stdin.readLineSync()!);

      print("Bitte geben Sie die zweite Zahl an, mit der Sie rechnen möchten:");
      double number2 = double.parse(stdin.readLineSync()!);

      print(
          "Bitte geben Sie die Methode an, mit der Sie rechnen möchten. \n '1': Subtrahieren \n '2': Addieren \n '3': Multiplizieren \n '4': Dividieren");
      int method = int.parse(stdin.readLineSync()!);

      switch (method) {
        case 1:
          print("$number1 - $number2 = ${sub(number1, number2)}");
          break;
        case 2:
          print("$number1 + $number2 = ${add(number1, number2)}");
          break;
        case 3:
          print("$number1 * $number2 = ${multi(number1, number2)}");
          break;
        case 4:
          print("$number1 / $number2 = ${div(number1, number2)}");
          break;
        default:
          print("Keine gültige Eingabe");
      }
    } catch (e) {
      print("Ein Fehler ist aufgetreten: ${e.toString()}");
    }

    print("Möchten Sie eine weitere Berechnung durchführen? (j/n)");
    String? continueCalc = stdin.readLineSync();
    if (continueCalc != null) {
      if (continueCalc.toLowerCase() == 'j') {
        continue;
      } else if (continueCalc.toLowerCase() == "n") {
        break;
      } else {
        print("Bitte nur mit 'j' oder 'n' anwtorten");
      }
    } else {
      print ("Keine Eingabe");
    }
  }
}

double sub(double a, double b) {
  return a - b;
}

double add(double a, double b) {
  return a + b;
}

double multi(double a, double b) {
  return a * b;
}

double div(double a, double b) {
  if (b == 0) {
    print("Es ist nicht möglich durch 0 zu teilen");
  }
  return a / b;
}
