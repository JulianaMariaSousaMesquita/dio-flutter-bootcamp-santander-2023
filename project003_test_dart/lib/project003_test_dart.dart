int calculate() {
  return 6 * 7;
}

double calculateDiscount(
    double discountValue, double discount, bool percentage) {
  if (discountValue <= 0) {
    throw ArgumentError("O valor do produto não pode ser zero!");
  }
  if (percentage && discount <= 0) {
    throw ArgumentError("O valor do desconto não pode ser zero!");
  }
  if (percentage) {
    return discountValue - ((discountValue * discount) / 100);
  }
  return discountValue - discount;
}

String convertToUpperCase(String value) {
  return value.toUpperCase();
}
