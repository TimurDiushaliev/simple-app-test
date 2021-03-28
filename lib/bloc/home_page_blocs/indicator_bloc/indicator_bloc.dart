import 'package:flutter_bloc/flutter_bloc.dart';

class IndicatorBloc extends Bloc<int, int> {
  int index;
  IndicatorBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    index = event;
    yield index;
  }
}
