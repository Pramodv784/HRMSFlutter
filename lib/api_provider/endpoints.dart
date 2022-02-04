class EndPoints{


  //ngroke
  static const String baseUrl = "http://ecbc-2409-4043-2da4-a1c4-2441-ecd-3981-108e.ngrok.io";
  static const String Login = baseUrl+"/api/userlogin/UserLogin";
  static const String GetAvgScore = baseUrl+"/api/project/MyTotalAvgScore";
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
}