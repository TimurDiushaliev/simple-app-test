import 'package:flutter/material.dart';
import 'package:simpleapptest/widgets/home_page/post_action_buttons.dart';
import 'package:simpleapptest/widgets/home_page/post_description.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
          Image.network('https://thehoya.com/wp-content/uploads/2020/11/20.11.11_QueensGambit_imdb.png'),
          PostActionButtons(index: index),
          PostDescription(),
          Divider(),
        ],
      );
    });
  }
}
