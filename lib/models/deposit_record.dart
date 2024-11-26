class DepositRecord {
  final int id;
  final DateTime depositDate;
  final int pointsEarned;
  final String itemType;

  DepositRecord({
    required this.id,
    required this.depositDate,
    required this.pointsEarned,
    required this.itemType,
  });

  factory DepositRecord.fromJson(Map<String, dynamic> json) {
    return DepositRecord(
      id: json['id'],
      depositDate: DateTime.parse(json['deposit_date']),
      pointsEarned: json['points_earned'],
      itemType: json['item_type'],
    );
  }
}
