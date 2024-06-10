/*
Erstelle zuerst ein Klassendiagramm, in welchem du die einzelnen Klassen mit ihren Attributen abbildest. Hierfür kannst du z.B. draw.io oder ein Blatt + Stift verwenden.
Erstelle zwei Klassen: Autor und Buch.
Die Klasse Autor soll die folgenden Attribute haben:
Name
Geburtsjahr
Nationalität
Die Klasse Buch soll die folgenden Attribute haben:
Titel
Veröffentlichungsjahr
Genre
Autor (als Instanz der Klasse Autor)
Erzeuge eine Methode getBuchInfo(), die eine Beschreibung des Buches einschließlich der Informationen über den Autor als Zeichenkette zurückgibt.
Erzeuge die Objekte in der Main-Methode.

Erstelle eine weitere Klasse Student mit den Attributen Name und bookList.
Das Attribut BookList soll eine Liste mit Objekten der Buch Klasse der letzten Aufgabe beinhalten. 
Erweitere das Klassendiagramm aus der vorherigen Aufgabe.
Erzeuge mindestens 2 Student Objekte in der Main Funktion und fülle die bookList mit Büchern. 

*/

class Autor {
  String name;
  int geburtsjahr;
  String nationalitaet;

  Autor(this.name, this.geburtsjahr, this.nationalitaet);
}

class Buch {
  String titel;
  int veroffentlichungsjahr;
  String genre;
  Autor autor;

  Buch(this.titel, this.veroffentlichungsjahr, this.genre, this.autor);

  String getBuchInfo() {
    return "Titel: $titel\nVeröffentlichungsjahr: $veroffentlichungsjahr\nGenre: $genre\nAutor: ${autor.name}\nAutor Geburtjahr: ${autor.geburtsjahr}\nAutor Nationalität: ${autor.nationalitaet}";
  }
}

class Student {
  String name;
  List<Buch> bookList;

  Student(this.name, this.bookList);
}

void main() {
  print(Buch("...", 0, "...", Autor("...", 0, "...")).getBuchInfo());

  print("");

  Student student1 = Student("Arif", [
    Buch("...", 0, "...", Autor("...", 0, "...")),
    Buch("...", 0, "...", Autor("...", 0, "...")),
    Buch("...", 0, "...", Autor("...", 0, "..."))
  ]);

  print("${student1.name}'s Bücher sind:\n");
  student1.bookList.forEach((buch) => print(buch.getBuchInfo() + "\n"));
}
