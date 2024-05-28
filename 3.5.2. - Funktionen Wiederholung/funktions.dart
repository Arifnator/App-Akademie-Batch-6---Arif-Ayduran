void helloWorld() {
  print("Hello World.");
}

void helloName(String name) {
  print("Hello $name.");
}

int summe(int a, int b) {
  return a + b;
}

int groessereZahl(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

bool geradeZahl(int a) {
  if (a % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

int sumList(List<int> numbers) {
  int summe = 0;
  for (int number in numbers) {
    summe += number;
  }
  return summe;
}

double durchschnitt(List<double> numbers) {
  double summe = 0;
  for (double number in numbers) {
    summe += number;
  }
  summe /= numbers.length;
  return summe;
}

String groesserNull(int a) {
  if (a > 0) {
    return "Die Zahl ist eine positive Zahl";
  } else if (a == 0) {
    return "Die Zahl ist 0";
  } else {
    return "Die Zahl ist eine negative Zahl";
  }
}

List<String> zeichenketten(String word) {
  List<String> zeichen = [];
  for (int i = 0; i < word.length; i++) {
    zeichen.add(word[i]);
  }
  return zeichen;
}

Map<String, int> buchstaben(List<String> words) {
  Map<String, int> zwischenListe = {};
  for (String word in words) {
    zwischenListe[word] = word.length;
  }
  return zwischenListe;
}

int produkt(int a, int b) {
  return a *= b;
}

int reverse(int a) {
  return a *= -1;
}

int smallestNumber(List<int> numbers) {
  int smallest = numbers[0];
  for (int number in numbers) {
    if (number < smallest) {
      smallest = number;
    }
  }
  return smallest;
}

double temperatur(double d, bool cf) {
  if (cf == false) {
    return (d - 32) / 1.8;
  } else {
    return d * 1.8 + 32;
  }
}

String zusammenfuehren(List<String> zeichenketten) {
  String zusammen = "";
  for (String zeichenkette in zeichenketten) {
    zusammen = zusammen + zeichenkette;
  }
  return zusammen;
}

bool istPrimzahl(int zahl) {
  if (zahl <= 1) {
    return false;
  }

  for (int i = 2; i < zahl; i++) {
    if (zahl % i == 0) {
      return false;
    }
  }

  return true;
}
