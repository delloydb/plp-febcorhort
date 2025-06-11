void main() {
  // Initial cart items with item names and prices
  Map<String, double> cart = {
    'Book': 15.0,
    'Pen': 5.0,
    'Headphones': 45.0,
    'USB Cable': 8.0,
    'Monitor': 120.0,
  };

  print("Original Cart: $cart");

  // Step 1: Filter items below $10 using anonymous function
  Map<String, double> filteredCart = Map.fromEntries(
    cart.entries.where((entry) => entry.value >= 10),
  );

  print("Filtered Cart (≥ \$10): $filteredCart");

  // Step 2: Apply discount using a higher-order function
  Map<String, double> applyDiscount(
      Map<String, double> items, double discountPercent) {
    return items.map((key, value) =>
        MapEntry(key, value * ((100 - discountPercent) / 100)));
  }

  Map<String, double> discountedCart = applyDiscount(filteredCart, 10); // 10% discount

  print("After 10% Discount: $discountedCart");

  // Step 3: Calculate total with optional tax
  double calculateTotal(Map<String, double> items, {double taxRate = 0.0}) {
    double subtotal = items.values.reduce((a, b) => a + b);
    return subtotal * (1 + taxRate / 100);
  }

  double totalWithTax = calculateTotal(discountedCart, taxRate: 8); // 8% tax

  // Step 4: Apply factorial-based discount
  int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);

  double applyFactorialDiscount(double total, int itemCount) {
    int fact = factorial(itemCount);
    double discount = (fact % 10).toDouble(); // Limit discount to 0–9%
    print("Factorial Discount: $discount%");
    return total * ((100 - discount) / 100);
  }

  double finalTotal = applyFactorialDiscount(totalWithTax, discountedCart.length);

  // Step 5: Display final price
  print("Final Price after tax and factorial discount: \$${finalTotal.toStringAsFixed(2)}");
}
