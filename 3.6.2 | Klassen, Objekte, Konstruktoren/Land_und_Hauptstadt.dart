class Country {
  String name;
  int area;
  double population;
  Capital capital;

  Country(this.name, this.area, this.population, this.capital);

  String returnCountryDetails() {
    return "Das Land $name hat $area km2 Fläche und $population Mio. Einwohner. ${capital.returnCapitalDetails()}";
  }
}

class Capital {
  String name;
  int area;
  double population;
  Capital(this.name, this.area, this.population);

  String returnCapitalDetails() {
    return "Die Hauptstadt $name hat $area km2 Fläche und $population Mio. Einwohner.";
  }
}

void main() {
  List<Country> countryList = [
    Country("Deutschland", 357592, 83.80, Capital("Berlin", 891, 3.64)),
    Country("Türkei", 783562, 84.98, Capital("Ankara", 24521, 5.66)),
  ];

  countryList.add(Country("Italien", 301340, 60.36, Capital("Rom", 1285, 2.87)));

  countryList.forEach((country) => print(country.returnCountryDetails()));

  /*
  
  oder:

  for (Country country in countryList) {
    print(country.returnCountryDetails());
  }
  
  */
}
