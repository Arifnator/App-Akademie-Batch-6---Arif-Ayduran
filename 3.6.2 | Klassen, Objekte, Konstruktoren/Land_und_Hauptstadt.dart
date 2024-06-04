class Country {
  String name;
  int area;
  int population;
  Capital capital;

  Country(this.name, this.area, this.population, this.capital);

  String returnCountryDetails() {
    return "Das Land $name hat $area km2 Fläche und $population Einwohner. ${capital.returnCapitalDetails()}";
  }
}

class Capital {
  String name;
  int area;
  int population;
  Capital(this.name, this.area, this.population);

  String returnCapitalDetails() {
    return "Die Hauptstadt $name hat $area km2 Fläche und $population Einwohner.";
  }
}

void main() {
  List<Country> countryList = [
    Country("Deutschland", 357592, 83800000, Capital("Berlin", 891, 3645000)),
    Country("Türkei", 783562, 84980000, Capital("Ankara", 24521, 5663000)),
  ];

  countryList
      .add(Country("Italien", 301340, 60360000, Capital("Rom", 1285, 2873000)));

  countryList.forEach((country) => print(country.returnCountryDetails()));

  /*
  
  oder:

  for (Country country in countryList) {
    print(country.returnCountryDetails());
  }
  
  */
}
