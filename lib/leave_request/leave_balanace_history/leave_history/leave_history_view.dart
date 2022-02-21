

import 'package:hrms/base/base_view.dart';

import 'model/leave_request_history_response.dart';
abstract class LeaveHistoryView extends BaseView   {
  void onLeaveHistoryFetched(LeaveRequestHistoryResponse response);
}