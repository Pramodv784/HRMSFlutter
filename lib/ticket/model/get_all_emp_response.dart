/// employeeId : 3
/// fullName : "Govind  Chouksey"
/// firstName : "Govind"
/// lastName : " Chouksey"
/// password : null
/// companyId : 0
/// uploadResume : null
/// primaryContact : "9806200403"
/// roleType : "Software Developer"
/// email : "govind.chouksey@gamil.com"
/// employeeTypeID : 0
/// employeeCode : null
/// secondaryContact : null
/// maritalStatus : null
/// spouseName : null
/// fatherName : null
/// motherName : null
/// createdOn : null
/// updatedOn : null
/// isActive : false
/// isDeleted : false
/// bloodGroupId : 0
/// bloodGroup : null
/// document : null
/// roleId : 0
/// permanentAddress : null
/// localAddress : null
/// joiningDate : null
/// confirmationDate : null
/// dob : null
/// emergencyNumber : null
/// whatsappNumber : null
/// aadharNumber : null
/// panNumber : null
/// medicalIssue : null
/// profile : null
/// salary : null
/// bankAccountNumber : null
/// ifsc : null
/// accountHolderName : null
/// bankName : null
/// moreyeahsMailId : null
/// employeeType : null
/// companyName : null
/// departmentName : null
/// departmentId : 0
/// gender : null
/// aboutMeRemark : null
/// aboutMyJobRemark : null
/// interestAndHobbiesRemark : null

class GetAllEmpResponse {
  GetAllEmpResponse({
      int employeeId, 
      String fullName, 
      String firstName, 
      String lastName, 
      dynamic password, 
      int companyId, 
      dynamic uploadResume, 
      String primaryContact, 
      String roleType, 
      String email, 
      int employeeTypeID, 
      dynamic employeeCode, 
      dynamic secondaryContact, 
      dynamic maritalStatus, 
      dynamic spouseName, 
      dynamic fatherName, 
      dynamic motherName, 
      dynamic createdOn, 
      dynamic updatedOn, 
      bool isActive, 
      bool isDeleted, 
      int bloodGroupId, 
      dynamic bloodGroup, 
      dynamic document, 
      int roleId, 
      dynamic permanentAddress, 
      dynamic localAddress, 
      dynamic joiningDate, 
      dynamic confirmationDate, 
      dynamic dob, 
      dynamic emergencyNumber, 
      dynamic whatsappNumber, 
      dynamic aadharNumber, 
      dynamic panNumber, 
      dynamic medicalIssue, 
      dynamic profile, 
      dynamic salary, 
      dynamic bankAccountNumber, 
      dynamic ifsc, 
      dynamic accountHolderName, 
      dynamic bankName, 
      dynamic moreyeahsMailId, 
      dynamic employeeType, 
      dynamic companyName, 
      dynamic departmentName, 
      int departmentId, 
      dynamic gender, 
      dynamic aboutMeRemark, 
      dynamic aboutMyJobRemark, 
      dynamic interestAndHobbiesRemark,}){
    _employeeId = employeeId;
    _fullName = fullName;
    _firstName = firstName;
    _lastName = lastName;
    _password = password;
    _companyId = companyId;
    _uploadResume = uploadResume;
    _primaryContact = primaryContact;
    _roleType = roleType;
    _email = email;
    _employeeTypeID = employeeTypeID;
    _employeeCode = employeeCode;
    _secondaryContact = secondaryContact;
    _maritalStatus = maritalStatus;
    _spouseName = spouseName;
    _fatherName = fatherName;
    _motherName = motherName;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _bloodGroupId = bloodGroupId;
    _bloodGroup = bloodGroup;
    _document = document;
    _roleId = roleId;
    _permanentAddress = permanentAddress;
    _localAddress = localAddress;
    _joiningDate = joiningDate;
    _confirmationDate = confirmationDate;
    _dob = dob;
    _emergencyNumber = emergencyNumber;
    _whatsappNumber = whatsappNumber;
    _aadharNumber = aadharNumber;
    _panNumber = panNumber;
    _medicalIssue = medicalIssue;
    _profile = profile;
    _salary = salary;
    _bankAccountNumber = bankAccountNumber;
    _ifsc = ifsc;
    _accountHolderName = accountHolderName;
    _bankName = bankName;
    _moreyeahsMailId = moreyeahsMailId;
    _employeeType = employeeType;
    _companyName = companyName;
    _departmentName = departmentName;
    _departmentId = departmentId;
    _gender = gender;
    _aboutMeRemark = aboutMeRemark;
    _aboutMyJobRemark = aboutMyJobRemark;
    _interestAndHobbiesRemark = interestAndHobbiesRemark;
}

  GetAllEmpResponse.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _fullName = json['fullName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _password = json['password'];
    _companyId = json['companyId'];
    _uploadResume = json['uploadResume'];
    _primaryContact = json['primaryContact'];
    _roleType = json['roleType'];
    _email = json['email'];
    _employeeTypeID = json['employeeTypeID'];
    _employeeCode = json['employeeCode'];
    _secondaryContact = json['secondaryContact'];
    _maritalStatus = json['maritalStatus'];
    _spouseName = json['spouseName'];
    _fatherName = json['fatherName'];
    _motherName = json['motherName'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _bloodGroupId = json['bloodGroupId'];
    _bloodGroup = json['bloodGroup'];
    _document = json['document'];
    _roleId = json['roleId'];
    _permanentAddress = json['permanentAddress'];
    _localAddress = json['localAddress'];
    _joiningDate = json['joiningDate'];
    _confirmationDate = json['confirmationDate'];
    _dob = json['dob'];
    _emergencyNumber = json['emergencyNumber'];
    _whatsappNumber = json['whatsappNumber'];
    _aadharNumber = json['aadharNumber'];
    _panNumber = json['panNumber'];
    _medicalIssue = json['medicalIssue'];
    _profile = json['profile'];
    _salary = json['salary'];
    _bankAccountNumber = json['bankAccountNumber'];
    _ifsc = json['ifsc'];
    _accountHolderName = json['accountHolderName'];
    _bankName = json['bankName'];
    _moreyeahsMailId = json['moreyeahsMailId'];
    _employeeType = json['employeeType'];
    _companyName = json['companyName'];
    _departmentName = json['departmentName'];
    _departmentId = json['departmentId'];
    _gender = json['gender'];
    _aboutMeRemark = json['aboutMeRemark'];
    _aboutMyJobRemark = json['aboutMyJobRemark'];
    _interestAndHobbiesRemark = json['interestAndHobbiesRemark'];
  }
  int _employeeId;
  String _fullName;
  String _firstName;
  String _lastName;
  dynamic _password;
  int _companyId;
  dynamic _uploadResume;
  String _primaryContact;
  String _roleType;
  String _email;
  int _employeeTypeID;
  dynamic _employeeCode;
  dynamic _secondaryContact;
  dynamic _maritalStatus;
  dynamic _spouseName;
  dynamic _fatherName;
  dynamic _motherName;
  dynamic _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isDeleted;
  int _bloodGroupId;
  dynamic _bloodGroup;
  dynamic _document;
  int _roleId;
  dynamic _permanentAddress;
  dynamic _localAddress;
  dynamic _joiningDate;
  dynamic _confirmationDate;
  dynamic _dob;
  dynamic _emergencyNumber;
  dynamic _whatsappNumber;
  dynamic _aadharNumber;
  dynamic _panNumber;
  dynamic _medicalIssue;
  dynamic _profile;
  dynamic _salary;
  dynamic _bankAccountNumber;
  dynamic _ifsc;
  dynamic _accountHolderName;
  dynamic _bankName;
  dynamic _moreyeahsMailId;
  dynamic _employeeType;
  dynamic _companyName;
  dynamic _departmentName;
  int _departmentId;
  dynamic _gender;
  dynamic _aboutMeRemark;
  dynamic _aboutMyJobRemark;
  dynamic _interestAndHobbiesRemark;

  int get employeeId => _employeeId;
  String get fullName => _fullName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  dynamic get password => _password;
  int get companyId => _companyId;
  dynamic get uploadResume => _uploadResume;
  String get primaryContact => _primaryContact;
  String get roleType => _roleType;
  String get email => _email;
  int get employeeTypeID => _employeeTypeID;
  dynamic get employeeCode => _employeeCode;
  dynamic get secondaryContact => _secondaryContact;
  dynamic get maritalStatus => _maritalStatus;
  dynamic get spouseName => _spouseName;
  dynamic get fatherName => _fatherName;
  dynamic get motherName => _motherName;
  dynamic get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  int get bloodGroupId => _bloodGroupId;
  dynamic get bloodGroup => _bloodGroup;
  dynamic get document => _document;
  int get roleId => _roleId;
  dynamic get permanentAddress => _permanentAddress;
  dynamic get localAddress => _localAddress;
  dynamic get joiningDate => _joiningDate;
  dynamic get confirmationDate => _confirmationDate;
  dynamic get dob => _dob;
  dynamic get emergencyNumber => _emergencyNumber;
  dynamic get whatsappNumber => _whatsappNumber;
  dynamic get aadharNumber => _aadharNumber;
  dynamic get panNumber => _panNumber;
  dynamic get medicalIssue => _medicalIssue;
  dynamic get profile => _profile;
  dynamic get salary => _salary;
  dynamic get bankAccountNumber => _bankAccountNumber;
  dynamic get ifsc => _ifsc;
  dynamic get accountHolderName => _accountHolderName;
  dynamic get bankName => _bankName;
  dynamic get moreyeahsMailId => _moreyeahsMailId;
  dynamic get employeeType => _employeeType;
  dynamic get companyName => _companyName;
  dynamic get departmentName => _departmentName;
  int get departmentId => _departmentId;
  dynamic get gender => _gender;
  dynamic get aboutMeRemark => _aboutMeRemark;
  dynamic get aboutMyJobRemark => _aboutMyJobRemark;
  dynamic get interestAndHobbiesRemark => _interestAndHobbiesRemark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['fullName'] = _fullName;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['password'] = _password;
    map['companyId'] = _companyId;
    map['uploadResume'] = _uploadResume;
    map['primaryContact'] = _primaryContact;
    map['roleType'] = _roleType;
    map['email'] = _email;
    map['employeeTypeID'] = _employeeTypeID;
    map['employeeCode'] = _employeeCode;
    map['secondaryContact'] = _secondaryContact;
    map['maritalStatus'] = _maritalStatus;
    map['spouseName'] = _spouseName;
    map['fatherName'] = _fatherName;
    map['motherName'] = _motherName;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['bloodGroupId'] = _bloodGroupId;
    map['bloodGroup'] = _bloodGroup;
    map['document'] = _document;
    map['roleId'] = _roleId;
    map['permanentAddress'] = _permanentAddress;
    map['localAddress'] = _localAddress;
    map['joiningDate'] = _joiningDate;
    map['confirmationDate'] = _confirmationDate;
    map['dob'] = _dob;
    map['emergencyNumber'] = _emergencyNumber;
    map['whatsappNumber'] = _whatsappNumber;
    map['aadharNumber'] = _aadharNumber;
    map['panNumber'] = _panNumber;
    map['medicalIssue'] = _medicalIssue;
    map['profile'] = _profile;
    map['salary'] = _salary;
    map['bankAccountNumber'] = _bankAccountNumber;
    map['ifsc'] = _ifsc;
    map['accountHolderName'] = _accountHolderName;
    map['bankName'] = _bankName;
    map['moreyeahsMailId'] = _moreyeahsMailId;
    map['employeeType'] = _employeeType;
    map['companyName'] = _companyName;
    map['departmentName'] = _departmentName;
    map['departmentId'] = _departmentId;
    map['gender'] = _gender;
    map['aboutMeRemark'] = _aboutMeRemark;
    map['aboutMyJobRemark'] = _aboutMyJobRemark;
    map['interestAndHobbiesRemark'] = _interestAndHobbiesRemark;
    return map;
  }

}