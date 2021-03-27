import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_navigations_events.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_states.dart';

class BottomAppBarNavigationsBloc
    extends Bloc<BottomAppBarNavigationsEvents, BottomAppBarNavigationsStates> {
  BottomAppBarNavigationsBloc(BottomAppBarNavigationsStates initialState)
      : super(initialState);

  @override
  Stream<BottomAppBarNavigationsStates> mapEventToState(
      BottomAppBarNavigationsEvents event) async* {
    switch (event) {
      case BottomAppBarNavigationsEvents.home_page_event:
        yield BottomAppBarNavigationsStates.home_page_state;
        break;
      case BottomAppBarNavigationsEvents.account_page_event:
        yield BottomAppBarNavigationsStates.account_page_state;
        break;
    }
  }
}
