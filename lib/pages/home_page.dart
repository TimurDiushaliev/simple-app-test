import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simpleapptest/widgets/home_page/post_images_indicators_and_likes.dart';
import 'package:simpleapptest/widgets/home_page/post_description.dart';
import 'package:simpleapptest/widgets/home_page/post_images_carousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  PostImagesCarousel(
                      snapshot: snapshot.data.docs[index], index: index),
                  PostImagesIndicatorAndLikes(
                      index: index, snapshot: snapshot.data.docs[index]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PostDescription(
                      index: index, snapshot: snapshot.data.docs[index]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ],
              );
            },
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
