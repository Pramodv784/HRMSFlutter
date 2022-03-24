


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/ticket/model/AddTicketResponse.dart';
import 'package:hrms/ticket/model/GetMyCaseResponse.dart';
import 'package:hrms/ticket/model/TicketCategoryResponse.dart';
import 'package:hrms/ticket/model/TicketPriorityResponse.dart';


import '../profile/model/upload_image_response.dart';
import 'model/GetAllUser.dart';
abstract class TicketView extends BaseView  {
  void onTicketcateFecthed(TicketCategoryResponse response);
  void onTicketPriorityFecthed(TicketPriorityResponse response);
  void onTicketAddedFecthed(AddTicketResponse response);
  void onUserByDepartmentFecthed(GetAllUser response);
  void onGetMyCaseFecthed(GetMyCaseResponse response);
  void onImageFecthed(UploadImageResponse response);

}