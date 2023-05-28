abstract class ApiDao{
  //for api GET method response
  Future<dynamic> getApiResponse(String url);
  //for api POST method response
  Future<dynamic> postApiResponse(String url, dynamic body);
}