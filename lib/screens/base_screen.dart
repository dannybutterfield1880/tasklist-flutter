
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tasklist/streams/data_stream.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseScreen extends StatefulWidget {}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  FToast fToast;
  DataStream stream;
  RouteData routeData;

  dynamic onApiError() {
    print('i am here');
    if (stream == null) {
      print('stream is null');
      return null;
    }
    return stream.apiError/* stream.apiError */;
  }

  // dynamic onIncomingEvent() {
  //   if (stream == null) {
  //     return null;
  //   }
  //   return stream.incomingEvent;
  // }

  @override
  void initState() {
    super.initState(); 
    
    // onIncomingEvent()?.observe((apiError) {
    //   //errorToast(message: apiError.exception.toString());
    // });

    fToast = FToast();
    fToast.init(context);

    () async {
      await Future.delayed(Duration.zero);
      routeData = RouteData.of(context);
      onApiError()?.observe((apiError) {
        print(apiError);
        errorToast(message: apiError.exception.toString());
      });
    }();
  }

  void successToast({@required String message}) {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.greenAccent,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.check_box_outline_blank_rounded),
            SizedBox(
            width: 12.0,
            ),
            Text(message),
        ],
        ),
    );

    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 6),
    );
  }

  void errorToast({@required String message}) {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.redAccent
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.error_outline_rounded),
            SizedBox(
              width: 10.0,
            ),
            Text(message),
        ],
        ),
    );

    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 6),
    );
  }

  @override
  void dispose() {
    stream.close();
  }
}