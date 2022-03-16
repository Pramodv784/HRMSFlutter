import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/Utility.dart';

class CommonPage extends StatefulWidget {
  String title;

  CommonPage(this.title, {Key key}) : super(key: key);

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(children: [
          Header(
            headerText: '${widget.title}',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Images.CommingSoon),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                    'Coming Soon!!!',
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900,letterSpacing: 2.0),
                  overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  opendFilterDialog() {
    Scaffold body = Scaffold(
      backgroundColor: AppColors.background.withOpacity(0.1),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          height: Utility.screenHeight(context) * .63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: textStyleWhite12px400w,
                      ),
                      InkWell(
                        child: Image.asset(Images.CloseIcon),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Filter by Team Lead ',
                    style: textStyleWhite12px400w,
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.red, fontSize: 16.0),
                  ),
                ])),
                SizedBox(
                  height: 5.0,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.dropbg,
                  ),
                  dropdownColor: Colors.white,
                  onChanged: (String value) {
                    setState(() {
                      //_selected=value;
                      print('Valuse....${value}');
                    });
                  },
                  hint: Text('Filter type'),
                  icon: new Image.asset(Images.DropIcon),
                  items: ["filter   type"]
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label.toString(),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Filter by Team lead ',
                    style: textStyleWhite12px400w,
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.red, fontSize: 16.0),
                  ),
                ])),
                SizedBox(
                  height: 5.0,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.dropbg,
                  ),
                  dropdownColor: Colors.white,
                  onChanged: (String value) {
                    setState(() {
                      print('Team Id ****$value');
                    });
                  },
                  hint: Text('Team'),
                  icon: new Image.asset(Images.DropIcon),
                  items: ["filter   type"]
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label.toString(),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Filter by Date',
                    style: textStyleWhite12px400w,
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.red, fontSize: 16.0),
                  ),
                ])),
                SizedBox(
                  height: 5.0,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.dropbg,
                  ),
                  dropdownColor: Colors.white,
                  onChanged: (String value) {
                    setState(() {
                      // _selected = value;
                    });
                  },
                  hint: Text('Employee name'),
                  icon: new Image.asset(Images.DropIcon),
                  items: ["feed back type"]
                      .map((label) => DropdownMenuItem(
                            child: Text(label.toString()),
                            value: label,
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: AppColors.colorPrimary,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: OutlineButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        highlightedBorderColor: AppColors.colorPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
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

    showDialog<String>(
        context: context,
        builder: (context) {
          return body;
        });
  }
}
