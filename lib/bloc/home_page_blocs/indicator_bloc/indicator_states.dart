import 'package:flutter/cupertino.dart';

abstract class IndicatorStates {}

class IndicatorIndexChangedState extends IndicatorStates {
  int elementIndex;
  int indicatorIndex;
  IndicatorIndexChangedState(
      {@required this.elementIndex, @required this.indicatorIndex});
}

class IndicatorIndexIsNotChangedYetState extends IndicatorStates{}
