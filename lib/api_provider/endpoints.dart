class EndPoints{
  static const String baseUrl = "http://08b4-103-15-67-125.ngrok.io";
  static const String Login = baseUrl+"/api/userlogin/UserLogin";
  static const String GetAvgScore = baseUrl+"/api/project/MyTotalAvgScore";
  static const String GetFeedType = baseUrl+"/api/project/GetCategoryType";
  static const String GetTeamdata = baseUrl+"/api/project/GetSelectEmployeeTeamRole";
  static const String GetEmpData = baseUrl+"/api/project/GetAllEmployeeByTeamTypeId";
  static const String ImageUpload = baseUrl+"/api/image/UploadImage";
  static const String GetQuestion = baseUrl+"/api/project/GetCategories";
  static const String GetHomeData = baseUrl+"/api/menu/GetAllMenu";
  static const String SubmitFeedback = baseUrl+"/api/project/AddFeedbacks";
  static const String GetProfile = baseUrl+"/api/employees/GetEmployeeById";
}