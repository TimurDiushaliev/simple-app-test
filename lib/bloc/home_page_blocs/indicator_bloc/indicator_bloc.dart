import 'package:flutter_bloc/flutter_bloc.dart';

import 'indicator_events.dart';
import 'indicator_states.dart';

class IndicatorBloc
    extends Bloc<ChangeIndicatorIndexEvent, IndicatorStates> {
  int index;
  IndicatorBloc(IndicatorStates initialState) : super(initialState);

  @override
  Stream<IndicatorIndexChangedState> mapEventToState(
      ChangeIndicatorIndexEvent event) async* {
    yield IndicatorIndexChangedState(
        elementIndex: event.elementIndex, indicatorIndex: event.indicatorIndex);
  }
}
