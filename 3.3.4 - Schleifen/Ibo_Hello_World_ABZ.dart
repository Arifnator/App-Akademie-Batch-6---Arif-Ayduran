void main() {
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  String hello = "HELLO WORLD";
  String out = "";

  for (int i = 0; i < hello.length; i++) {
    for (String letter in alphabets) {
      print(out+letter);
      if (letter == hello[i]) {
        out += letter;
        break;
      }
    }
  }
}