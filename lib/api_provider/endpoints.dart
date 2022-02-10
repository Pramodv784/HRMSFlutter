class EndPoints{



  //ngroke
  static const String baseUrl = "https://uatportalapi.moreyeahs.in";
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
  static const String WorkFromHomeRequest = baseUrl +"/api/WorkFromHome/CreateWFHRequest";
  static const String GetWorkFromHomeList = baseUrl +"/api/WorkFromHome/GetAllWFHRequestsByEmployeeId";
  static const String TicketType = baseUrl+"/api/Case/GetCaseTypes";
  static const String AddTicket = baseUrl+"/api/Case/CreateCase";
  static const String MyTicketList = baseUrl+"/api/Case/GetAllTicket";
  static const String ExpenseHistory = baseUrl+"/api/expense/GetAllExpenseRequestsByStatus";
}