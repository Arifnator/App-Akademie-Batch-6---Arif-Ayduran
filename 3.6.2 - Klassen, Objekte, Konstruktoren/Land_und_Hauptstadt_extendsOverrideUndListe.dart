class Capital {
  String cName;
  int cArea;
  int cPopulation;

  Capital(this.cName, this.cArea, this.cPopulation);

  String returnDetails() {
    return "Die Hauptstadt $cName hat $cArea km² Fläche und $cPopulation Einwohner.";
  }
}

class Country extends Capital {
  String name;
  int area;
  int population;

  Country(this.name, this.area, this.population, String cName, int cArea,
      int cPopulation)
      : super(cName, cArea, cPopulation);

  @override
  String returnDetails() {
    return "Das Land $name hat $area km² Fläche und $population Einwohner. ${super.returnDetails()}";
  }
}

void main() {
  List<Country> countryList = [
    Country("Deutschland", 357592, 83800000, "Berlin", 891, 3645000),
    Country("Türkei", 783562, 84980000, "Ankara", 24521, 5663000),
    Country("Italien", 301340, 60360000, "Rom", 1285, 2873000)
  ];

  countryList.forEach((country) => print(country.returnDetails()));
}
