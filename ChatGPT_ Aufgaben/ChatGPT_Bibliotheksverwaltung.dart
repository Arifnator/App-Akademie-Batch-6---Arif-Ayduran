/*
Aufgabe: Bibliotheksverwaltung
Erstellen Sie ein Programm zur Verwaltung von Büchern in einer Bibliothek.
Das Programm soll verschiedene Buchtypen und ihre Eigenschaften verwalten.
Die Aufgabe umfasst die Erstellung von Klassen und deren Instanzen sowie die Implementierung von Methoden zur Verarbeitung von Buchdaten.

Anforderungen:
Klasse Buch:

Attribute:
titel (String)
autor (String)
erscheinungsjahr (int)
isbn (String)
Methoden:
beschreibeBuch(): Gibt eine Beschreibung des Buches als String zurück.
Klasse Roman, die von Buch erbt:

Zusätzliche Attribute:
genre (String)
Methoden:
Überschreiben der Methode beschreibeBuch(), um das Genre in der Beschreibung hinzuzufügen.
Klasse Sachbuch, die von Buch erbt:

Zusätzliche Attribute:
thema (String)
Methoden:
Überschreiben der Methode beschreibeBuch(), um das Thema in der Beschreibung hinzuzufügen.
Hauptprogramm:

Erstellen Sie mehrere Instanzen der Klassen Roman und Sachbuch.
Speichern Sie diese Instanzen in einer Liste.
Durchlaufen Sie die Liste und rufen Sie für jedes Buch die Methode beschreibeBuch() auf, um die Beschreibung des Buches auszugeben.
*/

class Buch {
  String titel;
  String autor;
  int erscheinungsjahr;
  String isbn;

  Buch(this.titel, this.autor, this.erscheinungsjahr, this.isbn);

  String beschreibeBuch() =>
      "Buch Titel: $titel, Autor: $autor, Erscheinungsjahr: $erscheinungsjahr, ISBN: $isbn";
}

class Roman extends Buch {
  String genre;

  Roman(
      String titel, String autor, int erscheinungsjahr, String isbn, this.genre)
      : super(titel, autor, erscheinungsjahr, isbn);

  @override
  String beschreibeBuch() => "${super.beschreibeBuch()}, Genre: $genre";
}

class Sachbuch extends Buch {
  String thema;

  Sachbuch(
      String titel, String autor, int erscheinungsjahr, String isbn, this.thema)
      : super(titel, autor, erscheinungsjahr, isbn);

  @override
  String beschreibeBuch() => "${super.beschreibeBuch()}, Thema: $thema";
}

void main() {
  List<Buch> buecherList = [
    Roman('Der Herr der Ringe', 'J.R.R. Tolkien', 1954, '978-0261102385',
        'Fantasy'),
    Sachbuch('Eine kurze Geschichte der Zeit', 'Stephen Hawking', 1988,
        '978-0553380163', 'Physik'),
    Roman('1984', 'George Orwell', 1949, '978-0451524935', 'Dystopie'),
    Sachbuch('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2011,
        '978-0062316110', 'Geschichte')
  ];

  buecherList.forEach((buch) => print(buch.beschreibeBuch()));
}
