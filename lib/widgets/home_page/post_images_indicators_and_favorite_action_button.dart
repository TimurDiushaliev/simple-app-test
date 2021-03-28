import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_events.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_states.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:simpleapptest/controller/controller.dart';

class PostImagesIndicatorAndFavoriteActionButton extends StatelessWidget {
  final int index;
  final snapshot;
  PostImagesIndicatorAndFavoriteActionButton(
      {@required this.index, @required this.snapshot});
  @override
  Widget build(BuildContext context) {
    FavoriteIconButtonBloc _favoriteIconButtonBloc =
        BlocProvider.of<FavoriteIconButtonBloc>(context);
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
        ),
        //carousel images indicator
        BlocBuilder<IndicatorBloc, int>(
          builder: (context, state) {
            return Row(
              children: Controller.changeIndicatorsIndex(
                snapshot.data.docs[0]['images'],
                (imageIndex, url) {
                  return Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.007),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                        color:
                            state == imageIndex ? Colors.black : Colors.white),
                  );
                },
              ),
            );
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.27),
        //favorite icon button
        BlocBuilder<FavoriteIconButtonBloc, FavoriteIconButtonStates>(
          builder: (context, state) {
            if (state is PostLikedState) if (state.index == index)
              return IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _favoriteIconButtonBloc.add(UnlikePostEvent());
                  });
            return IconButton(
              icon: Icon(
                Icons.favorite_outline,
              ),
              onPressed: () {
                _favoriteIconButtonBloc.add(LikePostEvent(index: index));
              },
            );
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
      ],
    );
  }
}
