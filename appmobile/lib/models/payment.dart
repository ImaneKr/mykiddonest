class PaymentModel {
  final int amount;
  final int guardian_id;
  final int kid_id;
  final String customerId;

  PaymentModel({
    required this.amount,
    required this.guardian_id,
    required this.kid_id,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'guardian_id': guardian_id,
      'kid_id': kid_id,
      'customer_id': customerId,
    };
  }
}
