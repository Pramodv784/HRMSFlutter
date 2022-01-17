import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
class AddFeedBack extends StatefulWidget {
  const AddFeedBack({Key key}) : super(key: key);

  @override
  _AddFeedBackState createState() => _AddFeedBackState();
}

class _AddFeedBackState extends State<AddFeedBack> {

  String _selected; // Option 2

    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
                Header(headerText: 'Add Feedback',),
              Expanded(child:
              ListView(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(text: 'Select Feedback type ',style: textStyleWhite12px400w,),
                            TextSpan(text: '*',style: TextStyle(color: AppColors.red,fontSize: 16.0),),
                          ]
                        )),

                        SizedBox(height: 5.0,),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
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
                          onChanged: (String value){
                            setState(() {
                              _selected=value;
                            });
                          },
                          hint: Text('Feed back type'),
                          icon: new Image.asset(Images.DropIcon),

                          items: ["feed back type"]
                              .map((label) => DropdownMenuItem(
                            child: Text(label.toString()),
                            value: label,
                          ))
                              .toList(),


                        ),
                        SizedBox(height: 20.0,),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: 'Select Team ',style: textStyleWhite12px400w,),
                              TextSpan(text: '*',style: TextStyle(color: AppColors.red,fontSize: 16.0),),
                            ]
                        )),

                        SizedBox(height: 5.0,),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
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
                          onChanged: (String value){
                            setState(() {
                              _selected=value;
                            });
                          },
                          hint: Text('Team'),
                          icon: new Image.asset(Images.DropIcon),

                          items: ["feed back type"]
                              .map((label) => DropdownMenuItem(
                            child: Text(label.toString()),
                            value: label,
                          ))
                              .toList(),


                        ),
                        SizedBox(height: 20.0,),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: 'Select Employee ',style: textStyleWhite12px400w,),
                              TextSpan(text: '*',style: TextStyle(color: AppColors.red,fontSize: 16.0),),
                            ]
                        )),

                        SizedBox(height: 5.0,),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
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
                          onChanged: (String value){
                            setState(() {
                              _selected=value;
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
                        SizedBox(height: 20.0,),



                      ],


                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemSize: 60,

                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  )
              ])
              ),
            bottomButton()
          ],
        ),
      ),
    );
  }
  Container bottomButton() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(0, -6),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RevButton(
              height: 55.0,
              text: 'Cancel',
              textStyle: textStyleDark16px600w,
              color: AppColors.grey,
              radius: 50.0,
              borderColor: AppColors.grey,
              onTap: () async {
                // opendDialog();
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: 'Select',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {
               // Navigator.pushNamed(context, Screens.AddFeedBack );
              },
            ),
          ),
        ],
      ),
    );
  }
}
