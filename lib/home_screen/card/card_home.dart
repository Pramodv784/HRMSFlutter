import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/home_data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Utility.dart';
class CardHome extends StatelessWidget {
  MenuList _data;
   CardHome(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageurl=_data.menuIcon.replaceAll('http://localhost:59822/', '');
    return Container(
      width: Utility.screenWidth(context),
      color: AppColors.white,
      alignment: Alignment.center,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network('http://3485-103-15-67-125.ngrok.io/${imageurl}',),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                  child: Text('${_data.tittle}',style: textStylePrimary12px500w,textAlign: TextAlign.center,)),
            )
          ],
        ),
        onTap: (){
          //if(_data.tittle=='Feedback'){
          print('clicked');
            new Tooltip(message: 'Give feedback ',child: Text('hello'),);
          //}

        },
     ),
    );
  }
}
