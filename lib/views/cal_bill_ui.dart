import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUiState();
}

class _CalBillUiState extends State<CalBillUI> {


  File? imgFlie;
 
  Future getCemera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      imgFlie = File(image.path);
    });
  }
 
  Future getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      imgFlie = File(image.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.0,
            bottom: 50.0,
            left: 40.0,
            right: 40.0,
          ),
          child: Center(
            child: Column(
              children: [
               InkWell(
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) => Wrap(
                      children: [
                        ListTile(
                         onTap: () {
                              getCemera()
                                  .then((Value) => {Navigator.pop(context)});
                            },
                          leading: Icon(
                            Icons.camera_alt,
                            color: Colors.deepOrange,
                          ),
                          title: Text(
                            'เปิดกล้อง',
                            style: TextStyle(
                              color: Colors.deepOrange
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                              getGallery()
                                  .then((Value) => {Navigator.pop(context)});
                            },
                          leading: Icon(
                            Icons.browse_gallery,
                            color: Colors.deepOrange,
                          ),
                          title: Text(
                            'เปิดแกลเลอรี่',
                            style: TextStyle(
                              color: Colors.deepOrange
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
                 child: Image.asset(
                    'assets/images/camera.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}