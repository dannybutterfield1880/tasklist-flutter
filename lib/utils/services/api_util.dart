import 'package:dio/dio.dart';

import 'api_connector.dart';

class ApiUtil {
  ApiConnector _apiConnector;

  ApiUtil() {
    _apiConnector = ApiConnector();
  }

  void cancelRequests({CancelToken cancelToken}) {
    _apiConnector.cancelRequests(cancelToken: cancelToken);
  }

  dynamic get(path, options) async {
    return (await _apiConnector.get(path, options: options)).data;
  }

  dynamic post(path, data, options) async {
    return (await _apiConnector.post(path, data, options: options)).data;
  }

  // dynamic download(path) async {
  //   // Download a file
  //   return await dio.download(
  //     "https://www.google.com/",
  //     "./example/xx.html",
  //     queryParameters: {"a": 1},
  //     onReceiveProgress: (received, total) {
  //       if (total != -1) {
  //         print('$received,$total');
  //       }
  //     },
  //   );
  // }
}