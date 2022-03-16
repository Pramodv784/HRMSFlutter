import 'package:flutter/material.dart';
import 'package:hrms/asset/asset_presenter.dart';
import 'package:hrms/asset/asset_view.dart';
import 'package:hrms/asset/model/asset_response.dart';
import 'package:hrms/asset/user_asset_list.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

import '../user/AuthUser.dart';

class EmployeeAssetPage extends StatefulWidget {
  const EmployeeAssetPage({Key key}) : super(key: key);

  @override
  _EmployeeAssetState createState() => _EmployeeAssetState();
}

class _EmployeeAssetState extends State<EmployeeAssetPage> implements AssetView {
  List<Widget> assetWidgetList = [];
  AssetPresenter _presenter;

  @override
  void initState() {
    _presenter = AssetPresenter(this);
  getuserId();
    super.initState();
  }
  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();

    _presenter.getAssetList(context, userData.userId);

  }

  @override
  Widget build(BuildContext context) {
    return
     ListView(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    color: AppColors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [

                          Text(
                            'Asset Name',
                            style: textStylePrimary12px500w,
                          ),
                          Text(
                            'QTY      ',
                            style: textStylePrimary12px500w,
                          ),
                          Text(
                            'Status    ',
                            style: textStylePrimary12px500w,
                          ),
                          Text(
                            'Date  ',
                            style: textStylePrimary12px500w,
                          ),

                        ],
                      ),
                    ),
                  ),
                  //CardGoal(),

                  ...assetWidgetList
                ],
              ),
            ),
          ),
        ],

    );
  }

  @override
  void onAssetFecthed(AssetResponse response) {
    for (MyAssetList item in response.myAssetList) {
      assetWidgetList.add(UserAssetList(item));
    }
    setState(() {});
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }
}
