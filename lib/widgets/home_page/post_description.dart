import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  final snapshot;
  final int index;
  PostDescription({@required this.index, @required this.snapshot});
  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          snapshot.data.docs[0]['description'][index].toString(),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container(
      color: Colors.grey[100],
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text(
        '',
        textAlign: TextAlign.center,
      ),
    );
  }
}
