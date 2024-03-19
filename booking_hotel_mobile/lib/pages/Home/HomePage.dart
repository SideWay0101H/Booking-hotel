import 'dart:io';
import 'dart:typed_data';

import 'package:booking_hotel_ui/core/constants/color_constrants.dart';
import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/pages/Home/Widget/HeadSection.dart';
import 'package:booking_hotel_ui/pages/Home/Widget/SearchCard.dart';
import 'package:booking_hotel_ui/pages/Home/Widget/SildePage.dart';
import 'package:booking_hotel_ui/pages/Home/bloc/room/room_bloc.dart';
import 'package:booking_hotel_ui/pages/Home/bloc/room/room_event.dart';
import 'package:booking_hotel_ui/pages/Home/bloc/room/room_state.dart';
import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/pages/roomDetail/RoomDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath =
        tempPath + '/file_01.png'; // file_01.tmp is dump file, can be anything
    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: false,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const HeadSection(),
                    SearchCard(),
                    const SizedBox(height: 20),
                    SlidePage(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(child: _NearByRoom())
                  ],
                ))));
  }
}

class _NearByRoom extends StatefulWidget {
  const _NearByRoom({super.key});

  @override
  State<_NearByRoom> createState() => _NearByRoomState();
}

class _NearByRoomState extends State<_NearByRoom> {
  final RoomBLoc _roomBLoc = RoomBLoc();
  final ScrollController _listViewController = ScrollController();
  @override
  void initState() {
    _roomBLoc.add(GetListRoom());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListRoom(context);
  }

  Widget _buildListRoom(BuildContext context) {
    // Future<File> downloadAndSaveImage(String url, String fileName) async {
    //   Dio dio = Dio();
    //   Response response = await dio.get(url,
    //       options: Options(responseType: ResponseType.bytes));
    //   File file = File(fileName);
    //   await file.writeAsBytes(response.data);
    //   return file;
    // }

    return BlocProvider(
      create: (context) => _roomBLoc,
      child: BlocBuilder<RoomBLoc, RoomState>(builder: (context, state) {
        if (state is RoomError) {
          return Center(child: Text(state.error!));
        } else if (state is RoomInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RoomLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RoomLoaded) {
          return Scrollbar(
            thumbVisibility: true,
            controller: _listViewController,
            child: ListView.builder(
              controller: _listViewController,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemExtent: 180,
              itemCount: state.roomList.length,
              itemBuilder: (context, index) {
                Room current = state.roomList[index];
                return GestureDetector(
                  onTap: () {
                    debugPrint(current.id.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => RoomDetailPage(
                          room: current,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.blue,
                            ])),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                            child: Assets.image.room1.image(
                                width: 200, height: 190, fit: BoxFit.cover)),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text:
                                      'Phòng:${current.roomNumber.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: FontFamily.roboto)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Giá:${NumberFormat('#,##0').format(current.priceAtNight)}VNĐ',
                                style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.roboto)),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        'Trạng thái:${current.roomAvailable.toString()}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.roboto,
                                        fontSize: 10)),
                              ]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
