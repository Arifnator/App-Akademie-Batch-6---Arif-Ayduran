/* Erstelle einen neuen Ordner in einem beliebigen Verzeichnis.
In diesem Ordner sollen nun 2 Dart Dateien erstellt werden (methods.dart, main.dart).
Eines der Files enthält die Main Methode, die andere Datei enthält verschiedene Funktionen.

Funktionen in der methods.dart:
sayHello() // Die Funktion gibt “Hallo” aus
sayBye() // Die Funktion gibt “Tschüss” aus
sayName(String name)// Die Funktion gibt “Hallo” und einen mitgetebenen namen aus

importiere nun die Datei “methods.dart” in die Datei “main.dart” und rufe dort die Funktionen auf. */

void sayHello() {
  print("Hello");
}

void sayBye() {
  print("Tschüss");
}

void sayName(String name) {
  print("Hallo $name");
}
