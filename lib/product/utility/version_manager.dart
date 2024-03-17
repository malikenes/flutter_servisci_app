import 'package:flutter_servisci_app/product/utility/custom_exception.dart';

class VersionManager {
  VersionManager({required this.deviceValue, required this.databaseValue});
  final String deviceValue;
  final String databaseValue;

  bool isNeedUpdate() {
    final deviceValueSplit = deviceValue.split('.').join();
    final databaseValueSplit = databaseValue.split('.').join();

    final diveceNumber = int.tryParse(deviceValueSplit);
    final databaseNumber = int.tryParse(databaseValueSplit);

    if (diveceNumber == null || databaseNumber == null) {
      throw VersionCustomException('$deviceValueSplit or $databaseValueSplit is not valid for parse');
    }

    return diveceNumber < databaseNumber;
  }
}
