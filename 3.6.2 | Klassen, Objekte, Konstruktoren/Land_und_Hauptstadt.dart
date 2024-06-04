class Country {
  String name;
  int area;
  int population;
  Capital capital;

  Country(this.name, this.area, this.population, this.capital);

  void printCountryDetails() {
    print(
        "Das Land $name hat $area m2 Fläche und $population Einwohner. ${capital.printCapitalDetails()}");
  }
}

class Capital {
  String name;
  int area;
  int population;
  Capital(this.name, this.area, this.population);

  String printCapitalDetails() {
    return "Die Hauptstadt $name hat $area m2 Fläche und $population Einwohner.";
  }
}

void main() {
  Country country1 = Country(
      "Deutschland", 357592, 83800000, Capital("Berlin", 891800, 3645000));
  Country country2 =
      Country("Türkei", 783562, 84980000, Capital("Ankara", 24521000, 5663000));

  country1.printCountryDetails();
  country2.printCountryDetails();
}
