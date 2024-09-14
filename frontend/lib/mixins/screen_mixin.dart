import 'package:flutter/material.dart';

mixin ScreenMixin<T extends StatefulWidget> on State<T> {
  
  Size getSize() {
    return MediaQuery.of(context).size;
  }
}