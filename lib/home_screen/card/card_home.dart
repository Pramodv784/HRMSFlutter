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
   CardHome(this._data,{Key key}) : super(key: key);

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
              SvgPicture.network('${EndPoints.baseUrl}/${_data.menuIcon}',),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                    child: Text('${_data.tittle}',style: textStylePrimary12px500w,textAlign: TextAlign.center,)),
              )
            ],
          ),
         splashColor: AppColors.red,
          onTap: (){
            Future.delayed(const Duration(milliseconds: 300), () {
              switch(_data.menuId)
              {
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



              }

            });


          },
     ),
      ),
    );
  }
}
