import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/drawer/BaseProvider.dart';
import 'package:hrms/home_screen/card/card_wfh_list.dart';
import 'package:hrms/home_screen/home_presenter.dart';
import 'package:hrms/home_screen/home_view.dart';
import 'package:hrms/home_screen/model/check_in_out_response.dart';
import 'package:hrms/home_screen/model/get_clock_in_time_response.dart';

import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/today_leave_response.dart';
import 'package:hrms/home_screen/model/w_f_h_list_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

import '../utility/Dialogs.dart';
import 'card/card_home.dart';
import 'card/card_leave_today.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter _presenter;
  List<MenuList> homelist = [];

  List<Widget> todayleaveList = [];
  List<Widget> wfhUserList = [];

  String _timeString;
  String date = DateFormat('d').format(DateTime.now());
  String month = DateFormat('MMM').format(DateTime.now());
  String year = DateFormat('y').format(DateTime.now());
  int userId = 0;
  bool checkStatus = false;
  GetClockInTimeResponse getClockInTimeResponse;
  RandomColor _randomColor = RandomColor();

  @override
  void initState() {
    _presenter = HomePresenter(this);
    _presenter.getHomeData(context);
    getuserId();

    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    print('Time Now ****$_timeString');
    setState(() {});
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    userId = userData.userId;
    print('User Token ***** ${getToken()}');

    _presenter.getAttendence(context);
    _presenter.getLeaveToday(context);
    _presenter.getWFHList(context);

    String data = await (AuthUser.getInstance()).GetUserEmail();
    print('User Credential ***$data');

    print(
        'login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
  }

  Future<String> getToken() async {
    return await AuthUser.getInstance().token();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(builder: (_, baseprovider, __) {
      return Container(
        child: Column(
          children: [
            header(baseprovider),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
              ),
              child: Container(
                height: Utility.screenHeight(context),
                child: RefreshIndicator(
                    onRefresh: _pullRefresh,
                    color: AppColors.colorPrimary,
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          color: AppColors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Images.IconVirus),
                              const SizedBox(
                                width: 20.0,
                              ),
                              const Text(
                                'I am vaccinated against COVID-19',
                                style: textStyleRed14px700w,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Shift Today- 9:30 - 7:00 PM',
                                        style: textStyleBlackRegular12pxW700,
                                      ),
                                      SizedBox(height: 20.0),
                                      getClockInTimeResponse?.data?.totalTime !=
                                              null
                                          ? Container(
                                              // child: Text('Today Working Time \n${getClockInTimeResponse?.data?.totalTime}'),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Today Working Time',
                                                        style:
                                                            textStyleBlackRegular12pxW700),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                        '${getClockInTimeResponse?.data?.totalTime}',
                                                        style:
                                                            textStyleBlackRegular12pxW700)
                                                  ]),
                                            )
                                          : Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              child: FlatButton(
                                                child: Text(
                                                  checkStatus
                                                      ? 'Clock out '
                                                      : 'Clock In',
                                                  style:
                                                      textStyleWhiteRegular12pxW700,
                                                ),
                                                color: checkStatus
                                                    ? AppColors.red
                                                    : AppColors.colorPrimary,
                                                textColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                onPressed: () {
                                                  if (checkStatus) {
                                                    Dialogs.openDialogClockOut(
                                                        context, onAccept: () {
                                                      _presenter.CheckInOut(
                                                          context);
                                                      Navigator.pop(context);
                                                    });
                                                  } else {
                                                    _presenter.CheckInOut(
                                                        context);
                                                  }
                                                },
                                              ),
                                            ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: Utility.screenWidth(context),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              '$date $month,$year',
                                              style:
                                                  textStyleWhiteRegular12pxW700,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              '$_timeString',
                                              style:
                                                  textStyleWhiteRegular15pxW700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'On Leave Today',
                                    style: textStyleBlackRegular12pxW700,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      child: todayleaveList.length > 0
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ...todayleaveList,
                                              ],
                                            )
                                          : Text('No data'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),




                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Employee Working Remotly',
                                    style: textStyleBlackRegular12pxW700,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      child: wfhUserList.length > 0
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ...wfhUserList,
                                              ],
                                            )
                                          : Text('No Data'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 0.0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                // to disable GridView's scrolling
                                shrinkWrap: true,
                                // You won't see infinite size error
                                crossAxisCount: 3,
                                crossAxisSpacing: 1.0,
                                mainAxisSpacing: 1.0,
                                childAspectRatio: 1.0,
                                primary: false,
                                children:
                                    List.generate(homelist.length, (index) {
                                  return /* index==17?SimpleTooltip(
                                    tooltipTap: () {
                                      print("Feedback");

                                    },

                                    animationDuration: Duration(milliseconds: 20),
                                    show: true,

                                    hideOnTooltipTap: true,
                                    tooltipDirection: TooltipDirection.up,
                                    content: Text(
                                      "Give or know your feedback",
                                        style: textStylePrimary18pxW500
                                    ),
                                    borderColor: AppColors.red,
                                    child: CardHome(homlist[index])):
*/

                                     CardHome(homelist[index]);
                                })),
                          ),
                        ),
                      ],
                    )),
              ),
            )),
          ],
        ),
      );
    });
  }

  Container header(BaseProvider baseProvider) {
    return Container(
      color: AppColors.colorPrimary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RevButton(
                  width: 40.0,
                  height: 40.0,
                  radius: 8.0,
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  child: Center(
                    child: SvgPicture.asset(Images.DrawerIcon,
                        width: 32, height: 32, color: AppColors.white),
                  ),
                  onTap: () {
                    if (baseProvider.isOpen)
                      baseProvider.close();
                    else
                      baseProvider.open();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                      child: Image.asset(
                    Images.LogoIcon,
                    height: 40.0,
                    width: 100.0,
                  )),
                ),
                /* RevButton(
                  width: 40.0,
                  color: AppColors.white,
                  text: "",
                  borderColor: AppColors.white,
                ),*/
              ],
            ),
            Center(
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                        width: 20,
                        height: 40,
                        margin: EdgeInsets.only(bottom: 5.0),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Images.NotificationIcon,
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, Screens.CommonPage,
                          arguments: 'Notification');
                    },
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      Images.UserIcon,
                      height: 52.0,
                      width: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Screens.Profile);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onHomeFecthed(HomeData response) {
    homelist.clear();
    for(int i=0;i<response.menuList.length;i++)
      {
        if(response.menuList[i].menuId==1)
          {
            homelist.add(response.menuList[i]);
          }
        if(response.menuList[i].menuId==18)
        {
          homelist.add(response.menuList[i]);
        }
        if(response.menuList[i].menuId==20)
        {
          homelist.add(response.menuList[i]);
        }
        if(response.menuList[i].menuId==21)
        {
          homelist.add(response.menuList[i]);
        }
        if(response.menuList[i].menuId==22)
        {
          homelist.add(response.menuList[i]);
        }
        if(response.menuList[i].menuId==12)
        {
          homelist.add(response.menuList[i]);
        }

      }


    setState(() {});
  }

  Future<void> _pullRefresh() async {
    _presenter.getHomeData(context);
    _presenter.getAttendence(context);
    setState(() {});
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onLeaveTodayFetch(TodayLeaveResponse response) {
    print('leave Today list *** ${response.empList.length}');
    todayleaveList.clear();

    for (int i = 0; i < response.empList.length; i++) {
      todayleaveList.add(CardLeaveToday(response.empList[i],_randomColor.randomColor(colorHue: ColorHue.red)));
    }

    setState(() {});
  }

  @override
  void onWfhListFetched(WFHListResponse response) {
    print('leave WFH list *** ${response.workFromHomeList.length}');
    for (int i = 0; i < response.workFromHomeList.length; i++) {

      wfhUserList.add(CardWFHList(response.workFromHomeList[i],_randomColor.randomColor(colorHue: ColorHue.red)));
    }

    setState(() {});
  }

  @override
  void onCheckInOutFetched(CheckInOutResponse response) {
    _presenter.getAttendence(context);
    setState(() {});
  }

  @override
  void ongetClockInTimeFetch(GetClockInTimeResponse response) {
    getClockInTimeResponse = response;
    checkStatus = response.data.isClockIn;
    setState(() {});
  }
}
