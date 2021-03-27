import 'package:flutter/cupertino.dart';

abstract class FavoriteIconButtonEvents {}

class LikePostEvent extends FavoriteIconButtonEvents {
  int index;
  LikePostEvent({@required this.index});
}

class UnlikePostEvent extends FavoriteIconButtonEvents {}
