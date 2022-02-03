
import 'package:hrms/expense/model/add_expense_request.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';

import 'model/expense_category_response.dart';
abstract class ExpenseView   {
  void onExpenseCateFecthed(ExpenseCategoryResponse response);
  void onImageFecthed(UploadImageResponse response);
  void onAddExpenseFecthed(AddExpenseResponse response);
}