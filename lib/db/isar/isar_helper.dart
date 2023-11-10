import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarHelper {
  final String _instanceName = 'qing_ning';
  static IsarHelper? _helper;
  static Future<Isar>? _isar;

  IsarHelper._internal() {
    _helper = this;
  }

  // 工厂构造函数
  factory IsarHelper() => _helper ?? IsarHelper._internal();

  Future<Isar> getInstance(List<CollectionSchema<dynamic>> schemas) async {
    if (schemas.isEmpty) {
      throw IsarError('At least one collection needs to be opened.');
    }

    final dir = await getApplicationDocumentsDirectory();
    if (_isar == null || !(await _isar)!.isOpen) {
      _isar = Isar.open(schemas, directory: dir.path, name: _instanceName);
    }else{



    }



    return _isar!;
  }
}
