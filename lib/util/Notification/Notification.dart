
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

showToastMessage({ context, message}) =>
    Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);