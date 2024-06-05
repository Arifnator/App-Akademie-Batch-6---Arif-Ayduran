/*
Erstelle eine Klasse für einen Lebensmittelhersteller mit den Attributen 
Name
Straße
Hausnummer
Postleitzahl
Stadt

Konstruiere ein weiteres Attribut “Adresse”, das aus den Attributen oben erzeugt wird.

Tipp: Nutze entweder die : (Doppelpunkt) oder { } Body Syntax um das Attribut dynamisch zu erzeugen.
*/

class Lebensmittelhersteller {
  String name;
  String strasse;
  String hausnummer;
  int postleitzahl;
  String stadt;
  String adresse;

  Lebensmittelhersteller(String name, String strasse, String hausnummer,
      int postleitzahl, String stadt)
      : this.name = name,
        this.strasse = strasse,
        this.hausnummer = hausnummer,
        this.postleitzahl = postleitzahl,
        this.stadt = stadt,
        this.adresse = "$name, $strasse, $hausnummer, $postleitzahl, $stadt";
}

class Lebensmittelhersteller2 {
  String name;
  String strasse;
  String hausnummer;
  int postleizahl;
  String stadt;
  String? adresse;

  Lebensmittelhersteller2(
      this.name, this.strasse, this.hausnummer, this.postleizahl, this.stadt)
      : this.adresse = "$name, $strasse, $hausnummer, $postleizahl, $stadt";
}
