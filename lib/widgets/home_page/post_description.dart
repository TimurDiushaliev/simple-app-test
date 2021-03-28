import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  final snapshot;
  final int index;
  PostDescription({@required this.index, @required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text(
        snapshot['description'],
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }
}
