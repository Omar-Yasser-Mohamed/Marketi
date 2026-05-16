sealed class PaymentMethod {
  const PaymentMethod();
}

class CashOnDelivery extends PaymentMethod {
  const CashOnDelivery();
}

class OnlinePayment extends PaymentMethod {
  const OnlinePayment();
}