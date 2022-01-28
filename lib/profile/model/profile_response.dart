/// employeeId : 156
/// fullName : "LovelySharma"
/// firstName : "Lovely"
/// lastName : "Sharma"
/// password : "Moreyeahs@123"
/// companyId : 1
/// uploadResume : null
/// primaryContact : "8517014372"
/// roleType : "HR Head"
/// email : "lsharma@moreyeahs.com"
/// employeeTypeID : 5
/// employeeCode : null
/// secondaryContact : null
/// maritalStatus : "Married"
/// spouseName : "Mr. Krishankant Dubey"
/// fatherName : "Mr. Gautam Sharma"
/// motherName : "Mrs. Aasha Sharma"
/// createdOn : null
/// updatedOn : null
/// isActive : false
/// isDeleted : false
/// bloodGroupId : 7
/// bloodGroup : "AB+"
/// document : null
/// roleId : 120
/// permanentAddress : "894 -101 Uniqe Center Mahalaxmi Nagar Indore (M.P)"
/// localAddress : "894 -101 Uniqe Center Mahalaxmi Nagar Indore (M.P)"
/// joiningDate : null
/// confirmationDate : null
/// dob : null
/// emergencyNumber : "9752083345"
/// whatsappNumber : "8517014372"
/// aadharNumber : "896112437162"
/// panNumber : "EYYPS5491H"
/// medicalIssue : "No issues"
/// profile : null
/// salary : null
/// bankAccountNumber : "50100185795642"
/// ifsc : "HDFC0003812"
/// accountHolderName : "Lovely Sharma"
/// bankName : "HDFC "
/// moreyeahsMailId : "lsharma@moreyeahs.com"
/// employeeType : "Employee On Probation Period"
/// companyName : null

class ProfileResponse {
  ProfileResponse({
      int employeeId, 
      String fullName, 
      String firstName, 
      String lastName, 
      String password, 
      int companyId, 
      dynamic uploadResume, 
      String primaryContact, 
      String roleType, 
      String email, 
      int employeeTypeID, 
      dynamic employeeCode, 
      dynamic secondaryContact, 
      String maritalStatus, 
      String spouseName, 
      String fatherName, 
      String motherName, 
      dynamic createdOn, 
      dynamic updatedOn, 
      bool isActive, 
      bool isDeleted, 
      int bloodGroupId, 
      String bloodGroup, 
      dynamic document, 
      int roleId, 
      String permanentAddress, 
      String localAddress, 
      dynamic joiningDate, 
      dynamic confirmationDate, 
      dynamic dob, 
      String emergencyNumber, 
      String whatsappNumber, 
      String aadharNumber, 
      String panNumber, 
      String medicalIssue, 
      dynamic profile, 
      dynamic salary, 
      String bankAccountNumber, 
      String ifsc, 
      String accountHolderName, 
      String bankName, 
      String moreyeahsMailId, 
      String employeeType, 
      dynamic companyName,}){
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
}

  ProfileResponse.fromJson(dynamic json) {
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
  }
  int _employeeId;
  String _fullName;
  String _firstName;
  String _lastName;
  String _password;
  int _companyId;
  dynamic _uploadResume;
  String _primaryContact;
  String _roleType;
  String _email;
  int _employeeTypeID;
  dynamic _employeeCode;
  dynamic _secondaryContact;
  String _maritalStatus;
  String _spouseName;
  String _fatherName;
  String _motherName;
  dynamic _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isDeleted;
  int _bloodGroupId;
  String _bloodGroup;
  dynamic _document;
  int _roleId;
  String _permanentAddress;
  String _localAddress;
  dynamic _joiningDate;
  dynamic _confirmationDate;
  dynamic _dob;
  String _emergencyNumber;
  String _whatsappNumber;
  String _aadharNumber;
  String _panNumber;
  String _medicalIssue;
  dynamic _profile;
  dynamic _salary;
  String _bankAccountNumber;
  String _ifsc;
  String _accountHolderName;
  String _bankName;
  String _moreyeahsMailId;
  String _employeeType;
  dynamic _companyName;

  int get employeeId => _employeeId;
  String get fullName => _fullName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get password => _password;
  int get companyId => _companyId;
  dynamic get uploadResume => _uploadResume;
  String get primaryContact => _primaryContact;
  String get roleType => _roleType;
  String get email => _email;
  int get employeeTypeID => _employeeTypeID;
  dynamic get employeeCode => _employeeCode;
  dynamic get secondaryContact => _secondaryContact;
  String get maritalStatus => _maritalStatus;
  String get spouseName => _spouseName;
  String get fatherName => _fatherName;
  String get motherName => _motherName;
  dynamic get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  int get bloodGroupId => _bloodGroupId;
  String get bloodGroup => _bloodGroup;
  dynamic get document => _document;
  int get roleId => _roleId;
  String get permanentAddress => _permanentAddress;
  String get localAddress => _localAddress;
  dynamic get joiningDate => _joiningDate;
  dynamic get confirmationDate => _confirmationDate;
  dynamic get dob => _dob;
  String get emergencyNumber => _emergencyNumber;
  String get whatsappNumber => _whatsappNumber;
  String get aadharNumber => _aadharNumber;
  String get panNumber => _panNumber;
  String get medicalIssue => _medicalIssue;
  dynamic get profile => _profile;
  dynamic get salary => _salary;
  String get bankAccountNumber => _bankAccountNumber;
  String get ifsc => _ifsc;
  String get accountHolderName => _accountHolderName;
  String get bankName => _bankName;
  String get moreyeahsMailId => _moreyeahsMailId;
  String get employeeType => _employeeType;
  dynamic get companyName => _companyName;

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
    return map;
  }

}