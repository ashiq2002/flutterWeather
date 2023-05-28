import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter_weather/repository/base_local_storage_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository{
  @override
  Future<bool> addCacheData({required APICacheDBModel apiCacheDBModel}) async{
    return await APICacheManager().addCacheData(apiCacheDBModel);
  }

  @override
  Future<APICacheDBModel> getCacheData({required String key}) async{
    return await APICacheManager().getCacheData(key);
  }

  @override
  Future<void> emptyCache() async{
    return await APICacheManager().emptyCache();
  }

}