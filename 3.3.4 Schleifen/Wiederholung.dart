import 'dart:io';

void main() {
  for (int i = 1; i <= 10; i++) {
    stdout.write("$i, ");
  }

  int act = 1;
  print("");
  print("-------------");
  print(act);

  for (int add = 2; add <= 100; add++) {
    print("+ $add");
    int result = act += add;
    print("Summe: $result");
  }
  print("-------------");



List<String> months = ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];
List<int> days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
// Die unterschiedlichen Tage der Monate habe ich nicht berücksichtigt (zb. Febr. 28 Tage)

for (String month in months) {
    print(month);
    for (int day in days) {
      stdout.write("$day, ");
    }
    print("");
    print("-------");
  }

  print("-------------");

  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      stdout.write("$i, ");
    }
  }

  print("");
  print("-------------");

  for (int i = 1; i <= 15; i++) {
    if ((i % 5 == 0) && (i % 3 == 0)) {
      stdout.write("$i: FizzBuzz, ");
    } else if (i % 3 == 0) {
      stdout.write("$i: Fizz, ");
    } else if (i % 5 == 0) {
      stdout.write("$i: Buzz, ");
    } else {
      stdout.write("$i, ");
    }
  }

  print("");
  print("-------------");

  for (int day = 0; day <= 7; day++) {
    switch (day) {
      case 1:
        print("Es ist Montag.");
      case 2:
        print("Es ist Dienstag.");
      case 3:
        print("Es ist Mittwoch.");
      case 4:
        print("Es ist Donnerstag.");
      case 5:
        print("Es ist Freitag.");
      case 6:
        print("Es ist Samstag.");
      case 7:
        print("Es ist Sonntag.");
    }
  }

  print("");
  print("-------------");

  for (int i = 1; i <= 100; i++) {
    print(i);
    if (i % 7 == 0) {
      break;
    }
  }
}
