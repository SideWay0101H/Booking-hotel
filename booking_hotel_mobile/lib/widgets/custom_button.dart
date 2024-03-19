import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/gen/color.gen.dart';
import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/services/api_base.dart';
import 'package:booking_hotel_ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  TextEditingController _searchController = TextEditingController();

  List<Room> _searchResults = [];

  ApiBase apiBase = ApiBase();
  void searchRooms(String query) async {
    try {
      // Gửi yêu cầu HTTP để lấy dữ liệu từ API
      var response = await apiBase
          .get('$baseUrl/v1/room', queryParameters: {'search': query});

      // Kiểm tra nếu yêu cầu thành công (status code 200)
      if (response.statusCode == 200) {
        // Chuyển đổi dữ liệu từ JSON sang Dart List
        List<dynamic> data = response.data['data'];
        List<Room> rooms = [];

        // Lặp qua danh sách phòng và thêm vào danh sách kết quả
        for (var roomData in data) {
          rooms.add(Room(
            id: roomData['id'],
            roomNumber: roomData['room_number'],
            priceAtNight: roomData['price_at_night'],
            occupancy: null,
            area: null,
            roomAvailable: 'isAvailable',
            roomtype: null,
          ));
        }

        // Cập nhật danh sách kết quả và cập nhật giao diện
        setState(() {
          _searchResults = rooms;
        });
      } else {
        // Xử lý trường hợp yêu cầu thất bại
        debugPrint('Yêu cầu thất bại với status code: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý các lỗi nếu có
      debugPrint('Đã xảy ra lỗi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
            backgroundColor: MaterialStateProperty.all(ColorName.yellow),
            elevation: MaterialStateProperty.all(0.0),
            minimumSize: MaterialStateProperty.all(Size(200, 50))),
        child: const Text(
          'Tìm kiếm',
          style: TextStyle(color: Colors.black, fontSize: 19),
        ));
  }
}
