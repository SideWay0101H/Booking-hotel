import 'package:booking_hotel_ui/gen/color.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDate();
}

class _SelectDate extends State<SelectDate> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2023, 12, 8), end: DateTime(2023, 12, 31));
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Chọn ngày',
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    backgroundColor:
                        MaterialStateProperty.all(ColorName.yellow),
                    elevation: MaterialStateProperty.all(0.0),
                    minimumSize: MaterialStateProperty.all(Size(200, 50))),
                onPressed: pickDateRange,
                child: Text(DateFormat('dd-MM-yyyy').format(start),
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                  backgroundColor: MaterialStateProperty.all(ColorName.yellow),
                  elevation: MaterialStateProperty.all(0.0),
                  minimumSize: MaterialStateProperty.all(Size(200, 50))),
              onPressed: pickDateRange,
              child: Text(
                DateFormat('dd-MM-yyyy').format(end),
                style: TextStyle(color: Colors.black),
              ),
            )),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Tổng số ${difference.inDays} ngày',
          style: const TextStyle(fontSize: 30),
        )
      ],
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );

    if (newDateRange == null) return; //Nhan nut x
    setState(() => dateRange = newDateRange);
  }
}
