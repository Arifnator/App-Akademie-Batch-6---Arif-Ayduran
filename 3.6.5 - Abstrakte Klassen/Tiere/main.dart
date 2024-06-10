/*
Erstelle eine abstrakte Klasse für ein Tier.

Definieren zwei Methoden in dieser Klasse, die keine Implementation besitzen (keinen Body) und lediglich eine “Vorlage” für Unterklasse der Tier-Klasse sind.

Erstelle zwei Unterklassen, die die Tier-Klasse erweitern und implementiere die Methoden, die notwendig sind, um Objekte dieser Unterklassen erzeugen zu können.

Erzeuge ein oder mehrere Objekte der Unterklassen. 

Optional: Gib den Unterklassen Attribute, die sich nur für die jeweilige Unterklasse eigenen.  

BONUS: Erstelle die abstrakte Klasse in einer animal.dart Datei und importiere sie um die Unterklassen zu erzeugen. 
*/

import "animal.dart";
import "animals.dart";

void main() {
  List animalList = [
    Cat("Latte", 3, "British Shorthair"),
    Dog("Fido", 4, "American Shorthair"),
    Cat("Luna", 5, "British Shorthair"),
  ];

  for (Animal animal in animalList) {
    animal.descriptAnimal();
    animal.raceAnimal();
  }
}
