// ignore: file_names
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';
import 'ReportImage.dart';
import 'Request.dart';





class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {




  late SingleValueDropDownController _cnt;

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  bool _submitted = false;
  bool _submitted2 = false;
  String? get _errorText {
    final text = _controller1.value.text;

    if (text.isEmpty) {
      return 'Required field';
    }
    // return null if the text is valid
    return null;
  }

  void initState() {
    _cnt = SingleValueDropDownController();
   // _cntMulti = MultiValueDropDownController();
    super.initState();
  }
  void dispose() {
    _cnt.dispose();
   // _cntMulti.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Request for Service",style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold) ),
          backgroundColor: Colors.yellow[800],

        ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 180.0),
          child: Column(
            children:[
              Center(
                child: Column(
                children: [
                  Container(
                  margin: const EdgeInsets.only(top:200),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 16,
                          color: Colors.black54,
                          offset: Offset(0, 10),
                        ),
                      ],
                      color: Colors.white),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Request Form',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),


//drop down to select category

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          height: 50.0,
                          width: 280,
                          child: DropDownTextField(
                            initialValue: null,

                            controller: _cnt,
                            clearOption: false,
                            enableSearch: false,
                            // validator: (value) {
                            //   if (value == null) {
                            //     setState(() {
                            //       _submitted2 = false;
                            //     });
                            //
                            //   } else {
                            //     setState(() {
                            //       _submitted2 = true;
                            //     });
                            //
                            //   }
                            //},
                            dropDownItemCount: 6,

                            dropDownList: const [

                              DropDownValueModel(name: 'Cleaning', value: "1"),
                              DropDownValueModel(name: 'Maintenance', value: "2"),
                              DropDownValueModel(name: 'Gantry Issues', value: "3"),
                              DropDownValueModel(name: 'Security', value: "4"),
                              DropDownValueModel(name: 'Others', value: "5"),
                            ],
                            onChanged: (val) {
                              setState(() {
                              _submitted2 = true;
                            });},
                          ),
                        ),
                      ),





//location of carpark

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                        child: SizedBox(
                          height: 50.0,
                          width: 280,
                          child: TextField(
                            controller: _controller1,
                            maxLength: 300,
                            textInputAction: TextInputAction.done,
                            onChanged: (String text) {
                              // setState(() {
                              //   _submitted = false;
                              // });
                            },

                            onSubmitted: (String submit) {

                              setState(() {
                                _errorText!=null ? _submitted = false: _submitted=true;
                              });
                              if (_errorText == null) {
                                DateTime now = DateTime.now();
                                String dateTime = DateFormat('dd-MM-yyyy').format(now);

                              }
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(

                              labelText:'Location of Carpark' ,
                              labelStyle:TextStyle(color: Colors.grey,),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),

                              ),

                              errorText: _submitted ?  null : _errorText ,
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              suffixIcon: IconButton(
                                  iconSize: 20.0,
                                  icon: Icon(Icons.clear),
                                  onPressed: (){ _controller1.clear();
                                  setState(() {
                                    _submitted = false;
                                  });
                                  },
                            ),
                          ),
                        ),
                      ),
                      ),

//description

                      SizedBox(
                        height: 50.0,
                        width: 280,
                        child: TextField(
                          controller: _controller2,
                          maxLength: 3000,


                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              iconSize: 20.0,
                              icon: Icon(Icons.clear),
                              onPressed: (){ _controller2.clear();
                              },
                            ),
                            hintMaxLines: 5,
                            enabledBorder: UnderlineInputBorder(

                              borderSide: BorderSide(color: Colors.grey),

                            ),
                           // contentPadding: const EdgeInsets.all(5.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Write a description...(optional)',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),

                          ),
                        ),
                      ),

                      SizedBox(height:20.0, width:280),

                    ],
                  ),
                ),



              SizedBox(
                height: 50.0,
                width: 280,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_sharp),
                    color: Colors.brown,
                    iconSize: 40.0,

                    onPressed: () async {
                      print(_submitted );
                      print(_submitted2);
                      if(_submitted && _submitted2){



                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportImage()));
                     _controller1.clear();
                     _controller2.clear();
                     _submitted = false;



                      }


                    }
                      //pop up Thank you for reporting!!



                  ),
                ),
              )



          ]
                ),
              ),


            ]
          ),
        ),
      ),
    );

  }
}
