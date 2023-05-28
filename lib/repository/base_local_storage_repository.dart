
import 'package:api_cache_manager/models/cache_db_model.dart';

abstract class BaseLocalStorageRepository{
  Future<APICacheDBModel> getCacheData({required String key});
  Future<void> emptyCache();
  Future<bool> addCacheData({required APICacheDBModel apiCacheDBModel});
}