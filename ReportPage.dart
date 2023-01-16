
import 'styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'Request.dart';
import 'ReportIssue.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: const ReportPage()));
}

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  late Future<List<Request>> _requestsList;

  @override
  void initState(){
    super.initState();
    _requestsList = getList();

  }


  Future <List<Request>> getList() async {
    List<Request> requestsList = [];
    Map<dynamic, dynamic> mdata = new Map<dynamic, dynamic>();
    // await Future.delayed(Duration(seconds: 3));

    var snapshot = await FirebaseFirestore.instance
        .collection("requests")
        .get();

    if (snapshot.docs.isNotEmpty) {


      for (int i = 0; i < snapshot.docs.length; i++) {
        mdata = snapshot.docs[i].data();


        requestsList.add(Request(
            date: mdata["date"],
            location: mdata['location'],
            category: mdata['category'],
            image: mdata['image'],
            description: mdata['description'],
          status: mdata['status'],
        ));
      }
      //   }
      //       }
      //   //  }
      //   }
      // }


    }
    return Future.value(requestsList);
  }



  //dummy list
  // List reqList = [
  //   Request(date: '22-Jul-2023', category:'Maintenance', location:'Woodlands Blk 333', description: 'Request for paintwork services', image:'assets/images/paint' ),
  //   Request(date: '01-Jan-2023', category:'Gantry Issues', location:'Boon Lay Blk 999', description: 'Fix gantry', image:'assets/images/paint' ),
  //   Request(date: '20-Jan-2023', category:'Maintenance', location:'NTU Blk 50', description: 'Request for paintwork services', image:'assets/images/paint' ),
  //
  // ];



  Widget RequestCard(category, date, location, index) {
    int activeStep = 0;
    return Container(
      margin: const EdgeInsets.only(top:30, left:10, right:10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              color: Colors.black26,
              offset: Offset(0, 10),
            ),
          ],
          color: Colors.white),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
          children: [
      Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text('Category: ${category}', style: TextStyle(color: Colors.grey), )),
            Align(alignment: Alignment.centerLeft, child: Text('Date Reported: ${date}', style: TextStyle(color: Colors.grey), textAlign: TextAlign.end)),
            Align(alignment: Alignment.centerLeft, child: Text('Location: ${location}', style: TextStyle(color: Colors.grey), textAlign: TextAlign.end)),
          ]
      ),


    Container(
    child: EasyStepper(
    activeStep: index, //need this to change based on admin though
    lineLength: 50,
    stepShape: StepShape.rRectangle,
    stepBorderRadius: 15,
    borderThickness: 3,
    padding: 20,
    stepRadius: 30,

    finishedStepBorderColor: Colors.deepOrange,
    finishedStepTextColor: Colors.deepOrange,
    finishedStepBackgroundColor: Colors.deepOrange,
    activeStepIconColor: Colors.deepOrange,
    //loadingAnimation: 'assets/loading_circle.json',
    steps: const [
    EasyStep(
      finishIcon: Icon(Icons.mark_email_read),
      icon: Icon(Icons.mark_as_unread),
      title: 'Request Received',
    ),
    EasyStep(
      icon: Icon(Icons.category_outlined),
      finishIcon: Icon(Icons.category_rounded),
      title: 'Processing Request',
    ),
    EasyStep(
      icon: Icon(Icons.local_shipping_outlined),
      finishIcon: Icon(Icons.local_shipping_rounded),
      title: 'On The Way',
    ),
    EasyStep(
      icon: Icon(Icons.work_history_outlined),
      finishIcon: Icon(Icons.work_history),
      title: 'Work In Progress',
    ),
    EasyStep(
      icon: Icon(Icons.check_circle_outline_outlined),
      title: 'Completed',
    ),

    ],
    onStepReached: (index) =>
    setState(() => activeStep = index),
    ),
    ),
    ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Service Requests",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold) ),
        backgroundColor: AppColors.pink,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportIssue())); },
          child: Icon(Icons.report_gmailerrorred_rounded, color: Colors.white, size: 50.0),
          backgroundColor: AppColors.pink,
        ),

         body: Column(children: <Widget> [Expanded(child: _buildRequestsList())],
      //ListView.builder(
        //   itemCount: reqList.length,
        //   itemBuilder: (context, index){
        //     return RequestCard(reqList[index].category,reqList[index].date, reqList[index].location, index);
        //
        //   }
        //
        // ),

         ),


    );
  }



  Widget _buildRequestsList() {

    //Future<List> commentsList = await _buildList();

    return FutureBuilder<List<Request>>(
      future: _requestsList,
      builder: (ctx, snapshot) {


        //List<Comment> comments = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if(!snapshot.hasData) return Container();
            return _buildListView(snapshot);
          default:
            return _buildLoadingScreen();
        }
      },
    );

  }


  Widget _buildListView(AsyncSnapshot<List<Request>> snapshot) {

    return  ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index){
          return RequestCard(snapshot.data![index].category, snapshot.data![index].date, snapshot.data![index].location, snapshot.data![index].status);

        }

    );
  }
  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );

  }



}

