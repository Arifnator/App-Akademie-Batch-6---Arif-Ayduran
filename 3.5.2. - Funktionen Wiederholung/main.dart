import "funktions.dart";

void main() {
  List<int> nummern1 = [10, 12, 2, 146, 61452];
  List<double> nummern2 = [12, 22, 14, 2];
  List<String> namen = [
    "Arif",
    "Marco",
    "Ralf",
    "Björn",
    "Jürgen",
    "Maximilian"
  ];

  helloWorld();
  helloName("Arif");
  print(summe(3, 14));
  print(groessereZahl(1893, 1991));
  print(geradeZahl(830));
  print(sumList(nummern1));
  print(durchschnitt(nummern2));
  print(groesserNull(-13));
  print(zeichenketten("App Akademie"));

  Map<String, int> buchstabenNamen = {};
  buchstabenNamen = (buchstaben(namen));
  for (String name in buchstabenNamen.keys) {
    int laenge = name.length;
    print("$name --> $laenge");
  }

  int p1 = produkt(2, 4);
  print(produkt(p1, 5));

  print(reverse(-34));
  print(smallestNumber(nummern1));

  double degree = 43.3;
  bool isFahrenheit = false;

  if (isFahrenheit == false) {
    print("${temperatur(degree, isFahrenheit)} °C");
  } else {
    print("${temperatur(degree, isFahrenheit)} °F");
  }

  print(zusammenfuehren(namen));

  int zahl = 13;
  if (istPrimzahl(zahl)) {
    print('$zahl ist eine Primzahl.');
  } else {
    print('$zahl ist keine Primzahl.');
  }
}
