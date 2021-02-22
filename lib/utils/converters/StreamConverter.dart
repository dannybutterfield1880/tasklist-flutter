import 'dart:async';
import 'dart:convert';

import 'package:tasklist/models/event_stream.dart';


class StreamConverter extends Converter<dynamic, dynamic> implements StreamTransformer {
  const StreamConverter();

  @override
  Stream bind(Stream stream) {
    // TODO: implement bind
    // _source = 
    throw UnimplementedError();
  }

  @override
  Converter<RS, RT> cast<RS, RT>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  //take an event stream and convert it to an EventStream object
  @override
  EventStream convert(input) {
    // TODO: implement convert
    throw UnimplementedError();
  }


}