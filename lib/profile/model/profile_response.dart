/// employeeId : 156
/// v : "LovelySharma"
/// email : "lsharma@moreyeahs.com"
/// firstName : "Lovely"
/// lastName : "Sharma"
/// primaryContact : "8517014372"
/// maritalStatus : "Married"
/// spouseName : "Mr. Krishankant Dubey"
/// fatherName : "Mr. Gautam Sharma"
/// motherName : "Mrs. Aasha Sharma"
/// bloodGroupType : "AB+"
/// document : null
/// roleType : "HR Head"
/// password : "Moreyeahs@123"
/// joiningDate : null
/// confirmationDate : null
/// dob : null
/// emergencyNumber : "9752083345"
/// whatsappNumber : "8517014372"
/// aadharNumber : null
/// panNumber : "EYYPS5491H"
/// permanentAddress : "894 -101 Uniqe Center Mahalaxmi Nagar Indore (M.P)"
/// localAddress : "894 -101 Uniqe Center Mahalaxmi Nagar Indore (M.P)"
/// medicalIssue : "No issues"
/// profile : "https://uatportalapi.moreyeahs.in/uploadimage/one20220228052736PM.jpg"
/// salary : null
/// bankAccountNumber : "50100185795642"
/// ifsc : "HDFC0003812"
/// accountHolderName : "Lovely Sharma"
/// bankName : "HDFC "
/// moreyeahsMailId : "lsharma@moreyeahs.com"
/// employeeTypes : "Employee On Probation Period"
/// companyName : null
/// bloodGroupId : 7
/// roleId : 120
/// employeeTypeID : 5
/// companyId : 1
/// uploadResume : null

class ProfileResponse {
  ProfileResponse({
      int employeeId, 
      String v, 
      String email, 
      String firstName, 
      String lastName, 
      String primaryContact, 
      String maritalStatus, 
      String spouseName, 
      String fatherName, 
      String motherName, 
      String bloodGroupType, 
      dynamic document, 
      String roleType, 
      String password, 
      dynamic joiningDate, 
      dynamic confirmationDate, 
      dynamic dob, 
      String emergencyNumber, 
      String whatsappNumber, 
      dynamic aadharNumber, 
      String panNumber, 
      String permanentAddress, 
      String localAddress, 
      String medicalIssue, 
      String profile, 
      dynamic salary, 
      String bankAccountNumber, 
      String ifsc, 
      String accountHolderName, 
      String bankName, 
      String moreyeahsMailId, 
      String employeeTypes, 
      dynamic companyName, 
      int bloodGroupId, 
      int roleId, 
      int employeeTypeID, 
      int companyId, 
      dynamic uploadResume,}){
    _employeeId = employeeId;
    _v = v;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _primaryContact = primaryContact;
    _maritalStatus = maritalStatus;
    _spouseName = spouseName;
    _fatherName = fatherName;
    _motherName = motherName;
    _bloodGroupType = bloodGroupType;
    _document = document;
    _roleType = roleType;
    _password = password;
    _joiningDate = joiningDate;
    _confirmationDate = confirmationDate;
    _dob = dob;
    _emergencyNumber = emergencyNumber;
    _whatsappNumber = whatsappNumber;
    _aadharNumber = aadharNumber;
    _panNumber = panNumber;
    _permanentAddress = permanentAddress;
    _localAddress = localAddress;
    _medicalIssue = medicalIssue;
    _profile = profile;
    _salary = salary;
    _bankAccountNumber = bankAccountNumber;
    _ifsc = ifsc;
    _accountHolderName = accountHolderName;
    _bankName = bankName;
    _moreyeahsMailId = moreyeahsMailId;
    _employeeTypes = employeeTypes;
    _companyName = companyName;
    _bloodGroupId = bloodGroupId;
    _roleId = roleId;
    _employeeTypeID = employeeTypeID;
    _companyId = companyId;
    _uploadResume = uploadResume;
}

  ProfileResponse.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _v = json['v'];
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _primaryContact = json['primaryContact'];
    _maritalStatus = json['maritalStatus'];
    _spouseName = json['spouseName'];
    _fatherName = json['fatherName'];
    _motherName = json['motherName'];
    _bloodGroupType = json['bloodGroupType'];
    _document = json['document'];
    _roleType = json['roleType'];
    _password = json['password'];
    _joiningDate = json['joiningDate'];
    _confirmationDate = json['confirmationDate'];
    _dob = json['dob'];
    _emergencyNumber = json['emergencyNumber'];
    _whatsappNumber = json['whatsappNumber'];
    _aadharNumber = json['aadharNumber'];
    _panNumber = json['panNumber'];
    _permanentAddress = json['permanentAddress'];
    _localAddress = json['localAddress'];
    _medicalIssue = json['medicalIssue'];
    _profile = json['profile'];
    _salary = json['salary'];
    _bankAccountNumber = json['bankAccountNumber'];
    _ifsc = json['ifsc'];
    _accountHolderName = json['accountHolderName'];
    _bankName = json['bankName'];
    _moreyeahsMailId = json['moreyeahsMailId'];
    _employeeTypes = json['employeeTypes'];
    _companyName = json['companyName'];
    _bloodGroupId = json['bloodGroupId'];
    _roleId = json['roleId'];
    _employeeTypeID = json['employeeTypeID'];
    _companyId = json['companyId'];
    _uploadResume = json['uploadResume'];
  }
  int _employeeId;
  String _v;
  String _email;
  String _firstName;
  String _lastName;
  String _primaryContact;
  String _maritalStatus;
  String _spouseName;
  String _fatherName;
  String _motherName;
  String _bloodGroupType;
  dynamic _document;
  String _roleType;
  String _password;
  dynamic _joiningDate;
  dynamic _confirmationDate;
  dynamic _dob;
  String _emergencyNumber;
  String _whatsappNumber;
  dynamic _aadharNumber;
  String _panNumber;
  String _permanentAddress;
  String _localAddress;
  String _medicalIssue;
  String _profile;
  dynamic _salary;
  String _bankAccountNumber;
  String _ifsc;
  String _accountHolderName;
  String _bankName;
  String _moreyeahsMailId;
  String _employeeTypes;
  dynamic _companyName;
  int _bloodGroupId;
  int _roleId;
  int _employeeTypeID;
  int _companyId;
  dynamic _uploadResume;

  int get employeeId => _employeeId;
  String get v => _v;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get primaryContact => _primaryContact;
  String get maritalStatus => _maritalStatus;
  String get spouseName => _spouseName;
  String get fatherName => _fatherName;
  String get motherName => _motherName;
  String get bloodGroupType => _bloodGroupType;
  dynamic get document => _document;
  String get roleType => _roleType;
  String get password => _password;
  dynamic get joiningDate => _joiningDate;
  dynamic get confirmationDate => _confirmationDate;
  dynamic get dob => _dob;
  String get emergencyNumber => _emergencyNumber;
  String get whatsappNumber => _whatsappNumber;
  dynamic get aadharNumber => _aadharNumber;
  String get panNumber => _panNumber;
  String get permanentAddress => _permanentAddress;
  String get localAddress => _localAddress;
  String get medicalIssue => _medicalIssue;
  String get profile => _profile;
  dynamic get salary => _salary;
  String get bankAccountNumber => _bankAccountNumber;
  String get ifsc => _ifsc;
  String get accountHolderName => _accountHolderName;
  String get bankName => _bankName;
  String get moreyeahsMailId => _moreyeahsMailId;
  String get employeeTypes => _employeeTypes;
  dynamic get companyName => _companyName;
  int get bloodGroupId => _bloodGroupId;
  int get roleId => _roleId;
  int get employeeTypeID => _employeeTypeID;
  int get companyId => _companyId;
  dynamic get uploadResume => _uploadResume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['v'] = _v;
    map['email'] = _email;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['primaryContact'] = _primaryContact;
    map['maritalStatus'] = _maritalStatus;
    map['spouseName'] = _spouseName;
    map['fatherName'] = _fatherName;
    map['motherName'] = _motherName;
    map['bloodGroupType'] = _bloodGroupType;
    map['document'] = _document;
    map['roleType'] = _roleType;
    map['password'] = _password;
    map['joiningDate'] = _joiningDate;
    map['confirmationDate'] = _confirmationDate;
    map['dob'] = _dob;
    map['emergencyNumber'] = _emergencyNumber;
    map['whatsappNumber'] = _whatsappNumber;
    map['aadharNumber'] = _aadharNumber;
    map['panNumber'] = _panNumber;
    map['permanentAddress'] = _permanentAddress;
    map['localAddress'] = _localAddress;
    map['medicalIssue'] = _medicalIssue;
    map['profile'] = _profile;
    map['salary'] = _salary;
    map['bankAccountNumber'] = _bankAccountNumber;
    map['ifsc'] = _ifsc;
    map['accountHolderName'] = _accountHolderName;
    map['bankName'] = _bankName;
    map['moreyeahsMailId'] = _moreyeahsMailId;
    map['employeeTypes'] = _employeeTypes;
    map['companyName'] = _companyName;
    map['bloodGroupId'] = _bloodGroupId;
    map['roleId'] = _roleId;
    map['employeeTypeID'] = _employeeTypeID;
    map['companyId'] = _companyId;
    map['uploadResume'] = _uploadResume;
    return map;
  }

}