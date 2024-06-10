/*
Erstelle eine Klasse für ein Werkzeug mit Attributen deiner Wahl, die für jedes Werkzeug wichtig sind. 
Erzeuge nun 2 Unterklassen für verschiedene Werkzeuge, wie Hammer oder Bohrer, mit Attributen und Methoden, die nur für die jeweilige Unterklasse gelten.

 Erzeuge Objekte dieser Unterklassen in der Main Methode.
 */

class Werkzeug {
  String name;
  double gewicht;
  String hersteller;

  Werkzeug(this.name, this.gewicht, this.hersteller);

  String beschreibung() {
    return "$name von $hersteller, Gewicht: $gewicht kg.";
  }
}

class Hammer extends Werkzeug {
  String material;

  Hammer(String name, double gewicht, String hersteller, this.material)
      : super(name, gewicht, hersteller);

  @override
  String beschreibung() {
    return "${super.beschreibung()} Es besteht aus $material.";
  }
}

class Bohrer extends Werkzeug {
  int leistung;

  Bohrer(String name, double gewicht, String hersteller, this.leistung)
      : super(name, gewicht, hersteller);

  @override
  String beschreibung() {
    return "${super.beschreibung()} Die Leistung ist $leistung Watt.";
  }
}

void main() {
  Hammer hammer1 = Hammer("Schlosserhammer", 1.5, "ToolCo", "Stahl");
  Bohrer bohrer1 = Bohrer("Akkubohrer", 2.0, "PowerTools", 500);

  print(hammer1.beschreibung());

  print(bohrer1.beschreibung());
}
