import 'hive_local_data_source.dart';

import '../../../services/hive_service/index.dart';

class HiveLocalDataSourceImpl implements HiveLocalDataSource {
  HiveLocalDataSourceImpl(this._hive);

  final HiveService _hive;

  @override
  Future<void> init() async => await _hive.init();

  @override
  void close() => _hive.close();
}
