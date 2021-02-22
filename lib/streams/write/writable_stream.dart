import 'package:tasklist/streams/base_data_stream.dart';

abstract class WritableStream extends BaseDataStream {
  void drain();

  void sendEvent();

  
  
}