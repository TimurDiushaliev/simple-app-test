import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_navigations_bloc.dart';
import 'package:simpleapptest/bloc/bottom_app_bar_navigations_bloc/bottom_app_bar_states.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/favorite_icon_button_bloc/favorite_icon_button_states.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';
import 'package:simpleapptest/pages/account_page.dart';
import 'package:simpleapptest/pages/sign_in_page.dart';
import 'package:simpleapptest/pages/home_page.dart';
import 'package:simpleapptest/widgets/bottom_app_bar_navigations/bottom_app_bar_navigations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        title: Text('Simple App Test'),
        centerTitle: true,
      ),
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
                BlocProvider(
                    create: (context) => IndicatorBloc(
                        IndicatorIndexChangedState(
                            elementIndex: 0, indicatorIndex: 0)))
              ],
              child: HomePage(),
            );
          if (state == BottomAppBarNavigationsStates.account_page_state)
            return AccountPage();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          //TODO: add post
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarNavigations(),
    );
  }
}
