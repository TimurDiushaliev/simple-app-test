import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_navigations_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_states.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_states.dart';
import 'package:simpleapptest/pages/home_page.dart';
import 'package:simpleapptest/widgets/bottom_app_bar_navigations/bottom_app_bar_navigations.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(
          create: (context) => BottomAppBarNavigationsBloc(
              BottomAppBarNavigationsStates.home_page_state),
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BottomAppBarNavigationsBloc,
          BottomAppBarNavigationsStates>(
        builder: (context, state) {
          if (state == BottomAppBarNavigationsStates.home_page_state)
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => FavoriteIconButtonBloc(
                    PostUnlikedState(),
                  ),
                ),
              ],
              child: HomePage(),
            );
          //TODO: return AccountPage();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBarNavigations(),
    );
  }
}
