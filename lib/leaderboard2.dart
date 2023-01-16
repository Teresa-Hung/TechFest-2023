import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LeaderBoardScreen1 extends StatelessWidget {

  List name = ['Harry', 'Hermione', 'Wednesday', 'Zedd'];
  List experience = ['1500', '1340', '900', '859'];
  List ranking = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Leaderboard'),
        elevation: 0,
        backgroundColor: Colors.red[200],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 100,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27,
                            backgroundImage: AssetImage('assets/cat.png'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(name[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text(experience[index], style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                        ],
                      ),
                      
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(ranking[index], style: TextStyle(color: Colors.red[400], fontSize: 25.0, fontWeight: FontWeight.bold)),
                      ],
                    )
                  )
                      
                
                

                   
                   
                  
                ]  
              ),
            )
          )
          );
    
        }
      )
    );

  }
}