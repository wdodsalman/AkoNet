import 'package:dio/dio.dart';

class Artidio {
  Dio dio = Dio(BaseOptions(
      baseUrl:
          'https://raw.githubusercontent.com/wdodsalman/test-store-backend/main/'));
  Future<Response> artidata({required String url}) async {
    final res = await dio.get(url);
    print(res);
    return (res);
    
  }
}
