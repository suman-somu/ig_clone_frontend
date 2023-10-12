import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DummyImage extends StatelessWidget {
  const DummyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
            padEnds: false,
            enableInfiniteScroll: false,
            enlargeFactor: 1,
            viewportFraction: 1,
            aspectRatio: 1 / 1,
          ),
          items: [
             Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
      ),
          ]
    );
  }
}
