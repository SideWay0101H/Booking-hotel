import 'package:booking_hotel_ui/core/constants/color_constrants.dart';
import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/gen/color.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/pages/booking/Booking.dart';
import 'package:booking_hotel_ui/pages/roomDetail/CommentPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class RoomDetailPage extends StatefulWidget {
  final Room room;
  const RoomDetailPage({super.key, required this.room});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  final List<String> imageUrls = [
    "assets/image/gallery1.png",
    "assets/image/gallery2.png",
    "assets/image/gallery3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      _buildSliverAppBar(),
      SliverToBoxAdapter(
        child: _buildRoomDetail(context),
      ),
    ]));
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 100.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Chi tiết phòng',
          style: TextStyle(fontFamily: FontFamily.roboto),
          textAlign: TextAlign.center,
        ),
        background: Assets.image.thumbnail2.image(fit: BoxFit.none),
      ),
    );
  }

  Widget _buildRoomDetail(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              // border: Border.all(width: 1),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.white,
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Phòng:${widget.room.roomNumber.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: FontFamily.roboto)),
                ]),
              ),
              const SizedBox(height: 30),
              _slidePage(context),
              // Text(widget.room.id.toString()),
              const SizedBox(
                height: 20,
                // height: 20,
              ),
              Text(
                'Giá:${NumberFormat('#,##0').format(widget.room.priceAtNight)}VNĐ',
                style: const TextStyle(fontSize: 19, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Diện tích:${widget.room.area.toString()}m',
                    style: const TextStyle(fontSize: 19),
                  ),
                  Text(
                    'Trạng thái:${widget.room.roomAvailable.toString()}',
                    style: const TextStyle(fontSize: 19),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${widget.room.roomtype?.typeName ?? "N/A"}',
                    style: const TextStyle(fontSize: 19),
                  ),
                  SingleChildScrollView(
                    child: Text(
                      '${widget.room.roomtype!.description ?? "N/A"}',
                      style: const TextStyle(fontSize: 17),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Dịch vụ đi kèm',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.roboto),
                  ),
                  Icon(Icons.wifi, color: Colors.green),
                  Icon(
                    Icons.camera_alt,
                    color: Colors.deepOrange,
                  ),
                  Icon(
                    Icons.time_to_leave,
                    color: ColorName.primarySwatch,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookingPage()),
                      (route) => true);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    backgroundColor:
                        MaterialStateProperty.all(ColorName.yellow),
                    elevation: MaterialStateProperty.all(0.0),
                    minimumSize:
                        MaterialStateProperty.all(const Size(200, 50))),
                child: const Text(
                  'Đặt phòng',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: FontFamily.roboto),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 70, child: CommentPage()),
      ],
    );
  }

  Widget _slidePage(BuildContext context) {
    return CarouselSlider(
        items: imageUrls.map((e) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(e), fit: BoxFit.fill),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 150,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
        ));
  }
}
