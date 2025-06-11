// Abstract class to demonstrate abstraction
abstract class Animal {
  void speak(); // Abstract method

  void info() {
    print("This is an animal.");
  }
}

// Encapsulated class: handles private data and provides controlled access
class Pet {
  String _name; // Private variable
  int _age;

  Pet(this._name, this._age);

  // Getter for name
  String get name => _name;

  // Getter and setter for age with validation
  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Invalid age. Age must be positive.");
    }
  }
}

// Dog class inherits from Pet and implements Animal behavior
class Dog extends Pet implements Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void speak() {
    print("$name the $breed says: Woof");
  }

  @override
  void info() {
    print("Dog is a loyal animal.");
  }
}

// Cat class inherits from Pet and implements Animal behavior
class Cat extends Pet implements Animal {
  String color;

  Cat(String name, int age, this.color) : super(name, age);

  @override
  void speak() {
    print("$name the $color cat says: Meow");
  }

  @override
  void info() {
    print("Cats are independent animals.");
  }
}

void main() {
  // Create instances of Dog and Cat
  Dog dog = Dog("Buddy", 3, "Golden Retriever");
  Cat cat = Cat("Whiskers", 2, "Black");

  // Test encapsulation
  print("Dog's name: ${dog.name}, age: ${dog.age}");
  dog.age = -5; // Invalid input
  dog.age = 5;  // Valid input
  print("Updated age: ${dog.age}");

  // Demonstrate polymorphism
  List<Animal> animals = [dog, cat];
  for (var animal in animals) {
    animal.speak(); // Calls the overridden method in each class
    animal.info();  // Each class has its own version
  }
}
