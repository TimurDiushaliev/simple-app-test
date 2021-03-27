import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_navigations_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_navigations_events.dart';

class BottomAppBarNavigations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomAppBarNavigationsBloc _bottomAppBarNavigationsBloc =
        BlocProvider.of<BottomAppBarNavigationsBloc>(context);
    return Container(
      color: Colors.purple,
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            //navigate to home page
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _bottomAppBarNavigationsBloc
                    .add(BottomAppBarNavigationsEvents.home_page_event);
              },
            ),
            //navigate to account page
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                _bottomAppBarNavigationsBloc
                    .add(BottomAppBarNavigationsEvents.account_page_event);
              },
            )
          ],
        ),
      ),
    );
  }
}
