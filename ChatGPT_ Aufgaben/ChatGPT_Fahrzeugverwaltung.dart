/*
Erstellen Sie ein Programm zur Verwaltung von Fahrzeugen. Dabei sollen verschiedene Fahrzeugtypen und ihre Eigenschaften verwaltet werden
Die Aufgabe umfasst die Erstellung von Klassen und deren Instanzen sowie die Implementierung von Methoden zur Verarbeitung von Fahrzeugdaten.

Anforderungen:
Klasse Fahrzeug:

Attribute:
marke (String)
modell (String)
baujahr (int)
farbe (String)

Methoden:
beschreibeFahrzeug(): Gibt eine Beschreibung des Fahrzeugs als String zurück.

Klasse Auto, die von Fahrzeug erbt:

Zusätzliche Attribute:
anzahlTueren (int)
Methoden:
Überschreiben der Methode beschreibeFahrzeug(), um die Anzahl der Türen in der Beschreibung hinzuzufügen.
Klasse Motorrad, die von Fahrzeug erbt:

Zusätzliche Attribute:
hubraum (int)
Methoden:
Überschreiben der Methode beschreibeFahrzeug(), um den Hubraum in der Beschreibung hinzuzufügen.
Hauptprogramm:

Erstellen Sie mehrere Instanzen der Klassen Auto und Motorrad.
Speichern Sie diese Instanzen in einer Liste.
Durchlaufen Sie die Liste und rufen Sie für jedes Fahrzeug die Methode beschreibeFahrzeug() auf, um die Beschreibung des Fahrzeugs auszugeben.
*/
class Fahrzeug {
  String marke;
  String modell;
  int baujahr;
  String farbe;

  Fahrzeug(this.marke, this.modell, this.baujahr, this.farbe);

  String beschreibeFahrzeug() {
    return 'Marke: $marke, Modell: $modell, Baujahr: $baujahr, Farbe: $farbe';
  }
}

class Auto extends Fahrzeug {
  int anzahlTueren;

  Auto(
      String marke, String modell, int baujahr, String farbe, this.anzahlTueren)
      : super(marke, modell, baujahr, farbe);

  @override
  String beschreibeFahrzeug() {
    return '${super.beschreibeFahrzeug()}, Anzahl Türen: $anzahlTueren';
  }
}

class Motorrad extends Fahrzeug {
  double hubraum;

  Motorrad(String marke, String modell, int baujahr, String farbe, this.hubraum)
      : super(marke, modell, baujahr, farbe);

  @override
  String beschreibeFahrzeug() {
    return '${super.beschreibeFahrzeug()}, Hubraum: ${hubraum}cc';
  }
}

void main() {
  List<Fahrzeug> fahrzeuge = [
    Auto('BMW', 'X5', 2018, 'Schwarz', 5),
    Auto('Honda', 'Civic', 2020, 'Rot', 4),
    Motorrad('Yamaha', 'MT-07', 2021, 'Blau', 689),
    Auto('Mercedes', 'Maybach', 2024, 'Schwarz', 5),
  ];

  for (var fahrzeug in fahrzeuge) {
    print(fahrzeug.beschreibeFahrzeug());
  }
}
