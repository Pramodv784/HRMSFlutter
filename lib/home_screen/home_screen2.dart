import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/home_screen/model/home_data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

import 'card/card_home.dart';
class HomeScreen2 extends StatefulWidget {
   HomeScreen2({Key key}) : super(key: key);


  @override
  _HomeScreen2 createState() => _HomeScreen2();
}

class _HomeScreen2 extends State<HomeScreen2> {
  var text=0;
  List<dynamic> products;
  String productsJson =
      '{"last": [{"product_id":"62","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"61","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"57","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"63","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"64","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"58","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
      '{"product_id":"59","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}]}';
  @override
  void initState() {
    Map<String, dynamic> decoded = json.decode(productsJson);
    products = decoded['last'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'Home',),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                        shrinkWrap: true, // You won't see infinite size error
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 1.0,
                        primary: false,

                        children: List.generate(
                            homeList.length, (index) {
                          //return CardHome(homeList[index]);
                        }
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )

    );
  }

}
