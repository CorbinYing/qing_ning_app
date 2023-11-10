import 'package:isar/isar.dart';

part 'bill_info.g.dart';
@collection
class BillInfo {
  Id id = Isar.autoIncrement;

  //金额
  double? amount;

  //日期
  DateTime? dateTime;
}
