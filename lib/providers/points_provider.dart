import 'package:flutter/foundation.dart';
import '../models/deposit_record.dart';
import '../services/deposit_service.dart';

class PointsProvider with ChangeNotifier {
  List<DepositRecord> _depositHistory = [];
  int _totalPoints = 0;

  List<DepositRecord> get depositHistory => _depositHistory;
  int get totalPoints => _totalPoints;

  Future<void> fetchDepositHistory() async {
    try {
      _depositHistory = await DepositService.getDepositHistory();
      _totalPoints =
          _depositHistory.fold(0, (sum, record) => sum + record.pointsEarned);
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error fetching deposit history: $e');
    }
  }

  Future<bool> scanQRCode(String qrCode) async {
    try {
      final depositRecord = await DepositService.processQRCode(qrCode);
      _depositHistory.insert(0, depositRecord);
      _totalPoints += depositRecord.pointsEarned;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error scanning QR code: $e');
      return false;
    }
  }
}
