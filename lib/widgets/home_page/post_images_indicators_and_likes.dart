import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_events.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_states.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:simpleapptest/controller/controller.dart';

class PostImagesIndicatorAndLikes extends StatelessWidget {
  final int index;
  final snapshot;
  PostImagesIndicatorAndLikes({@required this.index, @required this.snapshot});
  @override
  Widget build(BuildContext context) {
    FavoriteIconButtonBloc _favoriteIconButtonBloc =
        BlocProvider.of<FavoriteIconButtonBloc>(context);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            snapshot['likes'] < 10000
                ? 'Нравится: ${snapshot['likes']}'
                : 'Нравится: +9999',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        //carousel images indicator
        //TODO: reach correct work of indicators indexes by elelements
        BlocBuilder<IndicatorBloc, IndicatorStates>(
          builder: (context, state) {
            if (state is IndicatorIndexChangedState) if (state.elementIndex ==
                index)
              return Container(
                width: MediaQuery.of(context).size.width * 0.13,
                child: Row(
                  children: Controller.changeIndicatorsIndex(
                    snapshot['images'],
                    (imageIndex, url) {
                      print('image index ${state.indicatorIndex}');
                      print('element index ${state.elementIndex}');
                      return Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.007),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25),
                            color: state.indicatorIndex == imageIndex
                                ? Colors.black
                                : Colors.white),
                      );
                    },
                  ),
                ),
              );
            return Container(
              width: MediaQuery.of(context).size.width * 0.13,
              child: Row(
                children: Controller.changeIndicatorsIndex(
                  snapshot['images'],
                  (imageIndex, url) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.007),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                          color: imageIndex == 0 ? Colors.black : Colors.white),
                    );
                  },
                ),
              ),
            );
          },
        ),
        Spacer(),
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
                  snapshot.reference.update({
                    if (snapshot['likes'] != 0) 'likes': snapshot['likes'] - 1
                  });
                },
              );

            return IconButton(
              icon: Icon(
                Icons.favorite_outline,
              ),
              onPressed: () {
                _favoriteIconButtonBloc.add(LikePostEvent(index: index));
                snapshot.reference.update(
                  {
                    'likes': snapshot['likes'] + 1,
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
