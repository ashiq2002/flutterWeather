abstract class CacheBaseRepository<T>{
  Future<void> addToCache(T data, String boxName);
  Future<T> getDataFromCache(String boxName);
  clearCache(String boxName);
}