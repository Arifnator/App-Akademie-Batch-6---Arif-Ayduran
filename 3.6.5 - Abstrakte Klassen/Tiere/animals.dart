import 'dart:io';
import "animal.dart";

class Dog implements Animal {
  @override
  String name;
  int age;
  String race;

  Dog(this.name, this.age, this.race);

  @override
  void descriptAnimal() {
    stdout.write("Dog Name: $name, Age: $age");
  }

  @override
  void raceAnimal() {
    stdout.write(", Race: $race\n");
  }
}

class Cat implements Animal {
  @override
  String name;
  int age;
  String race;

  Cat(this.name, this.age, this.race);

  @override
  void descriptAnimal() {
    stdout.write("Cat Name: $name, Age: $age");
  }

  @override
  void raceAnimal() {
    stdout.write(", Race: $race\n");
  }
}
