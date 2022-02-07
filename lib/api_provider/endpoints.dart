class EndPoints{


  //ngroke
  static const String baseUrl = "http://e1d8-103-15-67-125.ngrok.io";
  static const String Login = baseUrl+"/api/userlogin/UserLogin";
  static const String GetTotalAvgScore = baseUrl+"/api/project/MyTotalCategoryScore";
  static const String GetFeedType = baseUrl+"/api/project/GetCategoryType";
  static const String GetTeamdata = baseUrl+"/api/project/GetSelectEmployeeTeamRole";
  static const String GetEmpData = baseUrl+"/api/project/GetAllEmployeeByTeamTypeId";
  static const String ImageUpload = baseUrl+"/api/fileupload/Upload";
  static const String GetQuestion = baseUrl+"/api/project/GetCategories";
  static const String GetHomeData = baseUrl+"/api/menu/GetAllMenu";
  static const String SubmitFeedback = baseUrl+"/api/project/AddFeedbacks";
  static const String GetProfile = baseUrl+"/api/employees/GetEmployeeById";
  static const String GetLeave = baseUrl+"/api/LeaveType/GetAllLeaveType";
  static const String AddLeave = baseUrl+"/api/leaverequest/CreateLeaveRequest";
  static const String GetEmpKeyword = baseUrl+"/api/employees/GetAllEmployeeBySearchKeyword";
  static const String GetLeaveBalance = baseUrl+"/api/leaverequest/GetLeaveSummaryByEmployeeId";
  static const String GetExpenseCate = baseUrl+"/api/expense/GetAllExpenseCategory";
  static const String AddExpense = baseUrl+"/api/expense/CreateExpense";
  static const String FeedHistory = baseUrl+"/api/project/GetAllFeedbackHistoryByEmployeeId";
  static const String AvgMoth = baseUrl+"/api/project/GraphAverageScore";
}