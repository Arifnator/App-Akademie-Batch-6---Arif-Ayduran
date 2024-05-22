void main() {
  List<int> triangle = [1, 12, 123, 1234];

  for (int i in triangle) {
    print(i);
  }

  for (int i = 1; i <= 4; i++) {
    String leer = "";
    for (int j = 1; j <= i; j++) {
      leer += j.toString();
    }
    print(leer);
  }
}
