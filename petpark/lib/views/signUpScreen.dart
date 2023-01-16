import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petpark/widgets/hdbIntroScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          hdbIntroScreen(),
        ]),
      ),
    );
  }
}
