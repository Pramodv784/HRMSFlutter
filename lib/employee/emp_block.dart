import 'package:hrms/employee/emp_repo.dart';
import 'package:hrms/employee/model/employee_list_response.dart';
import 'package:hrms/employee/model/get_company_type.dart';
import 'package:hrms/employee/model/get_emp_type_response.dart';
import 'package:hrms/employee/model/get_roll_type_response.dart';
import 'package:rxdart/rxdart.dart';

class EmpBlock {
  EmpRepo empRepo = EmpRepo();

  final _userListFetcher = PublishSubject<EmployeeListResponse>();
  final _empTypeFetcher = PublishSubject<GetEmpTypeResponse>();
  final _rollTypeFetcher = PublishSubject<GetRollTypeResponse>();
  final _companyType = PublishSubject<GetCompanyType>();

  Observable<EmployeeListResponse> get emplist => _userListFetcher.stream;
  Observable<GetEmpTypeResponse> get emptype => _empTypeFetcher.stream;
  Observable<GetRollTypeResponse> get rolltype => _rollTypeFetcher.stream;
  Observable<GetCompanyType> get companytype => _companyType.stream;

  fetchUserList() async {
    EmployeeListResponse employeeListResponse = await empRepo.getUserList();
    _userListFetcher.sink.add(employeeListResponse);
  }
  fetchEmptype() async {
    GetEmpTypeResponse getEmpTypeResponse = await empRepo.getEmpType();
    _empTypeFetcher.sink.add(getEmpTypeResponse);
  }
   fetchRoll() async {
     GetRollTypeResponse getRollTypeResponse = await empRepo.getRollTye();
    _rollTypeFetcher.sink.add(getRollTypeResponse);
  }
  fetchCompanyType() async {
    GetCompanyType getCompanyType = await empRepo.getCompany();
    _companyType.sink.add(getCompanyType);
  }







  dispose() {
    _userListFetcher.close();
    _rollTypeFetcher.close();
    _empTypeFetcher.close();
    _companyType.close();
  }
}
