class Rectangle {
  String name;
  double x;
  double y;
  String color;

  Rectangle(this.name, this.x, this.y, this.color);

  double scopeCalc() => 2 * x + 2 * y;

  double areaCalc() => x * y;
}

void main() {
  Rectangle rec1 = Rectangle("Rechteck 1", 10, 20, "Rot");
  Rectangle rec2 = Rectangle("Rechteck 2", 30, 244, "Grün");

  print(
      "Der Umfang von ${rec1.name} (mit x: ${rec1.x}, y: ${rec1.y}) ist ${rec1.scopeCalc()}. Das Rechteck ist ${rec1.color}.");
  print(
      "Der Umfang von ${rec2.name} (mit x: ${rec2.x}, y: ${rec2.y}) ist ${rec2.scopeCalc()}. Das Rechteck ist ${rec2.color}.");
  print(
      "Die Fläche von ${rec1.name} (mit x: ${rec1.x}, y: ${rec1.y}) ist ${rec1.areaCalc()}. Das Rechteck ist ${rec1.color}.");
  print(
      "Die Fläche von ${rec2.name} (mit x: ${rec2.x}, y: ${rec2.y}) ist ${rec2.areaCalc()}. Das Rechteck ist ${rec2.color}.");

  rec1.x = 3;
  rec2.x = 9;

  print(
      "Der neue Umfang von ${rec1.name} (mit x: ${rec1.x}, y: ${rec1.y}) ist ${rec1.scopeCalc()}. Das Rechteck ist ${rec1.color}.");
  print(
      "Der neue Umfang von ${rec2.name} (mit x: ${rec2.x}, y: ${rec2.y}) ist ${rec2.scopeCalc()}. Das Rechteck ist ${rec2.color}.");
  print(
      "Die neue Fläche von ${rec1.name} (mit x: ${rec1.x}, y: ${rec1.y}) ist ${rec1.areaCalc()}. Das Rechteck ist ${rec1.color}.");
  print(
      "Die neue Fläche von ${rec2.name} (mit x: ${rec2.x}, y: ${rec2.y}) ist ${rec2.areaCalc()}. Das Rechteck ist ${rec2.color}.");
}
