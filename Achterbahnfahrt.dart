import "dart:io";

void main() {
  double heightChild;
  double ageChild;

  print("Bitte geben Sie die Größe des Kindes ein (Format Beispiel: 1.5):");
  String? inputHeightChild = stdin.readLineSync();
  print("\nBitte geben Sie das Alter des Kindes ein (Format Beispiel: 4):");
  String? inputAgeChild = stdin.readLineSync();

  if (inputHeightChild != null && inputAgeChild != null) {
    double? doubleHeight = double.tryParse(inputHeightChild);
    double? doubleAge = double.tryParse(inputAgeChild);

    if (doubleHeight != null && doubleAge != null) {
      heightChild = doubleHeight;
      ageChild = doubleAge;
      if (heightChild >= 1.5) {
        print("Das Kind kann Achterbahn fahren!");
          if (ageChild<11){
          print ("Das Kind muss einen Helm tragen");
          }      
      } else {
        print("Das Kind ist zu klein für die Achterbahn.");
      }
    } else {
      print("Ungültiges Format! Bitte geben Sie Zahlen im richtigen Format ein.");
    }
  } else {
    print("Bitte geben Sie etwas ein! (Beachten Sie die Formatierung!)");
  }
}

// Irgendwie gings nicht mit leer lassen