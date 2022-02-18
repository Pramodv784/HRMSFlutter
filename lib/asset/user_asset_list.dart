import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/asset_response.dart';

class UserAssetList extends StatelessWidget {
  MyAssetList _data;
  UserAssetList(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBackGroundColor),
        ),
        height: 50,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      width: Utility.screenWidth(context),
                      child: Text('${_data.assetName}',
                          maxLines: 3, overflow: TextOverflow.ellipsis))),
              SizedBox(
                width: 5.0,
              ),
              Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      width: Utility.screenWidth(context),
                      child: Text('2', overflow: TextOverflow.ellipsis))),
              SizedBox(
                width: 5.0,
              ),
              Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      width: Utility.screenWidth(context),
                      child:
                          Text('Received', overflow: TextOverflow.ellipsis))),
              SizedBox(
                width: 5.0,
              ),
              Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      width: Utility.screenWidth(context),
                      child:
                          Text('22/02/2022', overflow: TextOverflow.ellipsis))),
            ],
          ),
        ));
  }
}
