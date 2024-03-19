import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlidePage extends StatelessWidget {
  SlidePage({super.key});

  final List<String> imageUrls = [
    "assets/image/float_market.jpg",
    "assets/image/pagoda_truc_lam.jpg",
    "assets/image/house_accident.jpg",
  ];

  final List<String> textLocations = [
    "Chợ nổi Cái răng",
    "Thiền viện Trúc lâm",
    "Nhà cổ Bình Thủy",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Địa điểm nổi tiếng'),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
            items: imageUrls.map((e) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 100,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
            )),
        // CarouselSlider(
        //     items: textLocations.map((e) {
        //       return Container(
        //         width: MediaQuery.of(context).size.width,
        //         child: Text('Địa điểm:$e'),
        //       );
        //     }).toList(),
        //     options: CarouselOptions(
        //       height: 50,
        //       enableInfiniteScroll: true,
        //       autoPlay: true,
        //       enlargeCenterPage: true,
        //     )),
      ],
    );
  }
}
