import 'package:booking_hotel_ui/core/constants/color_constrants.dart';
import 'package:booking_hotel_ui/core/constants/dimesnion_constants.dart';
import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/pages/Home/Widget/SearchCard.dart';
import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key, required this.child, this.title, required this.implementLeading});
  final Widget child;
  final Widget? title;
  final bool implementLeading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(children: [
                    if (!implementLeading)
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(kDefaultPadding))),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                    size: kDefaultIconSize,
                                  ),
                        )
                  ]),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                  ),
                  Positioned(
                      top: 0, left: 0, child: Assets.image.oval2.image()),
                  Positioned(
                      bottom: 0, right: 0, child: Assets.image.oval1.image()),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: child,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
