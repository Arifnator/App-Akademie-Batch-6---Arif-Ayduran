void main() {
  print(generatePrimes(1000));
}

List<int> generatePrimes(int n) {
  int i = 0;
  List<int> list = [];
  while (i <= n) {
    if (istPrimzahl(i)) {
      list.add(i);
    }
    i++;
  }
  return list;
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