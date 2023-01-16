import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petpark/widgets/hdbIntroScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
