import 'package:booking_hotel_ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String lable;
  const CustomTextField(
      {super.key, required this.lable, required this.controller,required this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        onTap: ontap,
        controller: controller,
        decoration: InputDecoration(
            label: AppText.small(lable), border: InputBorder.none),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}