import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'styles/text_styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'styles/app_colors.dart';
import 'package:rive/rive.dart';
import 'styles/app_icons.dart';
import 'get_firebase_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SMITrigger? _grow;
  //StateMachineController? controller;

  // document IDs
  List<String> docIDs = [];
  AccountData user = AccountData();
  bool grow = false;

  Future getDocId() async {
    CollectionReference accounts =
        await FirebaseFirestore.instance.collection('Accounts');

    accounts.get().then((snapshot) => snapshot.docs.forEach((document) {
          print(document.reference.id);
          docIDs.add(document.reference.id);
        }));
  }

  void updateInfo() async {
    if (docIDs.length != 0) {
      CollectionReference accounts =
          FirebaseFirestore.instance.collection('Accounts');
      final snapshot = await accounts.doc(docIDs[0]).get();
      final data = snapshot.data() as Map<String, dynamic>;
      user.exp = data['Experience'];
      print(user.exp);
    }
    if (user.exp >= 1000) {
      grow = true;
    }
  }

  void updateGrow() {
    if (grow)
      _triggerGrow();
    else {
      print("growing fails");
      /*final snackBar = SnackBar(
        content: const Text(
            'Your kitten is still too small~ Gain 1000exp to make your cat grow!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);*/
    }
  }

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _grow = controller.findInput<bool>('grow1') as SMITrigger;
  }

  void _triggerGrow() => _grow?.fire();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.pink,
              elevation: 0,
              toolbarOpacity: 0.7,
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'PetPark',
                ),
              )),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home_background2.jpg'),
                    fit: BoxFit.fitHeight)),
            child: Container(
              margin: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                      padding: EdgeInsets.all(10),
                      color: AppColors.orange,
                      child: FutureBuilder(
                        future: getDocId(),
                        builder: (context, snapshot) {
                          print(docIDs.length);
                          print(docIDs);
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            updateInfo();
                            return SizedBox(
                              width: 550,
                              height: 100,
                              child: GetAccountInfo(
                                  documentId: docIDs[
                                      0]), /*Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GetAccountInfo(documentId: docIDs[0]),
                                    Text("Experience:"),
                                    LinearPercentIndicator(
                                      width: 370,
                                      lineHeight: 15,
                                      percent: 0,
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.amberAccent,
                                      barRadius: Radius.circular(10),
                                    )
                                  ]),*/
                            );
                          }
                          return SizedBox(
                            width: 550,
                            height: 100,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("loading.."),
                                  Text("Experience:"),
                                  LinearPercentIndicator(
                                    width: 370,
                                    lineHeight: 15,
                                    percent: 0,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.amberAccent,
                                    barRadius: Radius.circular(10),
                                  )
                                ]),
                          );
                        },
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            radius: 40,
                            child: IconButton(
                              iconSize: 40,
                              icon: Image.asset(
                                'assets/icon_challenge.png',
                                width: 40,
                              ),
                              onPressed: () {},
                            )),
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            radius: 40,
                            child: IconButton(
                              iconSize: 40,
                              icon: Image.asset(
                                'assets/icon_leaderboard.png',
                                width: 40,
                              ),
                              onPressed: () {},
                            )),
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            radius: 40,
                            child: IconButton(
                              iconSize: 40,
                              icon: Image.asset(
                                'assets/icon_report.png',
                                width: 40,
                              ),
                              onPressed: () {},
                            )),
                        TextButton(
                            onPressed: () {
                              updateGrow();
                            },
                            child: Text('Grow up!'))
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: RiveAnimation.asset(
                      "assets/cat1_grow.riv",
                      fit: BoxFit.cover,
                      onInit: _onRiveInit,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

/*Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                      padding: EdgeInsets.all(10),
                      color: AppColors.orange,
                      child: /*const AccountDataB(userName: 'teresa'),*/
                          SizedBox(
                        width: 550,
                        height: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "Level {accountData.level} {accountData.petName} "),
                              Text("Experience"),
                              LinearPercentIndicator(
                                width: 370,
                                lineHeight: 15,
                                percent: 0.6,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.amberAccent,
                                barRadius: Radius.circular(10),
                              )
                            ]),
                      )),*/

/*class AccountDataB extends StatefulWidget {
  const AccountDataB({super.key, required this.userName});

  final String userName;

  @override
  State<AccountDataB> createState() => _AccountDataBState();
}

class _AccountDataBState extends State<AccountDataB> {
  //AccountData accountData = AccountData();
  //StateMachineController? controller;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance.collection('Accounts');

    return FutureBuilder<DocumentSnapshot>(
        future: user.doc().get(),
        //future: await accountData.getAccountData(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("User not found");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              width: 550,
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Level ${data['Level']} ${data['PetName']}"),
                    Text("Experience"),
                    LinearPercentIndicator(
                      width: 370,
                      lineHeight: 15,
                      percent: 0.6,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.amberAccent,
                      barRadius: Radius.circular(10),
                    )
                  ]),
            );
          }
          return Text("loading");
        });
  }
}*/
