import 'package:booking_hotel_ui/gen/color.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/pages/booking/widgets/SelectDate.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _quantityController = TextEditingController();

  Widget _buildQuanity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Số lượng',
          style: TextStyle(
              fontFamily: FontFamily.roboto, fontSize: 15, color: Colors.white),
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              // color: Colors.amber.withOpacity(0.9),
              border: Border.all(width: 0.6),
              borderRadius: BorderRadius.circular(9)),
          height: 60.0,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Số lượng không được bỏ trống';
              }
              return null; // Trả về null nếu giá trị hợp lệ
            },
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.roboto),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.add_circle_outline_sharp,
                  color: Colors.black26,
                ),
                hintText: 'Nhập số lượng người ở',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily.roboto,
                    color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget _buildContactbtn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: const Text('Thêm liên hệ'),
        )
      ],
    );
  }

  Widget _buttonBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.blue,
            ],
          )),
          child: const Row(
            children: [],
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 110.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buttonBack(),
                    const SizedBox(
                      width: 50,
                    ),
                    const Center(
                      child: Text(
                        'Đặt phòng',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: FontFamily.roboto,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SelectDate(),
                const SizedBox(height: 20),
                _buildQuanity(),
                const SizedBox(height: 10),
                _buildContactbtn(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Tổng số tiền 1.100.000 VNĐ'),
                const SizedBox(
                  height: 20,
                ),
                const Text('Trạng thái phòng: Đã đặt'),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Thanh toan');
                  },
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          backgroundColor:
                              MaterialStateProperty.all(ColorName.yellow),
                          elevation: MaterialStateProperty.all(0.0),
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 50))),
                      child: const Text(
                        'Thanh toán',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
