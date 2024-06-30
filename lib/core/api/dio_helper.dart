import 'package:dio/dio.dart';

import '../helper/cached_helper.dart';

class DioHelper {
  Dio dio = Dio();

  final String _baseUrl = 'https://student.valuxapps.com/api';
  // String _apiKey='';

  Future<Options> options() async {
    String lang = await CacheHelper.getData(key: 'local')??'ar';
    String token = await CacheHelper.getData(key: 'token') ?? '';

    return Options(headers: {
      'lang': lang,
      "Content-Type": 'application/json',
      "Authorization": token
    });
  }

  Future getData(
      {required endPoint, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get('$_baseUrl/$endPoint',
        options: await options(), queryParameters: queryParameters);

    return response.data;
  }

  Future postData({required endPoint, required Object data}) async {
 
    var response = await dio.post('$_baseUrl/$endPoint',
        data: data, options: await options());

    return response.data;
  }

  Future deleteData({required endPoint, Object? data}) async {
    var response = await dio.delete('$_baseUrl/$endPoint',
        data: data, options: await options());

    return response.data;
  }

  Future editData({required endPoint, required Object data}) async {
    var response = await dio.put('$_baseUrl/$endPoint',
        data: data, options: await options());

    return response.data;
  }
}
