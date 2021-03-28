import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_bloc.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_events.dart';
import 'package:simpleapptest/bloc/home_page_blocs/indicator_bloc/indicator_states.dart';

class PostImagesCarousel extends StatelessWidget {
  final int index;
  final snapshot;
  PostImagesCarousel({@required this.snapshot, @required this.index});
  @override
  Widget build(BuildContext context) {
    IndicatorBloc _indicatorBloc = BlocProvider.of<IndicatorBloc>(context);
    return CarouselSlider(
      items: snapshot['images']
          .map<Widget>(
            (e) => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Image.network(
                e,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.45,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        onPageChanged: (pageIndex, reason) {
          _indicatorBloc.add(ChangeIndicatorIndexEvent(
              elementIndex: index, indicatorIndex: pageIndex));
        },
      ),
    );
  }
}
