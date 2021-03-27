import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_events.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_states.dart';

class PostActionButtons extends StatelessWidget {
  final int index;
  PostActionButtons({@required this.index});
  @override
  Widget build(BuildContext context) {
    FavoriteIconButtonBloc _favoriteIconButtonBloc =
        BlocProvider.of<FavoriteIconButtonBloc>(context);
    return BlocBuilder<FavoriteIconButtonBloc, FavoriteIconButtonStates>(
        builder: (context, state) {
      return Row(
        children: [
          //if user tapped like button
          if (state is PostLikedState)
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                //unlike button tapped
                _favoriteIconButtonBloc.add(UnlikePostEvent());
              },
            ),
          //othewise post not liked
          IconButton(
              icon: Icon(Icons.favorite_outline),
              onPressed: () {
                //like button tapped
                _favoriteIconButtonBloc.add(LikePostEvent(index: index));
              }),
          IconButton(icon: Icon(Icons.comment), onPressed: () {
            //TODO: users comments
          }),
        ],
      );
    });
  }
}
