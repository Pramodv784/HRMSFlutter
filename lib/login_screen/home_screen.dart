import 'package:flutter/material.dart';
import 'package:hrms/card/HomeCardView.dart';
import 'package:hrms/card/HomeCardView2.dart';
import 'package:hrms/home/drawer/BaseProvider.dart';
import 'package:hrms/login_screen/model/ScoreModel.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ScoreData> chartData = [
    ScoreData('Germany', 118, AppColors.red),
    ScoreData('Russia', 123, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('Norway', 107, AppColors.red),
    ScoreData('USA', 87, AppColors.red)

  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(builder: (_, baseprovider, __) {
      return Container(
       child: Column(
         children: [
           header(baseprovider),
           Expanded(
               child:Container(

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
                      HomeCard(),
                      HomeCard2(),
                      Container(
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          borderWidth: 2,

                          palette: <Color>[
                            AppColors.red

                          ],
                          series: <CartesianSeries>[
                            ColumnSeries<ScoreData, String>(
                                dataSource: chartData,
                                xValueMapper: (ScoreData data, _) => data.x,
                                yValueMapper: (ScoreData data, _) => data.y,
                                // Map color for each data points from the data source
                                pointColorMapper: (ScoreData data, _) => data.color
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
               ) )

         ],
       ),
      );
    });
  }
  Card header(BaseProvider baseProvider) {
    return
      Card(
        color: AppColors.black,
       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))),
        child:
        Row(
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
                    child: Image.asset(Images.DrawerIcon, width: 32, height: 32, color: AppColors.white),
                  ),
                  onTap: () {
                    if (baseProvider.isOpen)
                      baseProvider.close();
                    else
                      baseProvider.open();
                  },
                ),
                SizedBox(width: 10,),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                      child: Image.asset(Images.LogoIcon, height: 40.0,width: 100.0,)),
                ),
                /* RevButton(
                width: 40.0,
                color: AppColors.white,
                text: "",
                borderColor: AppColors.white,
              ),*/


              ],
            ),
            Image.asset(Images.UserIcon, height: 52.0),
          ],

        ),
      );
  }
}