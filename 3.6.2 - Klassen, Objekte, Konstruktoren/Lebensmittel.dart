/*
Erstelle eine Klasse für ein Lebensmittel mit Attributen wie Name, Hersteller, Haltbarkeitsdatum, Gewicht und Preis. 

Erstelle mindestens zwei davon abgeleitete Klassen (Bspw. Milch, Butter). Erzeuge auch Objekte für jede dieser Unterklassen.

BONUS: Nutze die Lebensmittelhersteller-Klasse aus der gestrigen Aufgabe als Attribut der Lebensmittel-Klasse.
*/

class Lebensmittelhersteller {
  String name;
  String strasse;
  String hausnummer;
  int postleitzahl;
  String stadt;
  String adresse;

  Lebensmittelhersteller(
      this.name, this.strasse, this.hausnummer, this.postleitzahl, this.stadt)
      : this.adresse = "$strasse $hausnummer, $postleitzahl $stadt";

  @override
  String toString() {
    return "$name, $adresse";
  }
}

class Lebensmittel {
  String name;
  Lebensmittelhersteller hersteller;
  String haltbarkeitsDatum;
  double gewicht;
  double preis;

  Lebensmittel(this.name, this.hersteller, this.haltbarkeitsDatum, this.gewicht,
      this.preis);

  String beschreibung() {
    return "$name von ${hersteller.name} (${hersteller.adresse}), Haltbar bis: $haltbarkeitsDatum, Gewicht: $gewicht kg, Preis: $preis €";
  }
}

class Milch extends Lebensmittel {
  String milchart;
  double fettgehalt;

  Milch(
      String name,
      Lebensmittelhersteller hersteller,
      String haltbarkeitsDatum,
      double gewicht,
      double preis,
      this.milchart,
      this.fettgehalt)
      : super(name, hersteller, haltbarkeitsDatum, gewicht, preis);

  @override
  String beschreibung() {
    return "${super.beschreibung()}, Milchart: $milchart, Fettgehalt: $fettgehalt%";
  }
}

class Butter extends Lebensmittel {
  String butterArt;

  Butter(String name, Lebensmittelhersteller hersteller,
      String haltbarkeitsDatum, double gewicht, double preis, this.butterArt)
      : super(name, hersteller, haltbarkeitsDatum, gewicht, preis);

  @override
  String beschreibung() {
    return "${super.beschreibung()}, Butterart: $butterArt";
  }
}

void main() {
  Lebensmittelhersteller hersteller1 = Lebensmittelhersteller(
      "Milch AG", "Musterstraße", "1", 12345, "Musterstadt");
  Lebensmittelhersteller hersteller2 = Lebensmittelhersteller(
      "Butter GmbH", "Beispielweg", "2", 54321, "Beispielstadt");

  Milch milch =
      Milch("Vollmilch", hersteller1, "2023-12-31", 1.0, 0.99, "Kuhmilch", 3.5);
  Butter butter =
      Butter("Süßrahmbutter", hersteller2, "2024-01-15", 0.25, 1.49, "Süßrahm");

  print(milch.beschreibung());
  print(butter.beschreibung());
}
