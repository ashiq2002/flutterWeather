import 'package:api_cache_manager/models/cache_db_model.dart';
import 'db_helper.dart';

class APICacheManager extends APICacheDBHelper {
  static APICacheManager? _instance;

  factory APICacheManager() {
    if (_instance == null) {
      _instance = APICacheManager._();
    }
    return _instance!;
  }

  APICacheManager._();

  Future<bool> addCacheData(APICacheDBModel model, String tableName) async {
    await APICacheDBHelper.init(tableName);
    bool isSaved = false;
    model.syncTime = DateTime.now().millisecondsSinceEpoch;

    int res;

    if (!await isAPICacheKeyExist(model.key, tableName)) {
      res = await APICacheDBHelper.insert(tableName, model);
    } else {
      res = await APICacheDBHelper.customUpdate(
        tableName,
        model,
        columnName: "key",
        columnValue: model.key,
      );
    }

    isSaved = res > 0 ? true : false;

    return isSaved;
  }

  Future<APICacheDBModel> getCacheData(String key, String tableName) async {
    await APICacheDBHelper.init(tableName);

    List<Map<String, dynamic>> cacheData =
    await APICacheDBHelper.conditionalQuery(
      tableName,
      "key = ?",
      key,
    );

    return cacheData.map((item) => APICacheDBModel.fromMap(item)).first;
  }

  Future<bool> isAPICacheKeyExist(String key, String tableName) async {
    await APICacheDBHelper.init(tableName);

    List<Map<String, dynamic>> cacheData =
    await APICacheDBHelper.conditionalQuery(
      tableName,
      "key = ?",
      key,
    );

    return cacheData.length == 1 ? true : false;
  }

  Future<void> emptyCache(String tableName) async {
    await APICacheDBHelper.init(tableName);
    APICacheDBHelper.deleteAll(tableName);
  }

  Future<bool> deleteCache(String keyName, String tableName) async {
    await APICacheDBHelper.init(tableName);
    int res;
    res = await APICacheDBHelper.delete(tableName, "key", keyName);

    return res == 1 ? true : false;
  }
}
