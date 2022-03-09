import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/holidays/holiday_presenter.dart';
import 'package:hrms/holidays/holiday_view.dart';
import 'package:hrms/holidays/model/get_all_holidays_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Utility.dart';

import '../res/Fonts.dart';
import '../utility/Header.dart';
import 'card_holiday.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({Key key}) : super(key: key);

  @override
  _HolidayPageState createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> implements HolidayView {
  HolidayPresenter _presenter;
  List<Holiday> holidayList = [];

  @override
  void initState() {
    _presenter = HolidayPresenter(this);
    _presenter.getHoliday(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(children: [
          Header(
            headerText: 'Holidays',
          ),
          Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: ListView.builder(
                    itemCount: holidayList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(10.0),
                        title:
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 52,
                                  width: Utility.screenWidth(context),
                                  child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                      child: Image.network(holidayList[index].imageUrl,fit: BoxFit.cover))),
                              Align(

                                child: Text('${holidayList[index].holidayName} \n ${Utility.getDayFromServer(holidayList[index]?.holidayDate ?? "")}',style: textStyleWhiteRegular18pxW700,),
                                alignment: Alignment.center,
                              ),

                              
                            ],
                          ),
                        leading:   Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.colorPrimary,width: 0.5)
                          ),
                          child: Column(
                            children: [
                              Flexible(child: Text(' ${Utility.getDateMonth(holidayList[index]?.holidayDate ?? "").replaceAll(' ', '\n')}',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800),)),
                            
                            ],
                          ),
                        ),
                      );
                    }),
              ))
        ]),
      ),
    );
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onFeedHolidayFecthed(GetAllHolidaysResponse response) {
    print('response *****${response.holiday.length}');
    holidayList.clear();
    holidayList.addAll(response.holiday);
    setState(() {});
  }
}
