import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/holidays/holiday_presenter.dart';
import 'package:hrms/holidays/holiday_view.dart';
import 'package:hrms/holidays/model/get_all_holidays_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Utility.dart';

import '../utility/Header.dart';
import 'card_holiday.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({Key key}) : super(key: key);

  @override
  _HolidayPageState createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> implements HolidayView {
  HolidayPresenter _presenter;
  List<GetAllHolidaysResponse> holidayList = [];

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
                        title: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Images.ImageHoliday),
                                colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
                             opacity: 0.5,
                              fit: BoxFit.fill
                            )
                          ),
                            child: Column(
                              children: [
                                Text(holidayList[index].holidayName,style: TextStyle(fontSize: 15.0,color: AppColors.white,fontWeight: FontWeight.w800),),
                                Text('${Utility.getDayFromServer(holidayList[index]?.holidayDate?? "")}',style: TextStyle(fontSize: 15.0,color: AppColors.white,)),
                              ],
                            )),
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
  void onFeedHolidayFecthed(List<GetAllHolidaysResponse> response) {
    print('response *****${response.length}');
    holidayList.clear();
    holidayList.addAll(response);
    setState(() {});
  }
}
