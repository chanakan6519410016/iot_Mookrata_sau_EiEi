import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUi extends StatefulWidget {
  const MenuUi({super.key});

  @override
  State<MenuUi> createState() => _MenuUiState();
}

class _MenuUiState extends State<MenuUi> {
//เก็บรูปที่จะไปแสดงที่ ListView เมนูหมูกะทะ
List <String> menuList = [
  'assets/images/img1.png',
  'assets/images/img2.png',
  'assets/images/img3.png',
  'assets/images/img4.png',
  'assets/images/img5.png',
  'assets/images/img6.png',
  'assets/images/img7.png',
];

//สร้างตัวแปรเก็บรูปที่จะไปแสดงที่ ListView สาขาหมูกะทะ
List <String> branchList = [
  'assets/images/shop1.png',
  'assets/images/shop2.png',
  'assets/images/shop3.png',
  'assets/images/shop4.png',
  'assets/images/shop5.png',

];

//สร้างตัวแปรเก็บเบอร์โทรร้านสาขา 5 ร้าน
List <String> phoneList = [
  '1234',
  '5678',
  '8765',
  '4321',
  '8998',
];


Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Image.asset(
              'assets/images/logo.png',
              width: 150.0,
            ),
            SizedBox(height: 30.0),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        menuList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
             SizedBox(height: 30.0),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 30.0),
             Expanded(
               child: Container(
                margin: EdgeInsets.only(
                  left: 65.0,
                  right: 65.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: branchList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: InkWell(
                          onTap: () {
                            _makePhoneCall(phoneList[index]);
                          },
                          child: Image.asset(
                            branchList[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                           ),
             ),
          ],
        ),
      ),
    );
  }
}
