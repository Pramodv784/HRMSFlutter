import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/home_data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Utility.dart';

class CardHome extends StatelessWidget {
  MenuList _data;

  CardHome(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String imageurl=_data.menuIcon.replaceAll('http://localhost:59822/', '');
    return Container(
      width: Utility.screenWidth(context),
      color: AppColors.white,
      alignment: Alignment.center,
      child: Material(
        color: AppColors.white,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _data.menuIcon!=null?SvgPicture.network(
                '${EndPoints.baseUrl}/${_data.menuIcon}',
              ):
              SvgPicture.asset(
                Images.PlaceHolder,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${_data.tittle}',
                      style: textStylePrimary12px500w,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              )
            ],
          ),
          splashColor: AppColors.grey,
          onTap: () {
            Future.delayed(const Duration(milliseconds: 300), () {
              switch (_data.menuId) {
                case 1:
                  Navigator.pushNamed(context, Screens.LeaveRequestDashboard);
                  break;
                case 18:
                  Navigator.pushNamed(context, Screens.HomeScreen2);
                  break;
                case 20:
                  Navigator.pushNamed(context, Screens.MyAsset);
                  break;
                case 21:
                  Navigator.pushNamed(context, Screens.HolidayPage);
                  break;
                case 12:
                  Navigator.pushNamed(context, Screens.EmpPage);
                  break;
                case 22:
                  Navigator.pushNamed(context, Screens.MyTeam);
                  break;
                case 2:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Covid-19 care');
                  break;
                case 3:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Payroll');
                  break;
                case 4:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Health and Wellness');
                  break;
                case 5:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Strategy');
                  break;

                case 6:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Query');
                  break;
                case 7:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Policies');
                  break;
                case 8:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Reimbursement');
                  break;
                case 9:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'ID/Visiting card');
                  break;
                case 10:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Mandatory Declarations');
                  break;
                case 11:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Open learning academy');
                  break;
                case 13:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Travel');
                  break;
                case 14:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Webcast');
                  break;
                case 15:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Champion Award');
                  break;
                case 16:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'Catalyst');
                  break;
                case 17:
                  Navigator.pushNamed(context, Screens.CommonPage,
                      arguments: 'eFacility');
                  break;
              }
            });
          },
        ),
      ),
    );
  }
}
