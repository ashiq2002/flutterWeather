import 'cache_db_model.dart';

class APICacheDBModel extends CacheDBBaseModel {
  final String tableName;

  String key;
  String syncData;
  int? syncTime;

  APICacheDBModel({
    required this.tableName,
    required this.key,
    required this.syncData,
    this.syncTime,
  });

  static APICacheDBModel fromMap(Map<String, dynamic> map) {
    return APICacheDBModel(
      key: map["table"],
      tableName: map["key"],
      syncData: map["syncData"].toString(),
      syncTime: map["syncTime"],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map.addAll(
      {
        'key': key,
        'syncData': syncData,
        'syncTime': syncTime,
      },
    );

    return map;
  }
}
