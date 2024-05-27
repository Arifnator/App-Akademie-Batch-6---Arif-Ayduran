void main() {
  List<String> names = ["Laura", "Kai", "Sobhi", "David"];
  firstLetter(names);
}

void firstLetter(List names) {
  for (String name in names) {
    print("Der erste Buchstabe von " + name + " ist " + name[0]);
  }
}
