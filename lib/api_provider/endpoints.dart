class EndPoints {
  //ngroke
  static const String baseUrl = "http://609e-103-15-67-125.ngrok.io";
 // static const String baseUrl = "http://981f-103-15-67-125.ngrok.io";
  static const String Login = baseUrl + "/api/userlogin/login";
  static const String GetTotalAvgScore =
      baseUrl + "/api/project/MyTotalCategoryScore";
  static const String GetFeedType = baseUrl + "/api/project/GetCategoryType";
  static const String GetTeamdata =
      baseUrl + "/api/project/GetSelectEmployeeTeamRole";
  static const String GetEmpData =
      baseUrl + "/api/project/GetAllEmployeeByTeamTypeId";
  static const String ImageUpload = baseUrl + "/api/fileupload/Upload";
  static const String GetQuestion = baseUrl + "/api/project/GetCategories";
  static const String GetHomeData = baseUrl + "/api/menu/GetAllMenu";
  static const String SubmitFeedback = baseUrl + "/api/project/AddFeedbacks";
  static const String GetProfile = baseUrl + "/api/employees/GetEmployeeById";
  static const String GetLeave = baseUrl + "/api/LeaveType/GetAllLeaveType";
  static const String AddLeave =
      baseUrl + "/api/leaverequest/CreateLeaveRequest";
  static const String GetEmpKeyword =
      baseUrl + "/api/employees/GetAllEmployeeBySearchKeyword";
  static const String GetLeaveBalance =
      baseUrl + "/api/leaverequest/GetLeaveSummaryByEmployeeId";
  static const String GetExpenseCate =
      baseUrl + "/api/expense/GetAllExpenseCategory";
  static const String AddExpense = baseUrl + "/api/expense/CreateExpense";
  static const String FeedHistory =
      baseUrl + "/api/project/GetAllFeedbackHistoryByEmployeeId";
  static const String AvgMoth = baseUrl + "/api/project/GraphAverageScore";
  static const String WorkFromHomeRequest =
      baseUrl + "/api/WorkFromHome/CreateWFHRequest";
  static const String GetWorkFromHomeList =
      baseUrl + "/api/WorkFromHome/GetAllWFHRequestsByEmployeeId";
  static const String TicketCategory = baseUrl + "/api/ticketmaster/ticketcategorylist";
  static const String TicketPriority = baseUrl + "/api/ticketmaster/gettprioritybytCategory";

  static const String AddTicket = baseUrl + "/api/ticketmaster/adduserticket";
  static const String MyTicketList = baseUrl + "/api/Case/GetAllTicket";
  static const String ExpenseHistory =
      baseUrl + "/api/expense/GetAllExpenseRequestsByStatus";
  static const String CheckIn = baseUrl + "/api/Attendance/AddAttendance";
  static const String CheckOut = baseUrl + "/api/attendancenew/clockinclockout";
  static const String GetAsset = baseUrl + "/api/assets/GetMyAssets";
  static const String GetAllEmp = baseUrl + "/api/employees/GetAllEmployees";
  static const String GetAttendence =
      baseUrl + "/api/attendancenew/getclocklogtime";
   static const String GetUserByDepartment =
      baseUrl + "/api/Case/GetEmployeeByRoleId";
  static const String GetMyCase =
      baseUrl + "/api/case/GetMyCases";


  static const String GetProjectList = baseUrl + "/api/project/GetAllProject";
  static const String LeaveToday = baseUrl + "/api/leave/EmployeesTodayOnLeave";
  static const String GetWFHAllRequestList =
      baseUrl + "/api/WorkFromHome/GetAllWFHRequests";
  static const String GetLeaveHistory =
      baseUrl + "/api/leaverequest/GetAllLeaveRequestsByEmployeeId";
 static const String GetMyTodayAttendence =
      baseUrl + "/api/Attendance/GetMyTodaysAttendance";
 static const String GetAttendencelog =
      baseUrl + "/api/attendancenew/getuserattendancelist";
 static const String GetAllEmpData =
      baseUrl + "/api/employees/GetAllEmployeeByJoiningDate";
static const String GetDepartment =
      baseUrl + "/api/Employees/GetAllRole";
static const String GetEmpType =
      baseUrl + "/api/Employees/GetEmployeeTypes";
static const String GetCompany =
      baseUrl + "/api/employees/GetCompany";
static const String UserFilter =
      baseUrl + "/api/employees/CreateAdvaceFilter";
static const String GetAllHolidays =
      baseUrl + "/api/Holiday/GetAllHolidays";
static const String GetSkill =
      baseUrl + "/api/skills/getallskill";
static const String GetMyTeam =
      baseUrl + "/api/leave/EmployeesTodayOnLeaveTeam";
static const String UpdateTicket =
      baseUrl + "/api/Case/UpdateCase";
static const String UpdateTicketStatus =
      baseUrl + "/api/Case/UpdateCaseStatus";
static const String TicketDetail =
      baseUrl + "/api/ticketmaster/ticketdetails";

}
