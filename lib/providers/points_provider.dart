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

// In deposit_service.dart
class DepositService {
  Future<List<Map<String, dynamic>>> getDepositHistory(String userId) async {
    try {
      // Implement the logic to fetch deposit history
      // This could involve API calls or database operations
      return [
        {
          'id': '1',
          'amount': 100,
          'points': 10,
          'timestamp': DateTime.now().toIso8601String(),
          'location': 'Location A'
        }
        // Add more history items as needed
      ];
    } catch (e) {
      print('Error fetching deposit history: $e');
      return [];
    }
  }
}
