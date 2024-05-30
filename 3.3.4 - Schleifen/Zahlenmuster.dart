void main() {
  for (int i = 1; i <= 3; i++) {
    String leer = "";
    for (int j = 1; j <= 3; j++) {
      int number = (i - 1) * 3 + j;
      leer += number.toString() + " ";
    }
    print(leer);
  }
  int number = 1;

  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print(number);
      number++;
    }
    print("");
  } 
}
