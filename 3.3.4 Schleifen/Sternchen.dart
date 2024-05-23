import 'dart:io';

void main() {

print("Bitte geben sie die Zeilenanzahl ein.");
int? zeile = int.tryParse(stdin.readLineSync()!);

print("Bitte geben sie die Spaltenanzahl ein.");
int? spalte = int.tryParse(stdin.readLineSync()!);

print("Bitte geben sie das erste Muster ein.");
String muster1 = stdin.readLineSync()!;

print("Bitte geben sie das zweite Muster ein.");
String muster2 = stdin.readLineSync()!;


if (spalte != null && zeile != null){
  for (int i = 0; i < zeile; i++) {
    for (int j = 0; j < spalte; j++) {
      if ((i + j) % 2 == 0) {
        stdout.write(muster1);
      } else {
        stdout.write(muster2);
      }
    }
    print("");
  } 


}else {

  print("Ungültige Eingabe!");}
}