/* Erstelle eine abstrakte Klasse Vehicle, die eine Methode move enthält.
Leite davon konkrete Klassen für Car, Bicycle und Boat ab, die jeweils die move-Methode implementieren.
Diskutiere, wie diese Klassen verwendet werden könnten, um die Bewegung verschiedener Fahrzeugtypen zu simulieren,
einschließlich spezifischer Details, wie z.B. ein Auto fährt, ein Fahrrad fährt und ein Boot segelt.

BONUS: Überführe das Diagramm in Dart Code. */

abstract class Vehicle {
  void move();
}

class Car implements Vehicle {
  @override
  void move() {
    print("Car is driving");
  }
}

class Bicycle implements Vehicle {
  @override
  void move() {
    print("Bicycle is driving");
  }
}

class Boat implements Vehicle {
  @override
  void move() {
    print("Boat is sailing");
  }
}
