

import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback/model/add_feedback_response.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';

import 'empfeedback/model/feed_question_model.dart';



abstract class FeedQuestionView extends BaseView  {

  void onFeedQuestionFecthed(FeedQuestionModel response);
  void onAddFeedResponseFecthed(AddFeedbackResponse response);
  void onError(String error);



}