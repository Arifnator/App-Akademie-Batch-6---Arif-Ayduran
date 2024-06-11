abstract class PaymentProvider {
  void processPayment(double amount);
}

class CreditCard implements PaymentProvider {
  @override
  void processPayment(double amount) {
    print('Processing credit card payment of \$$amount');
  }
}

class PayPal implements PaymentProvider {
  @override
  void processPayment(double amount) {
    print('Processing PayPal payment of \$$amount');
  }
}

class BankTransfer implements PaymentProvider {
  @override
  void processPayment(double amount) {
    print('Processing bank transfer payment of \$$amount');
  }
}

void main() {
  PaymentProvider creditCard = CreditCard();
  PaymentProvider payPal = PayPal();
  PaymentProvider bankTransfer = BankTransfer();

  creditCard.processPayment(100.0);
  payPal.processPayment(200.0);
  bankTransfer.processPayment(300.0);
}