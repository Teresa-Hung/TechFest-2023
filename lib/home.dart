import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'styles/text_styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'styles/app_colors.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SMITrigger? _grow;
  //StateMachineController? controller;

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
                      child: SizedBox(
                        width: 550,
                        height: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Level 10 My Kitten"),
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
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_challenge.png',
                            fit: BoxFit.contain,
                          ),
                          /*backgroundImage:
                                AssetImage('assets/icon_challenge.png')*/
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_leaderboard.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_report.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        TextButton(
                            onPressed: _triggerGrow, child: Text('Grow up!'))
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
                  /*Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/cat2-2.png',
                      height: 300,
                    ),
                  ),*/
                ],
              ),
            ),
          )),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                      child: SizedBox(
                        width: 550,
                        height: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Level 10 My Kitten"),
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
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_challenge.png',
                            fit: BoxFit.contain,
                          ),
                          /*backgroundImage:
                                AssetImage('assets/icon_challenge.png')*/
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_leaderboard.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 40,
                          child: Image.asset(
                            'assets/icon_report.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: RiveAnimation.asset(
                      "assets/cat1_grow.riv",
                      fit: BoxFit.cover,
                    ),
                  ),
                  /*Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/cat2-2.png',
                      height: 300,
                    ),
                  ),*/
                ],
              ),
            ),
          )),
    );
  }
}
