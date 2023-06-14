import 'package:flutter_weather/repository/cache_base_repository.dart';
import 'package:hive/hive.dart';

class CacheRepository<T> extends CacheBaseRepository<T>{
  @override
  Future<void> addToCache(T data, String boxName) async{
    var box = _getBox(boxName);
    box.add(data);
  }

  @override
  Future<T> getDataFromCache(String boxName) async{
    var box = _getBox(boxName);
    dynamic data;

    for(var d in box.values){
      data = d;
    }
    return data;
  }
  
  Box<T> _getBox(String box) => Hive.box<T>(box);

  @override
  clearCache(String boxName) {
    var box = _getBox(boxName);
    box.clear();
  }
  
}