import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget(this.imagePath, {super.key});
  List<String> imagePath;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true, // animasi otomatis
        autoPlayInterval: Duration(seconds: 3), // jeda antar slide
        autoPlayAnimationDuration: Duration(
          milliseconds: 800,
        ), // durasi animasi
        autoPlayCurve: Curves.fastOutSlowIn, // kurva animasi
        enlargeCenterPage: true, // efek zoom pada item tengah
        viewportFraction: 0.55, // proporsi slide dalam tampilan
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
      ),
      items: imagePath.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent, // Make background transparent
              ),
              child: Image.asset(i),
            );
          },
        );
      }).toList(),
    );
  }
}
