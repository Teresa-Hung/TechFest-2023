import 'package:flutter/material.dart';
import 'package:petpark/utils/app_constants.dart';
import 'package:petpark/widgets/textwidget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpark/widgets/hdbIntroScreen.dart';
import 'package:petpark/views/enterScreen.dart';
import 'package:petpark/views/signUpScreen.dart';
import 'package:petpark/styles/app_colors.dart';
import 'package:petpark/animation/home.dart';
import 'package:petpark/views/signUpScreen.dart';

class loginWidget extends StatelessWidget {
  const loginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Expanded(
        child: Column(children: [
          textWidget(text: AppConstants.helloNiceToMeetYou),
          textWidget(
              text: AppConstants.welcome,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          //textWidget(text: "to", fontSize: 20, fontWeight: FontWeight.bold),
          textWidget(
              text: AppConstants.petpark,
              fontSize: 50,
              fontWeight: FontWeight.bold),

          // Spaced seprator
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),

          // Container for the Email
          Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),

            // The Text "Email" in the box"
            child: Row(children: [
              Expanded(
                  flex: 3,
                  child: TextField(
                    // controller: _emailController,
                    //controller: _emailController,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 12),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        hintText: AppConstants.enterYourEmail,
                        border: InputBorder.none),
                  ))
            ]),
          ),

          // Spaced seprator
          const SizedBox(
            height: 15,
          ),

          // Containter for the password
          Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),

            // The Text "Password" in the box"
            child: Row(children: [
              Expanded(
                  flex: 3,
                  child: TextField(
                    // controller: _passwordController,
                    //controller: _passwordController,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: true,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      hintText: AppConstants.enterYourPassword,
                      border: InputBorder.none,
                    ),
                    /* onSubmitted: (value) async {
                                User? user = await loginUsingUserPassword(
                                    username: _emailController.text,
                                    password: _passwordController.text,
                                    context: context);
                                print(user);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => EnterScreen()));
                                }
                              },*/
                  ))
            ]),
          ),

          // Spaced seprator
          const SizedBox(
            height: 30,
          ),

          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen())),
                    child: Text(
                      "Sign up here.",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ))
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => {
              print("pressed"),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
            },
            child: SizedBox(
              child: const DecoratedBox(
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              width: 80,
              height: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
// class LoginWidget extends StatefulWidget {
//   const LoginWidget({super.key});

//   @override
//   State<LoginWidget> createState() => _LoginWidgetState();
// }

// class _LoginWidgetState extends State<LoginWidget> {
//   // Login Function
//   static Future<User?> loginUsingUserPassword(
//       {required String username,
//       required String password,
//       required BuildContext context}) async {
//     // Authenticating the current user
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       // Signing in with the entered email and password
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: username, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       // If no email was entered
//       if (e.code == "user-not-found") {
//         print("No User Found!");
//         Get.snackbar("Error", "No Account Found!",
//             icon: Icon(
//               Icons.error,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             borderRadius: 20,
//             margin: EdgeInsets.all(15),
//             colorText: Colors.white);
//       } else {
//         // If password or email was invalid
//         Get.snackbar("Error", "Either your email or passsword is incorrect!",
//             icon: Icon(
//               Icons.error,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             borderRadius: 20,
//             margin: EdgeInsets.all(15),
//             colorText: Colors.white);
//       }
//     }
//     return user;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Create the textfiled controller
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();

//     return Container(
//       width: Get.width,
//       height: Get.height,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // BusAway icons and title
//             hdbIntroScreen(),

//             //Spaced seprator
//             const SizedBox(
//               height: 35,
//             ),

//             // Login details
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Greeting messages
//                     textWidget(text: AppConstants.helloNiceToMeetYou),
//                     textWidget(
//                         text: AppConstants.welcome,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),

//                     // Spaced seprator
//                     const SizedBox(
//                       height: 30,
//                     ),

//                     // Container for the Email
//                     Container(
//                       width: double.infinity,
//                       height: 55,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black.withOpacity(0.05),
//                                 spreadRadius: 2,
//                                 blurRadius: 2)
//                           ]),

//                       // The Text "Email" in the box"
//                       child: Row(children: [
//                         Expanded(
//                             flex: 3,
//                             child: TextField(
//                               // controller: _emailController,
//                               controller: _emailController,
//                               style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                   fontSize: 12),
//                               textAlign: TextAlign.left,
//                               textAlignVertical: TextAlignVertical.center,
//                               decoration: InputDecoration(
//                                   prefixIcon: const Icon(
//                                     Icons.email,
//                                     color: Colors.black,
//                                   ),
//                                   hintStyle: GoogleFonts.poppins(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.grey),
//                                   hintText: AppConstants.enterYourEmail,
//                                   border: InputBorder.none),
//                             ))
//                       ]),
//                     ),

//                     // Spaced seprator
//                     const SizedBox(
//                       height: 15,
//                     ),

//                     // Containter for the password
//                     Container(
//                       width: double.infinity,
//                       height: 55,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black.withOpacity(0.05),
//                                 spreadRadius: 2,
//                                 blurRadius: 2)
//                           ]),

//                       // The Text "Password" in the box"
//                       child: Row(children: [
//                         Expanded(
//                             flex: 3,
//                             child: TextField(
//                               // controller: _passwordController,
//                               controller: _passwordController,
//                               textAlign: TextAlign.left,
//                               textAlignVertical: TextAlignVertical.center,
//                               obscureText: true,
//                               style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 12,
//                                   color: Colors.black),
//                               decoration: InputDecoration(
//                                 prefixIcon: const Icon(
//                                   Icons.lock,
//                                   color: Colors.black,
//                                 ),
//                                 hintStyle: GoogleFonts.poppins(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey),
//                                 hintText: AppConstants.enterYourPassword,
//                                 border: InputBorder.none,
//                               ),
//                               onSubmitted: (value) async {
//                                 User? user = await loginUsingUserPassword(
//                                     username: _emailController.text,
//                                     password: _passwordController.text,
//                                     context: context);
//                                 print(user);
//                                 if (user != null) {
//                                   Navigator.of(context).pushReplacement(
//                                       MaterialPageRoute(
//                                           builder: (context) => EnterScreen()));
//                                 }
//                               },
//                             ))
//                       ]),
//                     ),

//                     // Spaced seprator
//                     const SizedBox(
//                       height: 30,
//                     ),

//                     // Text to display sign up as well as the function called when pressed
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => SignUpScreen());
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Don't have an account yet?",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 11),
//                             ),
//                             const Text(
//                               " Sign up here",
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
