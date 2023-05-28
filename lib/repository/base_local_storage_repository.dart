
import 'package:api_cache_manager/models/cache_db_model.dart';

abstract class BaseLocalStorageRepository{
  Future<APICacheDBModel> getCacheData({required String key, required String tableName});
  Future<void> emptyCache({required String tableName});
  Future<bool> addCacheData({required APICacheDBModel apiCacheDBModel, required tableName});
}