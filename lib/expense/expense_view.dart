
import 'package:hrms/expense/model/add_expense_request.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';

import '../base/base_view.dart';
import 'model/expense_category_response.dart';
import 'model/expense_history_response.dart';
abstract class ExpenseView extends BaseView  {
  void onExpenseCateFecthed(ExpenseCategoryResponse response);
  void onImageFecthed(UploadImageResponse response);
  void onAddExpenseFecthed(AddExpenseResponse response);
  void onExpenseHistoryFecthed(ExpenseHistoryResponse response);
}