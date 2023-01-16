import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'Request.dart';
import 'ReportIssue.dart';

void main() {
  runApp(MaterialApp(home: const ReportPage()));
}

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  //dummy list
  List reqList = [
    Request(date: '22-Jul-2023', category:'Maintenance', location:'Woodlands Blk 333', description: 'Request for paintwork services', image:'assets/images/paint' ),
    Request(date: '01-Jan-2023', category:'Gantry Issues', location:'Boon Lay Blk 999', description: 'Fix gantry', image:'assets/images/paint' ),
    Request(date: '20-Jan-2023', category:'Maintenance', location:'NTU Blk 50', description: 'Request for paintwork services', image:'assets/images/paint' ),

  ];



  Widget RequestCard(category, date, location, index) {
    int activeStep = 0;
    return Container(
      margin: const EdgeInsets.only(top:30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              color: Colors.black12,
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
        appBar: AppBar(
          title: Text("Service Requests",style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold) ),
        backgroundColor: Colors.yellow[800],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportIssue())); },
          child: Icon(Icons.report_gmailerrorred_rounded, color: Colors.white, size: 50.0),
          backgroundColor: Colors.red,
        ),

        body: ListView.builder(
          itemCount: reqList.length,
          itemBuilder: (context, index){
            return RequestCard(reqList[index].category,reqList[index].date, reqList[index].location, index);

          }

        ),


    );
  }
}

