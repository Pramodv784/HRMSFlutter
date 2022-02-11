import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/drawer/BaseProvider.dart';
import 'package:hrms/home_screen/home_presenter.dart';
import 'package:hrms/home_screen/home_state.dart';
import 'package:hrms/home_screen/home_view.dart';
import 'package:hrms/home_screen/model/home_avg_score_response.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/login_screen/model/ScoreModel.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:provider/provider.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utility/Dialogs.dart';
import 'card/card_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter _presenter;
  List<MenuList> homlist = [];
  DateTime pre_backpress = DateTime.now();

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();

    print(
        'login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
  }

  @override
  void initState() {
    _presenter = HomePresenter(this);
    _presenter.getHomeData(context);

    super.initState();
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
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
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
                              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Shift Today- 9:30 - 7:00 PM',
                                        style: textStyleBlackRegular12pxW700,
                                      ),
                                      SizedBox(height: 20.0),
                                      Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: FlatButton(
                                          child: Text(
                                            'Clock In ',
                                            style: textStyleWhiteRegular12pxW700,
                                          ),
                                          color: AppColors.colorPrimary,
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: Utility.screenWidth(context),
                                      padding: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text('Fri 11, feb 2022',style: textStyleWhiteRegular12pxW700,
                                            maxLines: 2,overflow: TextOverflow.ellipsis,),
                                            SizedBox(height: 10.0),
                                            Text('10:00:00 AM',style: textStyleWhiteRegular12pxW700,),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          margin: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
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
                                    List.generate(homlist.length, (index) {
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
                                      CardHome(homlist[index]);
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
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))),
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
                SizedBox(
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
                        height: 52,
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
                  SizedBox(
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
    homlist.clear();
    homlist.addAll(response.menuList);
    setState(() {});
  }

  Future<void> _pullRefresh() async {
    _presenter.getHomeData(context);
    setState(() {});
  }
}
