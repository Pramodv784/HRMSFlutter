
import 'package:hrms/base/base_view.dart';
import 'package:hrms/home_screen/model/home_data.dart';

import 'model/leave_balance_model.dart';
abstract class LeaveBalanceView extends BaseView   {
  void onLeaveBalanceFetched(LeaveBalanceModel response);



}