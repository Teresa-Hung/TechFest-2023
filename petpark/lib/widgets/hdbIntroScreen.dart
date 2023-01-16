import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petpark/widgets/login_widget.dart';

Widget hdbIntroScreen() {
  return Container(
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/blueBackground.png'),
        fit: BoxFit.cover,
      ),
    ),
    height: Get.height * 0.6,
    // child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //   SvgPicture.asset('assets/image.png'),
    //   // const SizedBox(
    //   //   height:20
    //   // ,)
    // ]),
    child: const LoginWidget(),
  );
}
