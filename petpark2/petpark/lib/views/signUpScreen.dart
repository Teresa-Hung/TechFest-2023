import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petpark/widgets/hdbIntroScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petpark/animation/home.dart';
import 'package:petpark/utils/app_constants.dart';
import 'package:petpark/widgets/textwidget.dart';
import 'package:petpark/styles/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signUp() async {
    try {
      // Try and create the account in firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      print("entered");
      Get.to(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      // Case if the email is invalid
      if (e.code == "invalid-email") {
        Get.snackbar("Invalid Email", "Enter a valid email",
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 20,
            margin: EdgeInsets.all(15),
            colorText: Colors.white);
      }
      // Case if the passsword is too short
      else if (e.code == "weak-password") {
        Get.snackbar("Weak Password", "Enter a longer password",
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 20,
            margin: EdgeInsets.all(15),
            colorText: Colors.white);
      } else {
        print("Unkonwn error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Container for the Bus logo and sign up text
              Container(
                height: Get.height * 0.50,
                child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: Get.height,
                  // child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   SvgPicture.asset('assets/image.png'),
                  //   // const SizedBox(
                  //   //   height:20
                  //   // ,)
                  // ]),
                  child: Text("Sign up!"),
                ),
              ),

              // Return / back button on top right corner
              Positioned(
                top: 30,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                ),
              ),
            ],
          ),

          // Space seprator
          const SizedBox(
            height: 20,
          ),

          // Containers for the email and password boxes
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                // "It only takes a while" text widget
                textWidget(
                    text: AppConstants.signUp,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 30,
                ),

                // Code for the email box
                TextFieldWidget("Email", Icons.email, emailController),
                const SizedBox(
                  height: 15,
                ),

                // Code for the password box
                TextFieldWidget("Password", Icons.lock, passwordController),
                const SizedBox(
                  height: 30,
                ),

                // Code for the submit button
                submitButton("Submit", signUp),
              ],
            ),
          )
        ],
      )),
    );
  }
}

TextFieldWidget(
    String title, IconData iconData, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        width: Get.width,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: controller,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, color: Colors.black, fontSize: 12),
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconData,
                color: Colors.black,
              ),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              hintText: title,
              border: InputBorder.none),
        ),
      )
    ],
  );
}

Widget submitButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: Get.width,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: AppColors.pink,
    onPressed: () => {
      Get.to(HomeScreen()),
      //print("submitted pressed"),
    },
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: Get.width,
//     decoration: const BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('assets/background.png'),
//         fit: BoxFit.cover,
//       ),
//     ),
//     height: Get.height,
//       ),
//     );
//   }
// }
