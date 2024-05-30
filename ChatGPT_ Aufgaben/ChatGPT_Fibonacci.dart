import 'dart:io';

void main() {
  print("Geben Sie die Anzahl der Fibonacci-Terme ein:");
  fibonacci();
}

void fibonacci() {
  String? n = stdin.readLineSync();
  List<int> list = [0, 1];
  if (n!.isEmpty) {
    print("Keine Eingabe. Bitte geben Sie eine positive Zahl ein:");
    return fibonacci();
  } else if (int.tryParse(n) == null || int.parse(n) <= 0) {
    print("Falsche Eingabe. Bitte geben Sie eine positive Zahl ein:");
    return fibonacci();
  } else {
    if (int.parse(n) == 1) {
      print("Der erste Term der Fibonacci-Folge ist: [0]");
    } else {
      for (int i = 2; i < int.parse(n); i++) {
        list.add(list[i - 1] + list[i - 2]);
      }
      print("Die ersten ${int.parse(n)} Terme der Fibonacci-Folge sind: $list");
    }
  }
}
