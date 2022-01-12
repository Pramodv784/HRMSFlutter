import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.url,
     this.message,
    this.accesToken,
     this.statusReason,
    this.myCategoryScore,
     this.myAvgScore,
    this.dataQuestion,
    this.dataFeedback,
    this.categoryDataList,
    this.categoryNameDataList,
    this.typeVMs,
    this.teamVm,
    this.feedbacks,
    this.projectData,
    this.feedbackDatas,
    this.countData,
    this.teamDatas,
    this.dataCategory,
    this.userData,
    this.billTypeData,
    this.caseData,
    this.projectTypeData,
    this.badgesTypeData,
    this.statusData,
    this.technologyData,
    this.employeeData,
    this.taskData,
    this.goalTypeDataLists,
    this.candidateData,
    this.teamData,
    this.projectdataList,
    this.endorsementDatList,
    this.dataEmployee,
    this.leadsData,
    this.currencyData,
    this.caseTypesData,
    this.countryData,
    this.stateData,
    this.cityData,
    this.clientData,
    this.taskTypeData,
    this.roleData,
    this.endorsementDataList,
    this.goalTypeDataList,
    this.bloodGroupData,
    this.eventData,
    this.documentData,
    this.resourceData,
    this.userDataList,
    this.employeeTypeData,
    this.leadData,
    this.departmentEmployeeData,
    this.roleCountData,
    this.caseDataList,
    this.candidateWebRoleData,
    this.birthData,
    this.anniversaryData,
    this.employeeDataList,
    this.candidateDataList,
    this.employeeFolderData,
    this.interviewDataList,
    this.employeeFilesData,
    this.organizationFolderData,
    this.organizationFilesData,
    this.companyData,
    this.goalDataList,
    this.roleDatas,
    this.birthCount,
    this.resumeFilename,
    this.employeeProject,
    this.projectAssociation,
    this.userAssociation,
    this.billAssociation,
    this.caseAssociation,
    this.projectTypeAssociation,
    this.statusAssociation,
    this.technologyAssociation,
    this.taskAssociation,
    this.leadsAssociation,
    this.currencyAssociation,
     this.totalProjects,
     this.completedProjects,
     this.activeProjects,
     this.totalProjectManagers,
     this.totalProjectCoordinator,
     this.totalClient,
     this.onHoldCandidate,
     this.selectedCandidate,
     this.rejectedCandidate,
     this.count,
     this.todaysCase,
     this.totalCase,
     this.openCase,
     this.onHoldCase,
     this.cancelledCase,
     this.resolvedCase,
     this.itCase,
     this.managementCase,
     this.hrManagerCase,
     this.hrExecutiveCase,
     this.todaysNewLeave,
     this.totalActive,
     this.totalApproved,
     this.totalRejected,
     this.todayOnLeave,
     this.totalEmployee,
     this.totalLeads,
     this.convertedLeads,
     this.convertedLeadPercentage,
     this.sumofBillableSalary,
     this.sumofNonBillableSalary,
     this.billAndNonBilEmpSalary,
  });

  dynamic url;
  String message;
  dynamic accesToken;
  bool statusReason;
  dynamic myCategoryScore;
  int myAvgScore;
  dynamic dataQuestion;
  dynamic dataFeedback;
  dynamic categoryDataList;
  dynamic categoryNameDataList;
  dynamic typeVMs;
  dynamic teamVm;
  dynamic feedbacks;
  dynamic projectData;
  dynamic feedbackDatas;
  dynamic countData;
  dynamic teamDatas;
  dynamic dataCategory;
  dynamic userData;
  dynamic billTypeData;
  dynamic caseData;
  dynamic projectTypeData;
  dynamic badgesTypeData;
  dynamic statusData;
  dynamic technologyData;
  dynamic employeeData;
  dynamic taskData;
  dynamic goalTypeDataLists;
  dynamic candidateData;
  dynamic teamData;
  dynamic projectdataList;
  dynamic endorsementDatList;
  dynamic dataEmployee;
  dynamic leadsData;
  dynamic currencyData;
  dynamic caseTypesData;
  dynamic countryData;
  dynamic stateData;
  dynamic cityData;
  dynamic clientData;
  dynamic taskTypeData;
  dynamic roleData;
  dynamic endorsementDataList;
  dynamic goalTypeDataList;
  dynamic bloodGroupData;
  dynamic eventData;
  dynamic documentData;
  dynamic resourceData;
  List<UserDataList> userDataList;
  dynamic employeeTypeData;
  dynamic leadData;
  dynamic departmentEmployeeData;
  dynamic roleCountData;
  dynamic caseDataList;
  dynamic candidateWebRoleData;
  dynamic birthData;
  dynamic anniversaryData;
  dynamic employeeDataList;
  dynamic candidateDataList;
  dynamic employeeFolderData;
  dynamic interviewDataList;
  dynamic employeeFilesData;
  dynamic organizationFolderData;
  dynamic organizationFilesData;
  dynamic companyData;
  dynamic goalDataList;
  dynamic roleDatas;
  dynamic birthCount;
  dynamic resumeFilename;
  dynamic employeeProject;
  dynamic projectAssociation;
  dynamic userAssociation;
  dynamic billAssociation;
  dynamic caseAssociation;
  dynamic projectTypeAssociation;
  dynamic statusAssociation;
  dynamic technologyAssociation;
  dynamic taskAssociation;
  dynamic leadsAssociation;
  dynamic currencyAssociation;
  int totalProjects;
  int completedProjects;
  int activeProjects;
  int totalProjectManagers;
  int totalProjectCoordinator;
  int totalClient;
  int onHoldCandidate;
  int selectedCandidate;
  int rejectedCandidate;
  int count;
  int todaysCase;
  int totalCase;
  int openCase;
  int onHoldCase;
  int cancelledCase;
  int resolvedCase;
  int itCase;
  int managementCase;
  int hrManagerCase;
  int hrExecutiveCase;
  int todaysNewLeave;
  int totalActive;
  int totalApproved;
  int totalRejected;
  int todayOnLeave;
  int totalEmployee;
  int totalLeads;
  int convertedLeads;
  double convertedLeadPercentage;
  double sumofBillableSalary;
  double sumofNonBillableSalary;
  double billAndNonBilEmpSalary;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        url: json["url"],
        message: json["message"] == null ? null : json["message"],
        accesToken: json["accesToken"],
        statusReason:
            json["statusReason"] == null ? null : json["statusReason"],
        myCategoryScore: json["myCategoryScore"],
        myAvgScore: json["myAvgScore"] == null ? null : json["myAvgScore"],
        dataQuestion: json["dataQuestion"],
        dataFeedback: json["dataFeedback"],
        categoryDataList: json["categoryDataList"],
        categoryNameDataList: json["categoryNameDataList"],
        typeVMs: json["typeVMs"],
        teamVm: json["teamVM"],
        feedbacks: json["feedbacks"],
        projectData: json["projectData"],
        feedbackDatas: json["feedbackDatas"],
        countData: json["countData"],
        teamDatas: json["teamDatas"],
        dataCategory: json["dataCategory"],
        userData: json["userData"],
        billTypeData: json["billTypeData"],
        caseData: json["caseData"],
        projectTypeData: json["projectTypeData"],
        badgesTypeData: json["badgesTypeData"],
        statusData: json["statusData"],
        technologyData: json["technologyData"],
        employeeData: json["employeeData"],
        taskData: json["taskData"],
        goalTypeDataLists: json["goalTypeDataLists"],
        candidateData: json["candidateData"],
        teamData: json["teamData"],
        projectdataList: json["projectdataList"],
        endorsementDatList: json["endorsementDatList"],
        dataEmployee: json["dataEmployee"],
        leadsData: json["leadsData"],
        currencyData: json["currencyData"],
        caseTypesData: json["caseTypesData"],
        countryData: json["countryData"],
        stateData: json["stateData"],
        cityData: json["cityData"],
        clientData: json["clientData"],
        taskTypeData: json["taskTypeData"],
        roleData: json["roleData"],
        endorsementDataList: json["endorsementDataList"],
        goalTypeDataList: json["goalTypeDataList"],
        bloodGroupData: json["bloodGroupData"],
        eventData: json["eventData"],
        documentData: json["documentData"],
        resourceData: json["resourceData"],
        userDataList: json["userDataList"] == null
            ? null
            : List<UserDataList>.from(
                json["userDataList"].map((x) => UserDataList.fromMap(x))),
        employeeTypeData: json["employeeTypeData"],
        leadData: json["leadData"],
        departmentEmployeeData: json["departmentEmployeeData"],
        roleCountData: json["roleCountData"],
        caseDataList: json["caseDataList"],
        candidateWebRoleData: json["candidateWebRoleData"],
        birthData: json["birthData"],
        anniversaryData: json["anniversaryData"],
        employeeDataList: json["employeeDataList"],
        candidateDataList: json["candidateDataList"],
        employeeFolderData: json["employeeFolderData"],
        interviewDataList: json["interviewDataList"],
        employeeFilesData: json["employeeFilesData"],
        organizationFolderData: json["organizationFolderData"],
        organizationFilesData: json["organizationFilesData"],
        companyData: json["companyData"],
        goalDataList: json["goalDataList"],
        roleDatas: json["roleDatas"],
        birthCount: json["birthCount"],
        resumeFilename: json["resumeFilename"],
        employeeProject: json["employeeProject"],
        projectAssociation: json["projectAssociation"],
        userAssociation: json["userAssociation"],
        billAssociation: json["billAssociation"],
        caseAssociation: json["caseAssociation"],
        projectTypeAssociation: json["projectTypeAssociation"],
        statusAssociation: json["statusAssociation"],
        technologyAssociation: json["technologyAssociation"],
        taskAssociation: json["taskAssociation"],
        leadsAssociation: json["leadsAssociation"],
        currencyAssociation: json["currencyAssociation"],
        totalProjects:
            json["totalProjects"] == null ? null : json["totalProjects"],
        completedProjects: json["completedProjects"] == null
            ? null
            : json["completedProjects"],
        activeProjects:
            json["activeProjects"] == null ? null : json["activeProjects"],
        totalProjectManagers: json["totalProjectManagers"] == null
            ? null
            : json["totalProjectManagers"],
        totalProjectCoordinator: json["totalProjectCoordinator"] == null
            ? null
            : json["totalProjectCoordinator"],
        totalClient: json["totalClient"] == null ? null : json["totalClient"],
        onHoldCandidate:
            json["onHoldCandidate"] == null ? null : json["onHoldCandidate"],
        selectedCandidate: json["selectedCandidate"] == null
            ? null
            : json["selectedCandidate"],
        rejectedCandidate: json["rejectedCandidate"] == null
            ? null
            : json["rejectedCandidate"],
        count: json["count"] == null ? null : json["count"],
        todaysCase: json["todaysCase"] == null ? null : json["todaysCase"],
        totalCase: json["totalCase"] == null ? null : json["totalCase"],
        openCase: json["openCase"] == null ? null : json["openCase"],
        onHoldCase: json["onHoldCase"] == null ? null : json["onHoldCase"],
        cancelledCase:
            json["cancelledCase"] == null ? null : json["cancelledCase"],
        resolvedCase:
            json["resolvedCase"] == null ? null : json["resolvedCase"],
        itCase: json["itCase"] == null ? null : json["itCase"],
        managementCase:
            json["managementCase"] == null ? null : json["managementCase"],
        hrManagerCase:
            json["hrManagerCase"] == null ? null : json["hrManagerCase"],
        hrExecutiveCase:
            json["hrExecutiveCase"] == null ? null : json["hrExecutiveCase"],
        todaysNewLeave:
            json["todaysNewLeave"] == null ? null : json["todaysNewLeave"],
        totalActive: json["totalActive"] == null ? null : json["totalActive"],
        totalApproved:
            json["totalApproved"] == null ? null : json["totalApproved"],
        totalRejected:
            json["totalRejected"] == null ? null : json["totalRejected"],
        todayOnLeave:
            json["todayOnLeave"] == null ? null : json["todayOnLeave"],
        totalEmployee:
            json["totalEmployee"] == null ? null : json["totalEmployee"],
        totalLeads: json["totalLeads"] == null ? null : json["totalLeads"],
        convertedLeads:
            json["convertedLeads"] == null ? null : json["convertedLeads"],
        convertedLeadPercentage: json["convertedLeadPercentage"] == null
            ? null
            : json["convertedLeadPercentage"],
        sumofBillableSalary: json["sumofBillableSalary"] == null
            ? null
            : json["sumofBillableSalary"],
        sumofNonBillableSalary: json["sumofNonBillableSalary"] == null
            ? null
            : json["sumofNonBillableSalary"],
        billAndNonBilEmpSalary: json["billAndNonBilEmpSalary"] == null
            ? null
            : json["billAndNonBilEmpSalary"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "message": message == null ? null : message,
        "accesToken": accesToken,
        "statusReason": statusReason == null ? null : statusReason,
        "myCategoryScore": myCategoryScore,
        "myAvgScore": myAvgScore == null ? null : myAvgScore,
        "dataQuestion": dataQuestion,
        "dataFeedback": dataFeedback,
        "categoryDataList": categoryDataList,
        "categoryNameDataList": categoryNameDataList,
        "typeVMs": typeVMs,
        "teamVM": teamVm,
        "feedbacks": feedbacks,
        "projectData": projectData,
        "feedbackDatas": feedbackDatas,
        "countData": countData,
        "teamDatas": teamDatas,
        "dataCategory": dataCategory,
        "userData": userData,
        "billTypeData": billTypeData,
        "caseData": caseData,
        "projectTypeData": projectTypeData,
        "badgesTypeData": badgesTypeData,
        "statusData": statusData,
        "technologyData": technologyData,
        "employeeData": employeeData,
        "taskData": taskData,
        "goalTypeDataLists": goalTypeDataLists,
        "candidateData": candidateData,
        "teamData": teamData,
        "projectdataList": projectdataList,
        "endorsementDatList": endorsementDatList,
        "dataEmployee": dataEmployee,
        "leadsData": leadsData,
        "currencyData": currencyData,
        "caseTypesData": caseTypesData,
        "countryData": countryData,
        "stateData": stateData,
        "cityData": cityData,
        "clientData": clientData,
        "taskTypeData": taskTypeData,
        "roleData": roleData,
        "endorsementDataList": endorsementDataList,
        "goalTypeDataList": goalTypeDataList,
        "bloodGroupData": bloodGroupData,
        "eventData": eventData,
        "documentData": documentData,
        "resourceData": resourceData,
        "userDataList": userDataList == null
            ? null
            : List<dynamic>.from(userDataList.map((x) => x.toMap())),
        "employeeTypeData": employeeTypeData,
        "leadData": leadData,
        "departmentEmployeeData": departmentEmployeeData,
        "roleCountData": roleCountData,
        "caseDataList": caseDataList,
        "candidateWebRoleData": candidateWebRoleData,
        "birthData": birthData,
        "anniversaryData": anniversaryData,
        "employeeDataList": employeeDataList,
        "candidateDataList": candidateDataList,
        "employeeFolderData": employeeFolderData,
        "interviewDataList": interviewDataList,
        "employeeFilesData": employeeFilesData,
        "organizationFolderData": organizationFolderData,
        "organizationFilesData": organizationFilesData,
        "companyData": companyData,
        "goalDataList": goalDataList,
        "roleDatas": roleDatas,
        "birthCount": birthCount,
        "resumeFilename": resumeFilename,
        "employeeProject": employeeProject,
        "projectAssociation": projectAssociation,
        "userAssociation": userAssociation,
        "billAssociation": billAssociation,
        "caseAssociation": caseAssociation,
        "projectTypeAssociation": projectTypeAssociation,
        "statusAssociation": statusAssociation,
        "technologyAssociation": technologyAssociation,
        "taskAssociation": taskAssociation,
        "leadsAssociation": leadsAssociation,
        "currencyAssociation": currencyAssociation,
        "totalProjects": totalProjects == null ? null : totalProjects,
        "completedProjects":
            completedProjects == null ? null : completedProjects,
        "activeProjects": activeProjects == null ? null : activeProjects,
        "totalProjectManagers":
            totalProjectManagers == null ? null : totalProjectManagers,
        "totalProjectCoordinator":
            totalProjectCoordinator == null ? null : totalProjectCoordinator,
        "totalClient": totalClient == null ? null : totalClient,
        "onHoldCandidate": onHoldCandidate == null ? null : onHoldCandidate,
        "selectedCandidate":
            selectedCandidate == null ? null : selectedCandidate,
        "rejectedCandidate":
            rejectedCandidate == null ? null : rejectedCandidate,
        "count": count == null ? null : count,
        "todaysCase": todaysCase == null ? null : todaysCase,
        "totalCase": totalCase == null ? null : totalCase,
        "openCase": openCase == null ? null : openCase,
        "onHoldCase": onHoldCase == null ? null : onHoldCase,
        "cancelledCase": cancelledCase == null ? null : cancelledCase,
        "resolvedCase": resolvedCase == null ? null : resolvedCase,
        "itCase": itCase == null ? null : itCase,
        "managementCase": managementCase == null ? null : managementCase,
        "hrManagerCase": hrManagerCase == null ? null : hrManagerCase,
        "hrExecutiveCase": hrExecutiveCase == null ? null : hrExecutiveCase,
        "todaysNewLeave": todaysNewLeave == null ? null : todaysNewLeave,
        "totalActive": totalActive == null ? null : totalActive,
        "totalApproved": totalApproved == null ? null : totalApproved,
        "totalRejected": totalRejected == null ? null : totalRejected,
        "todayOnLeave": todayOnLeave == null ? null : todayOnLeave,
        "totalEmployee": totalEmployee == null ? null : totalEmployee,
        "totalLeads": totalLeads == null ? null : totalLeads,
        "convertedLeads": convertedLeads == null ? null : convertedLeads,
        "convertedLeadPercentage":
            convertedLeadPercentage == null ? null : convertedLeadPercentage,
        "sumofBillableSalary":
            sumofBillableSalary == null ? null : sumofBillableSalary,
        "sumofNonBillableSalary":
            sumofNonBillableSalary == null ? null : sumofNonBillableSalary,
        "billAndNonBilEmpSalary":
            billAndNonBilEmpSalary == null ? null : billAndNonBilEmpSalary,
      };
}

class UserDataList {
  UserDataList({
     this.employeeId,
     this.fullName,
     this.roleType,
     this.primaryContact,
  });

  int employeeId;
  String fullName;
  String roleType;
  String primaryContact;

  factory UserDataList.fromJson(String str) =>
      UserDataList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDataList.fromMap(Map<String, dynamic> json) => UserDataList(
        employeeId: json["employeeId"] == null ? null : json["employeeId"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        roleType: json["roleType"] == null ? null : json["roleType"],
        primaryContact:
            json["primaryContact"] == null ? null : json["primaryContact"],
      );

  Map<String, dynamic> toMap() => {
        "employeeId": employeeId == null ? null : employeeId,
        "fullName": fullName == null ? null : fullName,
        "roleType": roleType == null ? null : roleType,
        "primaryContact": primaryContact == null ? null : primaryContact,
      };
}
