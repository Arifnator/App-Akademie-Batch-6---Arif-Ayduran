void main() {
  int act = 1;
  int add = 1;
  print(act);

  while (add < 100) {
    add++;
    print("+ $add");
    int result = act += add;
    print("Summe: $result");
  }

  for (int q = 1; q <= 10; q++) {
    int result = q * q;
    print("Die Quadratzahl von $q ist $result.");
  }

  int numbers = 0;

  while (numbers < 10) {
    numbers++;
    print(numbers);
  }

  int countBack = 10;

  while (countBack > 6) {
    countBack--;
    print(countBack);
  }

  int oneToFive = 0;

  do {
    oneToFive++;
    print(oneToFive);
  } while (oneToFive < 5);

  int tenToSix = 11;

  do {
    tenToSix--;
    print(tenToSix);
  } while (tenToSix > 6);

  List<int> zahlen = [1, 2, 3, 4, 5];
  for (int zahl in zahlen) {
    print(zahl);
  }
}
