import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter_weather/repository/base_local_storage_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository{
  @override
  Future<bool> addCacheData({required APICacheDBModel apiCacheDBModel, required tableName}) {
    // TODO: implement addCacheData
    throw UnimplementedError();
  }

  @override
  Future<void> emptyCache({required String tableName}) {
    // TODO: implement emptyCache
    throw UnimplementedError();
  }

  @override
  Future<APICacheDBModel> getCacheData({required String key, required String tableName}) {
    // TODO: implement getCacheData
    throw UnimplementedError();
  }


}