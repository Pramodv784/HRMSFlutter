
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/leave_request/leave_balance/model/leave_balance_model.dart';

import '../../base/base_view.dart';
abstract class LeaveBalanceView extends BaseView   {
  void onLeaveBalanceFetched(LeaveBalanceModel response);



}