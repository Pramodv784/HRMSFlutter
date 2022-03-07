
import 'package:hrms/attendence/model/attendence_log_response.dart';
import 'package:hrms/base/base_view.dart';
abstract class AttendenceView extends BaseView   {
  void onAttendenceFetch(AttendenceLogResponse response);
}