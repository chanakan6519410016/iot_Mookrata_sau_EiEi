import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_mookrata_project/views/about_ui.dart';
import 'package:iot_mookrata_project/views/cal_bill_ui.dart';
import 'package:iot_mookrata_project/views/menu_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
//ตัวควบคุมการเปลี่ยนหน้า item ของ AnimatedNotchBottomBar
  final itemCtrl = NotchBottomBarController(index: 1);

//สร้างตัวแปรเก็บ ui ที่จะแสดซ่งล้อกับ item ของ AnimatedNotchBottomBar ที่เลือก
List<Widget>itemUIshow = [
  CalBillUi(),
  MenuUi(),
  AboutUi(),
];
//สร้างตัวแปรเก็บ index ของ item ที่เลือก
int selectIhdex = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            selectIhdex = valueParam;
          });
        },
        notchBottomBarController: itemCtrl,
        color: Colors.deepOrange,
        notchColor: Colors.deepOrange,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        bottomBarItems: [
          BottomBarItem(
            itemLabel: 'คิดเงิน',
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey[400],
            ),
          ),
          BottomBarItem(
            itemLabel: 'หน้าหลัก',
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            inActiveItem: Icon(
              Icons.home,
              color: Colors.grey[400],
            ),
          ),
          BottomBarItem(
            itemLabel: 'เกี่ยวกับ',
            activeItem: Icon(
              FontAwesomeIcons.star,
              color: Colors.white,
            ),
            inActiveItem: Icon(
              FontAwesomeIcons.star,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
      body: itemUIshow[selectIhdex],
    );
  }
}