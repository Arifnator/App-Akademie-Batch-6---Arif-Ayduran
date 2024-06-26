void printNameAges(List<String> names, List<int> birthYears) {
  for (int i = 0; i < names.length; i++) {
    int age = ageFromBirthYear(birthYears[i]);
    print("${names[i]} ist ${age.toString()} Jahre alt.");
  }
}

int ageFromBirthYear(int birthYear) {
  return 2024 - birthYear;
}

void main() {
  List<String> names = ["Laura", "Kai", "Sobhi", "David"];
  List<int> birthYears = [1958, 2001, 2016, 1649];

  printNameAges(names, birthYears);
}
