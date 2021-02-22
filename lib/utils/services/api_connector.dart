import 'package:dio/dio.dart';
import 'package:tasklist/utils/exceptions/AuthTokenException.dart';
import '../../constants/api_path.dart';

class ApiConnector {
  Dio _dio;
  CancelToken _cancelToken;

  ApiConnector() {
    _dio = createDio();
  }

  Dio createDio() {
    _cancelToken = CancelToken();
    return Dio(BaseOptions(
        connectTimeout: 10 * 1000,
        receiveTimeout: 10 * 1000,
        baseUrl: API_ROOT,
        contentType: 'application/json',
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ))
      ..interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        return options;
      }, onResponse: (Response response) async {
        Map res = response.data;

        if (res == null) {
          return null;
        }
      
        if (res.containsKey('status')) {
          //print(res);
          //make ApiException
          //then we will need to extend that exception for more precise errors such as AuthTokenException
          //also make some constants with error codes like auth/token-expired, tasklist/exists, auth/permission-denied and so on 
          throw new AuthTokenException(res['message']);
        }
        
        return response;
      }, onError: (Exception e) async {
        print('ERROR');
        print(e);
        throw e;
      }));
  }

  void cancelRequests({CancelToken cancelToken}) {
    cancelToken == null
        ? _cancelToken.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<Response> get(
    String endUrl,
    {
      Map<String, dynamic> params,
      Options options,
      CancelToken cancelToken,
    }
  ) async {
    return await (_dio.get(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) {
      throw e;
    });
  }

  Future<Response> post(
    String endUrl, 
    body,
    {
      Map<String, dynamic> params,
      Options options,
      CancelToken cancelToken,
    }) async {
    return await (_dio.post(
      endUrl,
      data: body,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) {
      throw e;
    });
  }
}