/*
Aufgabe: Student-Verwaltungssystem
Erstellen Sie ein Programm zur Verwaltung von Studenten und Kursen. 
Das Programm soll verschiedene Studententypen und ihre Eigenschaften verwalten.
Die Aufgabe umfasst die Erstellung von Klassen und deren Instanzen sowie die Implementierung von Methoden zur Verarbeitung von Studentendaten.

Anforderungen:
Klasse Person:

Attribute:
name (String)
alter (int)
Methoden:
beschreibePerson(): Gibt eine Beschreibung der Person als String zurück.
Klasse Student, die von Person erbt:

Zusätzliche Attribute:
matrikelnummer (String)
Methoden:
Überschreiben der Methode beschreibePerson(), um die Matrikelnummer in der Beschreibung hinzuzufügen.
Klasse Kurs:

Attribute:
kursName (String)
kursCode (String)
studentenListe (List<Student>)

Methoden:
fuegeStudentHinzu(Student student): Fügt einen Studenten zur Kursliste hinzu.
entferneStudent(Student student): Entfernt einen Studenten von der Kursliste.
beschreibeKurs(): Gibt eine Beschreibung des Kurses und der eingeschriebenen Studenten als String zurück.
Hauptprogramm:

Erstellen Sie mehrere Instanzen der Klassen Student und Kurs.
Fügen Sie Studenten zu verschiedenen Kursen hinzu.
Geben Sie die Beschreibungen der Kurse und der eingeschriebenen Studenten aus.
*/

class Person {
  String fullName;
  int alter;

  Person(this.fullName, this.alter);

  String beschreibePerson() => "Name: $fullName, Alter: $alter";
}

class Student extends Person {
  String matrikelnummer;

  Student(String fullName, int alter, this.matrikelnummer)
      : super(fullName, alter);

  @override
  String beschreibePerson() =>
      super.beschreibePerson() + ", Matrikelnummer: $matrikelnummer";
}

class Kurs {
  String kursName;
  String kursCode;
  List<Student> studentenListe = [];

  Kurs(this.kursName, this.kursCode, this.studentenListe);

  void fuegeStudentHinzu(Student student) {
    studentenListe.add(student);
  }

  void entferneStudent(Student student) {
    studentenListe.remove(student);
  }

  String beschreibeKurs() =>
      "\nKurs Name: $kursName, Kurs Code: $kursCode\n\nEingeschriebene Studenten:\n" +
      studentenListe.map((student) => student.beschreibePerson()).join("\n");

  /*
      ODER:
      String beschreibeKurs() {
      String beschreibung = "Kurs: $kursName, KursCode: $kursCode\nEingeschriebene Studenten:";
      for (var student in studentenListe) {
        beschreibung += "\n${student.beschreibePerson()}";
      }
      return beschreibung;
  }
  */
}

void main() {
  List<Student> alleStudentenListe = [
    Student("Peter Pan", 23, "123456"),
    Student("laura", 29, "654321"),
    Student("Paul Wache", 20, "283729"),
    Student("Lisa Williams", 26, "210192"),
    Student("Hans Cool", 22, "234564"),
  ];

  List<Kurs> alleKurseListe = [
    Kurs("UX/UI", "UXUI92", [alleStudentenListe[0], alleStudentenListe[1]]),
    Kurs("Flutter", "FL20092", [alleStudentenListe[2], alleStudentenListe[3]]),
  ];

  alleKurseListe[0].fuegeStudentHinzu(alleStudentenListe[4]);
  alleKurseListe[0].entferneStudent(alleStudentenListe[0]);
  alleKurseListe[1].fuegeStudentHinzu(alleStudentenListe[0]);

  alleKurseListe.forEach((kurs) => print(kurs.beschreibeKurs()));
}
