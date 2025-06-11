// Dart OOP Concepts Demonstration

// 1. Abstraction: Abstract class Vehicle
abstract class Vehicle {
  void start();
  void stop();
}

// 2. Inheritance: Car extends Vehicle
class Car extends Vehicle {
  @override
  void start() => print('Car starts');

  @override
  void stop() => print('Car stops');
}

// 3. Encapsulation: BankAccount class with private data
class BankAccount {
  final String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient balance or invalid amount');
    }
  }
}

// 4. Polymorphism: Animal superclass and method overriding
class Animal {
  void speak() => print('The animal makes a sound');
}

class Cat extends Animal {
  @override
  void speak() => print('The cat meows');
}

class Cow extends Animal {
  @override
  void speak() => print('The cow moos');
}

void makeAnimalSpeak(Animal animal) {
  animal.speak();
}

// Main function to run everything
void main() {
  // Abstraction
  Vehicle myCar = Car();
  myCar.start();
  myCar.stop();

  print(''); // Line break

  // Encapsulation
  BankAccount account = BankAccount('123456', 500.0);
  print('Initial balance: \$${account.balance.toStringAsFixed(2)}');
  account.deposit(150.0);
  account.withdraw(100.0);
  print('Final balance: \$${account.balance.toStringAsFixed(2)}');

  print(''); // Line break

  // Polymorphism
  makeAnimalSpeak(Cat());
  makeAnimalSpeak(Cow());
}
