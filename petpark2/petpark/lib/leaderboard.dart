import 'package:flutter/material.dart';
import 'package:petpark/styles/app_colors.dart';

class LeaderBoardScreen extends StatelessWidget {
  List name = ['Christiano', 'Hermione', 'Wednesday', 'Zedd'];
  List experience = ['1500', '1340', '900', '859'];
  List ranking = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            title: Text('Leaderboard'),
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Icon(
                Icons.grid_view,
                color: Colors.white,
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      /* Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.8),
                      color: Colors.black
                    ),
                    /* child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Region', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ) */
                  ),
                  SizedBox(height: 20.0), */
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            WinnerContainer(
                              height: 120,
                              winnerName: 'Hermione',
                              rank: '2',
                              experience: '1340',
                              color: Colors.blue[400],
                            ),
                            WinnerContainer(
                              isFirst: true,
                              winnerName: 'Christiano',
                              experience: '1500',
                              rank: '1',
                              color: Colors.redAccent[700],
                            ),
                            WinnerContainer(
                              height: 120,
                              winnerName: 'Wednesday',
                              experience: '900',
                              rank: '3',
                              color: Colors.green[600],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.red[400],
                                                      radius: 100,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 27,
                                                        backgroundImage:
                                                            AssetImage(
                                                                'assets/cat1.png'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.0),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(name[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(experience[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 15.0)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(ranking[index],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .red[400],
                                                              fontSize: 25.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ))
                                            ]),
                                      )));
                            }),
                      ),
                    ]))),
          )),
    );
  }
}

class WinnerContainer extends StatelessWidget {
  final bool isFirst;
  final Color? color;
  final String? winnerposition;
  final String? winnerName;
  final String? rank;
  final String? experience;
  final double? height;
  const WinnerContainer(
      {Key? key,
      this.isFirst = false,
      this.color,
      this.winnerposition,
      this.winnerName,
      this.rank,
      this.experience,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Container(
                height: height ?? 150.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(30.0))),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if (isFirst)
                  Image.asset('assets/c.png', height: 72.0, width: 95.0),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/cat1.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0, left: 40.0),
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color ?? Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Center(
                        child: Text(rank ?? '1',
                            style: TextStyle(color: Colors.red[400]))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0, left: 10),
            child: Center(
              child: Column(
                children: [
                  Text(winnerName ?? 'Tracey',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                  Text(experience ?? '234',
                      style: TextStyle(
                          color: color ?? Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
