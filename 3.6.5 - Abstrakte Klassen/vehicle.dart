abstract class Vehicle {
  int passengersAmount;
  String manufacturerName;

  Vehicle(this.passengersAmount, this.manufacturerName);

  void moveForwards();

  void moveBackwards();
}

class Car implements Vehicle {
  int passengersAmount;
  String manufacturerName;

  Car(this.passengersAmount, this.manufacturerName);

  @override
  void moveForwards() {
    print("Moving Forwards");
  }

  @override
  void moveBackwards() {
    print("Moving Backwards");
  }
}
