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

  //สร้างตัวแปรเก็บสภถานะใช้ได้ไม่ได้ ป้อนโค้กน้ำเปล่า
  bool? iswater = false;

  //สร้างตัวควบคุม   TextField
  TextEditingController adultCtrl = TextEditingController();
  TextEditingController childCtrl = TextEditingController();
  TextEditingController cokeCtrl = TextEditingController();
  TextEditingController pureCtrl = TextEditingController();

  //สร้างตัวแปร Radio  เพื่อให้อยู่กลุ่มเดียวกัน
  int groupWator = 1;

  //สร้างตัวแปรที่เลือกจาก Dropdoen
  String? groupMember = 'ไม่เป็นสมาชิก';


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
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: groupWator,
                      onChanged: (value) {
                        setState(() {
                          groupWator = value!;
                          iswater = false;
                          cokeCtrl.clear();
                          pureCtrl.clear();
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                 Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: groupWator,
                      onChanged: (value) {
                         setState(() {
                          groupWator = value!;
                          iswater = true;
                        });
                      },
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'โค้ก 20 บาท/ขวด จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        enabled: iswater,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'น้ำเปล่า 15 บาท/ขวด จำนวน  ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        enabled: iswater,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),        
                Row(
                  children: [
                    Text(
                      'ประเภทสมาชิก',
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    DropdownButton<String>(
                      value: groupMember,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: const Color.fromARGB(255, 214, 35, 35),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          groupMember = newValue!;
                        });
                      },
                      items: <String>['ไม่เป็นสมาชิก', 'สมาชิกทั่วไปลด 10%', 'สมาชิก VIPลด 20%']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: groupMember == value ? Colors.redAccent: Colors.black,
                            ),
                            ),
                        );
                      }).toList(),
                    ),                    
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณ',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
