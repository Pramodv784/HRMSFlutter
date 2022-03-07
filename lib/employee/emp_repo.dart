import 'package:flutter/material.dart';
import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/employee/model/employee_list_response.dart';
import 'package:hrms/employee/model/get_company_type.dart';
import 'package:hrms/employee/model/get_emp_type_response.dart';
import 'package:hrms/employee/model/get_roll_type_response.dart';

class EmpRepo{
ApiRepository apiRepository=ApiRepository();

Future<EmployeeListResponse> getUserList(){
 print('response****${apiRepository.fetchEmployeList()}');
  return apiRepository.fetchEmployeList();
}
Future<GetRollTypeResponse> getRollTye(){
 return apiRepository.fetchDepartment();
}
Future<GetCompanyType> getCompany(){
 return apiRepository.fetchCompany();
}
Future<GetEmpTypeResponse> getEmpType(){
 return apiRepository.fetchEmpType();
}





}