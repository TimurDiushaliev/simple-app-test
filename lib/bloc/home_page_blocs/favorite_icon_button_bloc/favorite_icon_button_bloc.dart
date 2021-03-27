import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_icon_button_events.dart';
import 'favorite_icon_button_states.dart';

class FavoriteIconButtonBloc
    extends Bloc<FavoriteIconButtonEvents, FavoriteIconButtonStates> {
  int index;
  FavoriteIconButtonBloc(FavoriteIconButtonStates initialState)
      : super(initialState);

  @override
  Stream<FavoriteIconButtonStates> mapEventToState(
      FavoriteIconButtonEvents event) async* {
    if (event is LikePostEvent) {
      index = event.index;
      yield PostLikedState(index: index);
    }
    if (event is UnlikePostEvent) yield PostUnlikedState();
  }
}
