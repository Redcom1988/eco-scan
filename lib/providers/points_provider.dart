import 'package:flutter/foundation.dart';
import '../models/deposit_record.dart';
import '../services/deposit_service.dart';

class PointsProvider with ChangeNotifier {
  final DepositService _depositService = DepositService();
  List<DepositRecord> _depositHistory = [];
  int _totalPoints = 0;

  List<DepositRecord> get depositHistory => _depositHistory;
  int get totalPoints => _totalPoints;

  Future<void> fetchDepositHistory(String userId) async {
    try {
      final rawHistory = await _depositService.getDepositHistory(userId);
      _depositHistory =
          rawHistory.map((record) => DepositRecord.fromJson(record)).toList();
      _totalPoints = _depositHistory.fold(
          0, (sum, record) => sum + record.pointsEarned.toInt());
      notifyListeners();
    } catch (e) {
      print('Error fetching deposit history: $e');
    }
  }

  Future<bool> scanQRCode(String qrCode) async {
    try {
      final depositRecord = await _depositService.processQRCode(qrCode);
      _depositHistory.insert(0, depositRecord);
      _totalPoints += (depositRecord.pointsEarned as int);
      notifyListeners();
      return true;
    } catch (e) {
      print('Error scanning QR code: $e');
      return false;
    }
  }
}
