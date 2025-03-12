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

  bool? isAdult = false;
  bool? isChild = false;

  //สร้างตัวควบคุม   TextField
  TextEditingController adultCtrl = TextEditingController();
  TextEditingController childCtrl = TextEditingController();

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
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                          Divider(),
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
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                   child: imgFlie == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          imgFlie!,
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(height: 35.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isAdult = value;
                          if (value == false) {
                            adultCtrl.clear();
                          }
                        });
                      },
                      value: isAdult,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        enabled: isAdult,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isChild = value;
                          if (value == false) {
                            childCtrl.clear();
                          }
                        });
                      },
                      value: isChild,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: childCtrl,
                        enabled: isChild,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
