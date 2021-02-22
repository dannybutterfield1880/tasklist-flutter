import 'package:tasklist/utils/helpers/observable.dart';

import '../base_data_stream.dart';

// ignore: todo
/// TODO: think about creating RealTimeReadableStream that specifically listens for 
/// test/event-streams and updates and Observable
abstract class ReadableStream extends BaseDataStream {
   // dataStream we can observe for changes/updates
  Observable<String> dataStream;
  
 // get the current data stream
  get _dataStream;

   // load data to be overrode in desendants of BaseDataStream
   // loads response to dataStream
  void loadData(arg, {param});
}