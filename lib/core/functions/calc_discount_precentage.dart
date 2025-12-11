num calculateDiscountPercentage(num price, num? priceAfterDiscount) {
  if (priceAfterDiscount == null) return 0;

  final discount = price - priceAfterDiscount;
  final percentage = (discount / price) * 100;

  return percentage;
}
