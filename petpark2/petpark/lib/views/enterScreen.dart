import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petpark/widgets/textwidget.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          textWidget(text: "main page"),
        ]),
      ),
    );
  }
}
