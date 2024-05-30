/* Aufgabe: Erstelle ein Programm in Dart, das eine Liste von Namen und deren Geburtsdaten speichert,
und dann den Benutzer nach einem bestimmten Namen fragt, um das Geburtsdatum dieses Namens anzuzeigen.

Anforderungen:

Das Programm soll eine Liste von Namen und Geburtsdaten verwalten.
Das Programm soll den Benutzer nach einem Namen fragen und das entsprechende Geburtsdatum anzeigen.
Wenn der Name nicht gefunden wird, soll eine entsprechende Nachricht ausgegeben werden. */

import "dart:io";

void main() {
  Map<String, String> nameBirthdateMap = {};

  while (true) {
    print(
        "Name und Geburtsdatum eingeben (Format: Name,dd-mm-yyyy) oder 'ende' zum Beenden:");
    String? input = stdin.readLineSync();
    List<String> partsTemp = input!.split(',');

    if (input.isEmpty) {
      print("Keine Eingabe. Geben Sie etwas ein oder 'ende' zum Beenden:");
    } else if (input.toLowerCase() == "ende") {
      break;
    } else if (partsTemp.length != 2) {
      print(
          "Falsches Format. Bitte verwenden Sie das Format: 'Name,dd-mm-yyyy' oder 'ende' zum Beenden:");
    } else {
      List<String> parts = input.split(',');

      String name = parts[0].trim().toLowerCase();
      String birthdate = parts[1].trim();

      nameBirthdateMap[name] = birthdate;
    }
  }

  while (true) {
    print(
        "Geben Sie einen Namen ein, um das Geburtsdatum zu sehen oder 'ende' zum Beenden:");

    String? inputName = stdin.readLineSync();

    if (inputName!.isEmpty) {
      print("Keine Eingabe. Geben Sie etwas ein oder 'ende' zum Beenden:");
    } else if (inputName.toLowerCase() == "ende") {
      break;
    } else {
      if (nameBirthdateMap.containsKey(inputName.toLowerCase())) {
        print("Geburtsdatum von $inputName: ${nameBirthdateMap[inputName]}");
      } else {
        print("$inputName nicht gefunden.");
      }
    }
  }
}
