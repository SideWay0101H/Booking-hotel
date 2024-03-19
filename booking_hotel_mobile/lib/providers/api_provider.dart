import 'dart:io';

import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/model/review.dart';
import 'package:booking_hotel_ui/services/api_base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<List<Room>> getAllRoom() async {
    try {
      Response response = await dio.get('$baseUrl/v1/room');
      // List<dynamic> value = ;
      //debugPrint("Hello");
      var data = response.data['data'];
      //  var rooms =  data.map<Room>((e) => Room.fromJson(e)).toList();
      return data.map<Room>((e) => Room.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [Room.withError("Check your internet connection please")];
      }
      return [Room.withError(e.toString())];
    }
  }

  // Future<List<Roomtype>> getType() async {
  //   try {
  //     Response response = await dio.get('$baseUrl/v1/type');

  //     var data = response.data;
  //     return data.map<Roomtype>((e) => Roomtype.fromJson(e)).toList();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<List<Room>> createRoom(FormData? fromData) async {
    try {
      String roomUrl = "/v1/room";

      Response response = await ApiBase().post(roomUrl, data: fromData);
      // List<dynamic> value = ;
      //debugPrint("Hello");
      var data = response.data['data'];
      //  var rooms =  data.map<Room>((e) => Room.fromJson(e)).toList();
      return data.map<Room>((e) => Room.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [Room.withError("Check your internet connection please")];
      }
      return [Room.withError(e.toString())];
    }
  }

  // Future<File> writeToFile(ByteData data) async {
  //   final buffer = data.buffer;
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = tempDir.path;
  //   var filePath =
  //       tempPath + '/file_01.png'; // file_01.tmp is dump file, can be anything
  //   return File(filePath).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  // void _createRoom() async {
  //   final ByteData bytes = await rootBundle.load('assets/image/ctu.png');
  //   var file = await writeToFile(bytes);
  //   String fileName = file.path.split('/').last;

  //   FormData data = FormData.fromMap({
  //     "thumbnail": await MultipartFile.fromFile(
  //       file.path,
  //       filename: fileName,
  //       contentType: MediaType('image', 'png'),
  //     ),
  //     "occupancy": 4,
  //     "room_number": 'P20',
  //     "area": 20,
  //     "price_at_night": 800000,
  //     "roomtype": 1
  //   });
  // }

  Future<List<Review>> getAllReview() async {
    try {
      Response response = await dio.get('$baseUrl/v1/review');
      // List<dynamic> value = ;
      //debugPrint("Hello");
      var data = response.data;
      //  var rooms =  data.map<Room>((e) => Room.fromJson(e)).toList();
      return data.map<Review>((e) => Review.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [Review.withError("Check your internet connection please")];
      }
      return [Review.withError(e.toString())];
    }
  }
}
