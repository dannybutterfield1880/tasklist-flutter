
import 'package:tasklist/models/api_error.dart';
import 'package:tasklist/utils/helpers/observable.dart';

abstract class DataStream {
 // dataStream we can observe for changes/updates
 Observable<String> dataStream;

 // apiError we can observe so it can be handle gracefully
 Observable<ApiError> apiError;

 // get the current data stream
 get _dataStream;

 // get the current api error
 get _apiError;

 // load data to be overrode in desendants of BaseDataStream
 void loadData(arg, {param});

 // cleanup when finished with the stream
 void close();

 // method to handle an error on the API
 String onApiError(dynamic) ;
}