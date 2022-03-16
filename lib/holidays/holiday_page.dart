import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/holidays/holiday_presenter.dart';
import 'package:hrms/holidays/holiday_view.dart';
import 'package:hrms/holidays/model/GetAllHolidaysResponse.dart';

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
  List<Data> holidayList = [];

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          itemCount: holidayList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return  Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.colorPrimary,width: 0.5)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    child: Text('${Utility.getDateMonth(holidayList[index]?.holidayDate ?? "").replaceAll(' ', ' (')})',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                  ),
                                  Flexible(
                                    child: ClipRRect(
                                        child: Image.network(holidayList[index].imageUrl,
                                          fit: BoxFit.cover,height: 130.0,width: Utility.screenWidth(context),)),
                                  ),
                                  Container(
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    width: Utility.screenWidth(context),
                                    color: AppColors.colorPrimary,
                                    child: Text('${holidayList[index].holidayName}',style:
                                    TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900,color: AppColors.white),),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
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
   // print('response *****${response.holiday.length}');
    holidayList.clear();
    holidayList.addAll(response.data);
    setState(() {});
  }
}
