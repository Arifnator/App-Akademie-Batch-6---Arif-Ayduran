import 'dart:io';

void main() {
  int zeile = 4;
  int spalte = 8;

  for (int i = 0; i < zeile; i++) {
    for (int j = 0; j < spalte; j++) {
      if ((i + j) % 2 == 0) {
        stdout.write("*");
      } else {
        stdout.write("#");
      }
    }
    print("");
  }
}
