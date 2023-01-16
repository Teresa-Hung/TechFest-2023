import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ReportImage extends StatefulWidget {
  const ReportImage({Key? key}) : super(key: key);

  @override
  State<ReportImage> createState() => _ReportImageState();
}

class _ReportImageState extends State<ReportImage> {

  File? _image;

  Future getImage(source) async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveImage(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch(e){
      print("Failed to get image: $e");

    }
  }



  Future<File> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);

  }

  Widget ImageButton({required String title, required IconData icon, required VoidCallback onClick}){
      return Container(
        
          width: 300,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800],),

              onPressed:onClick,
              child: Row(
                  children: [
                   Icon(icon),
                    Text(title),
               ],
              )
           ),
        );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
          title: Text("Upload A Photo",style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold) ),
          backgroundColor: Colors.yellow[800],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Center(
          child: Column(
            children:[
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _image !=null ? Image.file(_image!, width:300, height:300,  fit: BoxFit.cover): Image.asset('assets/images/frame.png', width : 300, height: 300, color: Colors.brown),
              ),
              SizedBox(height: 40),
              ImageButton(title: "  Choose from Gallery", icon: Icons.image_outlined, onClick:() =>getImage(ImageSource.gallery) ),
              SizedBox(height: 10),
              ImageButton(title: "  Take A Photo", icon: Icons.camera, onClick:() => getImage(ImageSource.camera) ),
            ]
          )
        ),
      )

    );
  }
}
