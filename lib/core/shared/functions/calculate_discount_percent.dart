int calculateDiscountPercent(num originalPrice, num discountedPrice) {
  if (originalPrice == 0) return 0;

  final num discount = originalPrice - discountedPrice;
  return ((discount / originalPrice) * 100).round();
}
