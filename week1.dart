// Dart Program implementing Data Types, Type Conversion, Control Flow, and a Combined Example

void main() {
  // DATA TYPES IMPLEMENTATION

  // Defining and initializing variables of different types
  int age = 25;
  double price = 99.99;
  String name = "Dart";
  bool isRegistered = true;
  List<int> scores = [10, 45, 78, 102, 3];

  print("Data Types:");
  print("Age (int): $age");
  print("Price (double): $price");
  print("Name (String): $name");
  print("Is Registered (bool): $isRegistered");
  print("Scores (List<int>): $scores");
  print("\n");

  // TYPE CONVERSION

  // Function to convert String to int
  int stringToInt(String value) {
    return int.parse(value);
  }

  // Function to convert String to double
  double stringToDouble(String value) {
    return double.parse(value);
  }

  // Function to convert int to String
  String intToString(int value) {
    return value.toString();
  }

  // Function to convert int to double
  double intToDouble(int value) {
    return value.toDouble();
  }

  // Function that takes a string, converts it, and displays results
  void convertAndDisplay(String numberStr) {
    int intValue = stringToInt(numberStr);
    double doubleValue = stringToDouble(numberStr);
    print("Converted from String '$numberStr':");
    print("As int: $intValue");
    print("As double: $doubleValue");
    print("\n");
  }

  convertAndDisplay("42");

  // CONTROL FLOW

  // If-else to check if a number is positive, negative, or zero
  int numberCheck = -5;
  if (numberCheck > 0) {
    print("$numberCheck is positive.");
  } else if (numberCheck < 0) {
    print("$numberCheck is negative.");
  } else {
    print("$numberCheck is zero.");
  }

  // If-else to check voting eligibility
  int voterAge = 17;
  if (voterAge >= 18) {
    print("Eligible to vote.");
  } else {
    print("Not eligible to vote.");
  }

  print("\n");

  // Switch-case to print day of the week
  int dayNumber = 3;
  switch (dayNumber) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day number");
  }

  print("\n");

  // For loop from 1 to 10
  print("For Loop (1 to 10):");
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  print("\n");

  // While loop from 10 to 1
  print("While Loop (10 to 1):");
  int j = 10;
  while (j >= 1) {
    print(j);
    j--;
  }

  print("\n");

  // Do-while loop from 1 to 5
  print("Do-While Loop (1 to 5):");
  int k = 1;
  do {
    print(k);
    k++;
  } while (k <= 5);

  print("\n");

  // COMBINING DATA TYPES AND CONTROL FLOW

  List<int> numbers = [2, 13, 7, 100, 125, 0];
  print("Analyzing Numbers in List:");
  for (int num in numbers) {
    print("Number: $num");

    // Check if even or odd
    if (num % 2 == 0) {
      print("Even");
    } else {
      print("Odd");
    }

    // Categorize using switch-like structure (with ranges)
    if (num >= 1 && num <= 10) {
      print("Category: Small");
    } else if (num >= 11 && num <= 100) {
      print("Category: Medium");
    } else if (num > 100) {
      print("Category: Large");
    } else {
      print("Category: Undefined");
    }

    print("---");
  }
}
