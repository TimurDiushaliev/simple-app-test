import 'package:flutter/cupertino.dart';

abstract class FavoriteIconButtonStates {}

class PostLikedState extends FavoriteIconButtonStates {
  int index;
  PostLikedState({@required this.index});
}

class PostUnlikedState extends FavoriteIconButtonStates {}
