import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simpleapptest/widgets/home_page/post_images_indicators_and_favorite_action_button.dart';
import 'package:simpleapptest/widgets/home_page/post_description.dart';
import 'package:simpleapptest/widgets/home_page/post_images_carousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          return Column(
            children: [
              PostImagesCarousel(snapshot: snapshot, index: index),
              PostImagesIndicatorAndFavoriteActionButton(
                  index: index, snapshot: snapshot),
              PostDescription(index: index, snapshot: snapshot),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }
}
