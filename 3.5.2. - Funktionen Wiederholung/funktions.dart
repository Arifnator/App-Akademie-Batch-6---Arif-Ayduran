import 'dart:io';

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

int reverseNumber(int number) {
  int reversedNumber = 0;

  while (number != 0) {
    int lastDigit = number % 10;
    reversedNumber = reversedNumber * 10 + lastDigit;
    number = number ~/ 10;
  }

  return reversedNumber;
}

Map<String, int> timeFromSeconds(int s) {
  Map<String, int> time = {};
  int secondsRemain = s % 60;
  int minutesRemain = (s ~/ 60) % 60;
  int hours = s ~/ 3600;
  time.addAll({"h": hours, "m": minutesRemain, "s": secondsRemain});
  return time;
}

bool anagramm(String a, String b) {
  if (a.length != b.length) {
    return false;
  }

  List<String> zeichenkettenA = a.split('')..sort();
  List<String> zeichenkettenB = b.split('')..sort();

  print(zeichenkettenB);
  print(zeichenkettenA);

  for (int i = 0; i < a.length; i++) {
    if (zeichenkettenA[i] != zeichenkettenB[i]) {
      return false;
    }
  }

  return true;
}

double multiplicationAdvanced(double a, double b) {
  double ergebnis = 0;

  for (int i = 0; i < b; i++) {
    ergebnis += a;
  }

  return ergebnis;
}

List<String> wordsInText(String text) {
  List<String> words = [];
  String currentWord = '';

  for (int i = 0; i < text.length; i++) {
    if (text[i] != ' ') {
      currentWord += text[i];
    } else {
      words.add(currentWord);
      currentWord = '';
    }
  }
  words.add(currentWord);

  return words;
}

Map<String, int> anzahlText(String text) {
  int spaces = 0;
  int vocals = 0;
  int specialChars = 0;

  RegExp letterOrDigit = RegExp(r'[a-zA-Z0-9]');

  for (int i = 0; i < text.length; i++) {
    if (text[i] == " ") {
      spaces++;
    } else if (letterOrDigit.hasMatch(text[i])) {
      if (text[i].toLowerCase() == "a" ||
          text[i].toLowerCase() == "e" ||
          text[i].toLowerCase() == "i" ||
          text[i].toLowerCase() == "o" ||
          text[i].toLowerCase() == "u") {
        vocals++;
      }
    } else {
      specialChars++;
    }
  }

  return {
    "Leerzeichen": spaces,
    "Vokale": vocals,
    "Sonderzeichen": specialChars
  };
}

void fizzBuzz(int max) {
  Map<int, String> fizzMap = {};

  for (int i = 1; i <= max; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      fizzMap[i] = "FizzBuzz";
    } else if (i % 3 == 0) {
      fizzMap[i] = "Fizz";
    } else if (i % 5 == 0) {
      fizzMap[i] = "Buzz";
    } else {
      fizzMap[i] = "";
    }
  }
  print(fizzMap);
}

void square(int q) {
  for (int i = 0; i < q; i++) {
    stdout.write("#");
    for (int i = 1; i < q; i++) {
      stdout.write(" #");
    }
    print("");
  }
}

bool palindrom(String text) {
  for (int i = 0; i < text.length / 2; i++) {
    if (text.toLowerCase()[i] != text.toLowerCase()[text.length - i - 1]) {
      return false;
    }
  }
  return true;
}

bool klammer(String input) {
  int anzahlKlammerAuf = 0;
  int anzahlKlammerZu = 0;

  for (int i = 0; i < input.length; i++) {
    if (input[i] == "(") {
      anzahlKlammerAuf++;
    } else if (input[i] == ")") {
      anzahlKlammerZu++;
    }
  }

  if (anzahlKlammerZu == anzahlKlammerAuf) {
    return true;
  } else {
    return false;
  }
}