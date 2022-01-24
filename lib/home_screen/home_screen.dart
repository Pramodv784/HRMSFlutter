import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/card/HomeCardView.dart';
import 'package:hrms/card/HomeCardView2.dart';
import 'package:hrms/drawer/BaseProvider.dart';
import 'package:hrms/home_screen/home_bloc.dart';
import 'package:hrms/home_screen/home_event.dart';
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
import 'package:syncfusion_flutter_charts/charts.dart';

import 'card/card_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
   TooltipBehavior _tooltipBehavior;
   HomeBloc homeBloc= HomeBloc();
   HomeAvgScoreResponse _response;
   HomePresenter _presenter;
   List<String> list=['10x','20x',
     '','','','','','','','','','','','','','','','','','10asd','','','','',
     '','',];
   List<MenuList> homlist=[];
  final List<ScoreData> chartData = [
    ScoreData('Jan', 1,AppColors.red),
    ScoreData('Feb', 2, AppColors.red),
    ScoreData('Mar', 8, AppColors.red),
    ScoreData('Apr', 8, AppColors.red),
    ScoreData('May', 0, AppColors.red),
    ScoreData('Jun', 3, AppColors.red),
    ScoreData('jul', 7, AppColors.red),
    ScoreData('Aug', 5, AppColors.red),
    ScoreData('Sep', 6, AppColors.red),
    ScoreData('Oct', 9, AppColors.red),
    ScoreData('Nov', 2, AppColors.red),
    ScoreData('Dec', 7, AppColors.red),
  ];

   void getuserId() async{
     var userData = await (AuthUser.getInstance()).getCurrentUser();
     int id=userData.userId;
     homeBloc.add(AvegeScoreEvent(input:id));
     print('login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
     


   }
  @override
  void initState() {
   _presenter=HomePresenter(this);
   _presenter.getHomeData(context);
    _tooltipBehavior=TooltipBehavior(
      enable: true  ,
        borderWidth: 0.1,
        elevation: 4.0,

        color: AppColors.g1,
        borderColor: AppColors.g1,
        builder: (dynamic data, dynamic point, dynamic series,
            int pointIndex, int seriesIndex) {
          return padding(context,pointIndex);
        }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>homeBloc,
      
      child: BlocListener<HomeBloc,HomeState>(
        listener: (context,state){
          if(state is HomeSucessState){
            log(" Home Response *******  ${state?.response?.message??''}");
            log(" Home Response Avg *******  ${state?.response?.myAvgScore??0}");
          }
        },
        child: Consumer<BaseProvider>(builder: (_, baseprovider, __) {
          return Container(
            child: Column(
              children: [
                header(baseprovider),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: Utility.screenHeight(context),
                    child: ListView(
                      children: [
                        Card(
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Your Achievements',style: textStyleWhite12px400w,),
                                    GestureDetector(child: Text('view all',style: textStyleWhite12px400w,)
                                    ,onTap: (){
                                        opendDialog();
                                      },),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(Images.AchievIcon,),
                                        Text('10X',style: textStyleWhite12px400w,),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(Images.AchievIcon,),
                                        Text('10X',style: textStyleWhite12px400w,),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(Images.AchievIcon,),
                                        Text('10X',style: textStyleWhite12px400w,),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ),
                        HomeCard2(_response),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Year’s avg score',style: textStyleWhite12px400w,),
                                ),
                                Container(
                                  child: SfCartesianChart(
                                    enableAxisAnimation: true,
                                      tooltipBehavior: _tooltipBehavior,
                                      primaryYAxis: NumericAxis(minimum: 0,maximum: 10,
                                          interval: 1),
                                      primaryXAxis: CategoryAxis(
                                        interval: 1,

                                      ),
                                    palette: <Color>[AppColors.red],
                                    series: <CartesianSeries>[
                                      ColumnSeries<ScoreData, String>(
                                          dataSource: chartData,
                                          borderRadius: BorderRadius.only(
                                              // The top left and bottom right corners radii are changed to make them
                                              // as rounded corners.
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomLeft,
                                              colors: [AppColors.g1, AppColors.g2]),
                                          xValueMapper: (ScoreData data, _) => data.x,
                                          yValueMapper: (ScoreData data, _) => data.y,
                                          // Map color for each data points from the data source
                                          pointColorMapper: (ScoreData data, _) =>
                                              data.color)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                         Container(
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
                                    homlist.length, (index) {
                                  return CardHome(homlist[index]);
                                }
                                )
                            ),
                          ),
                        ),
                        bottomButton(),

                      ],
                    ),
                  ),
                )
                ),

              ],
            ),
          );
        }),
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
               text: 'Feedback History',
               textStyle: textStyleDark16px600w,
               color: AppColors.white,
               borderColor: AppColors.colorPrimary,
               radius: 50.0,
               onTap: () async {
                 Navigator.pushNamed(context, Screens.FeedbcakHistory);
               },
             ),
           ),
           horizontalSpace(10.0),
           Expanded(
             child: RevButton(
               width: 55.0,
               text: 'Add Feedback ',
               radius: 50.0,
               borderColor: AppColors.colorPrimary,
               textStyle: textStyleWhite14px600w,

               onTap: () {
                 Navigator.pushNamed(context, Screens.AddFeedBack );
               },
             ),
           ),
         ],
       ),
     );
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
                  InkWell(child: Container(
                    width: 20,
                      height: 52,
                      margin: EdgeInsets.only(bottom: 5.0),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(Images.NotificationIcon,))
                    ,onTap: (){
                      Navigator.pushNamed(context, Screens.Profile );
                    },),
                  SizedBox(
                    width: 5.0,
                  ),
                  InkWell(child: SvgPicture.asset(Images.UserIcon, height: 52.0,width: 20,)
                    ,onTap: (){
                      Navigator.pushNamed(context, Screens.Profile );
                    },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   opendDialog() {
     Scaffold body = Scaffold(
       backgroundColor: AppColors.background.withOpacity(0.1),
       body: Center(
         child: SingleChildScrollView(
           physics: ScrollPhysics(),
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
             height: Utility.screenHeight(context) * .63,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12.0),
               color: AppColors.white,
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Your Achievements',style: textStyleWhite12px400w,),
                         InkWell(child: Image.asset(Images.CloseIcon),
                         onTap: (){
                           Navigator.pop(context);
                         },)
                       ],
                     ),
                   ),

                   Flexible(
                     child:GridView.count(
                         physics: NeverScrollableScrollPhysics(),
                         crossAxisCount: 3,
                         childAspectRatio: 1.0,
                         padding: const EdgeInsets.all(4.0),
                         mainAxisSpacing: 2.0,
                         crossAxisSpacing: 2.0,
                         children: <String>[
                           '10x',
                           '20x',
                           '20x',
                           '20x',
                           '20x',
                           '20x',
                         ].map((String value) {
                           return GridTile(
                               child: Column(
                                 children: [
                                   Image.asset(Images.AchievIcon,width: 70,height: 70,),
                                   Text(value)
                                 ],
                               ));
                         }).toList()),
                   ),
                 ],
               ),
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
   Widget padding(BuildContext context,int index){
     return Padding(
       padding: const EdgeInsets.all(4.0),
       child: Container(
         width: 60.0,
         decoration: BoxDecoration(gradient:
         LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomLeft,
             colors: [AppColors.g1, AppColors.g2]
         ),
           boxShadow: [
             BoxShadow(
               color: Colors.grey[500],
               offset: Offset(0.0, 1.5),
               blurRadius: 1.5,
             ),
           ]
           ,),
         child: Padding(
           padding: const EdgeInsets.all(3.0),
           child: Row(
             children: [
               Image.asset(Images.TooltipIcon,),
               SizedBox(width: 3,),
               Text('${chartData[index].y}',style: TextStyle(color: AppColors.white,fontSize: 15.0),)
             ],
           ),
         ),
       ),
     );
   }

  @override
  void onHomeFecthed(HomeData response) {
     homlist.clear();
     homlist.addAll(response.menuList);
     setState(() {

     });
  }
}
