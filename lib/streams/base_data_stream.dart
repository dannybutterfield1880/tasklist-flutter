

import 'package:get_it/get_it.dart';
import 'package:tasklist/models/api_error.dart';
import 'package:tasklist/streams/data_stream.dart';
import 'package:tasklist/utils/exceptions/AuthTokenException.dart';
import 'package:tasklist/utils/helpers/observable.dart';
import 'package:tasklist/utils/services/api_util.dart';

class BaseDataStream implements DataStream {
  final ApiUtil apiService = GetIt.I<ApiUtil>();

  Observable<String> dataStream = Observable();
  Observable<ApiError> apiError = Observable();

  dynamic callApi(
      Future<dynamic> Function() apiBlock, 
      Observable<ApiError> _apiError,
      {int reqCode = -1}
    ) async {
    return await apiBlock().catchError((error) {
      print('error.message');
      print(error.toString());
      print('_apiError');
      print(_apiError);
      if (error.message != '') {
        _apiError.setValue(ApiError(new AuthTokenException(error.message), reqCode));
      }
    });
  }

  void close() {
    apiService.cancelRequests();
  }

  void finish() {
    this.close();
  }

  void loadData(arg, {param}) {
    throw new UnimplementedError('Implement in child class!');
  }

  @override
  String onApiError(error) {
    print(error);
    return 'there has been an error!';
  }
}