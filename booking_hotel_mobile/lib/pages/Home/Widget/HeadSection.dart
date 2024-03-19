import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/pages/profile/Edit_Profile_Page.dart';
import 'package:booking_hotel_ui/widgets/app_text.dart';
import 'package:booking_hotel_ui/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => EditProfilePage(
                        ),
                      ),
                    );
              },
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: Assets.image.photo.provider(),
              ),
            ),
            CustomIconButton(
              icon: Assets.icon.notification.svg(color: Colors.cyan),
              size: 50,
              onPressed: (){
                 
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppText.large(
            'Chào mừng đến với app hotel của chúng tôi 👋',
            color: Colors.black,
          ),
          // Text(,
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 28,
          //   color:  Colors.white
          // ),),
        )
      ],
    );
  }
}
