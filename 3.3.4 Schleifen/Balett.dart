void main() {
  int r = 0;

  while (r < 3) {
    for (int rotation = 1; rotation < 11; rotation++) {
      print(rotation);
    }
    r++;
    print("Volle Umdrehungen: $r");
  }

  int speed = 0;
  do {
    print(speed);
    speed += 2;
  } while (speed <= 30);

  List<int> positions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (int position in positions) {
    print(position);
  }
}
