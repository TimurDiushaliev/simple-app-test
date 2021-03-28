import 'package:flutter/material.dart';

class Controller {
  static List<Widget> changeIndicatorsIndex(List imageList, Function handler) {
    List<Widget> result = [];
    for (int index = 0; index < imageList.length; index++) {
      result.add(handler(index, imageList[index]));
    }
    return result;
  }
}
