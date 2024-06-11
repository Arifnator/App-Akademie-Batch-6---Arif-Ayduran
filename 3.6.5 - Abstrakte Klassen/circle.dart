
import 'dart:math';

abstract class Shape {
  double calculateArea();
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * radius * radius;
  }
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

class Triangle implements Shape {
  double base;
  double height;

  Triangle(this.base, this.height);

  @override
  double calculateArea() {
    return 0.5 * base * height;
  }
}

void main() {
  Shape circle = Circle(5.0);
  Shape rectangle = Rectangle(4.0, 6.0);
  Shape triangle = Triangle(3.0, 7.0);

  print('The area of the circle is: ${circle.calculateArea()}');
  print('The area of the rectangle is: ${rectangle.calculateArea()}');
  print('The area of the triangle is: ${triangle.calculateArea()}');
}
