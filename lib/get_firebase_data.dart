import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

/*class AccountData {
  late String petName;
  late int mode;
  late int level;
  late int exp;

  void getAccountData() async {
    //Map<dynamic, dynamic> account = new Map<dynamic, dynamic>();

    final data = await FirebaseFirestore.instance
        .collection('Accounts')
        .where('UserName', isEqualTo: this.userName)
        .get();

    petName = data.docs[0]['PetName'];
    mode = int.parse(data.docs[0]['Mode']);
    level = int.parse(data.docs[0]['Level']);
    exp = int.parse(data.docs[0]['Experience']);

    print(level);
    print(petName);
    /*var account = data.
        //var mydata = data.docs.map((e) => e.data()).toString();
        //Map<String, dynamic> account = mydata as Map<String, dynamic>;
        petName = data.querySelector('PetName');
    ;*/
    //print(data.docs.length);
  }
}*/

class AccountData {
  late String petName;
  late int level;
  late int exp;
}

class GetAccountInfo extends StatelessWidget {
  final String documentId;

  GetAccountInfo({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('Accounts');

    return FutureBuilder<DocumentSnapshot>(
      future: accounts.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Level ${data['Level']} ${data['PetName']}"),
                Text("Experience:"),
                LinearPercentIndicator(
                  width: 370,
                  lineHeight: 15,
                  percent: data['Experience'] / (data['Level'] * 100),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.amberAccent,
                  barRadius: Radius.circular(10),
                )
              ]);
        }
        return Text('loading..');
      }),
    );
  }
}
