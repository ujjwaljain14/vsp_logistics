abstract class BaseApiServices{

  Future<dynamic> getApi(String url, Map<String,String> header);
  Future<dynamic> postApi(String url, Map<String,String> header, Map body);
  Future<dynamic> putApi(String url, Map<String,String> header, Map body);
  Future<dynamic> deleteApi(String url, Map<String,String> header, Map body);

}