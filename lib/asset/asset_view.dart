


import 'package:hrms/asset/model/asset_response.dart';
import 'package:hrms/base/base_view.dart';

abstract class AssetView extends BaseView  {
  void onAssetFecthed(AssetResponse response);

}