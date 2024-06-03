import 'dart:io';

void main() {
  bool hasDrivingLicense = false;
  int age = 22;
  bool hasCar = true;

  if (hasDrivingLicense == true && age >= 18 && hasCar == true) {
    print("Du fährst Auto!");
  } else {
    print("Du kannst nicht fahren!");
  }

  print("Gib mir eine Zahl ");

  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Keine Eingabe");
  } else {
    int inputInt = int.parse(input);
    print(
        "Die Summe der Zahlen von 1 bis $inputInt ist ${sumCounter(inputInt)}");
  }
}

int sumCounter(int n) {
  int a = 1;
  for (int i = 1; i <= n; i++) {
    a += i;
  }
  return a;
}
