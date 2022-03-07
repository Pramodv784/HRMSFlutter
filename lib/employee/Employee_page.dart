

import 'dart:convert';



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/employee/emp_block.dart';
import 'package:hrms/employee/emp_view.dart';

import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';


import '../api_provider/ApiController.dart';
import '../res/AppColors.dart';
import '../res/Fonts.dart';
import '../res/Images.dart';
import '../res/Screens.dart';
import '../utility/Dialogs.dart';
import '../utility/Header.dart';
import '../utility/NetworkCheck.dart';
import '../utility/Utility.dart';
import 'emp_presenter.dart';
import 'model/employee_list_response.dart';
import 'model/get_company_type.dart';
import 'model/get_emp_type_response.dart';
import 'model/get_roll_type_response.dart';
class EmployeePage extends StatefulWidget {
  const EmployeePage({Key key}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}



class _EmployeePageState extends State<EmployeePage> implements EmpView {
  EmpBlock empBlock=EmpBlock();
  RandomColor _randomColor = RandomColor();
  final ScrollController _scrollController=ScrollController();
  List<EmployeeDataList> userList=[];
  List<EmployeeDataList> dummyUserList=[];
  EmpPresenter _presenter;


  @override
  void initState() {
    _presenter=EmpPresenter(this);
    _presenter.getEmpList(context);
    empBlock.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'Employee List',rightWidget:
            InkWell(child: Icon(Icons.filter_list,color: AppColors.white,),onTap: (){opendFilterDialog(context); },)),
            Center(
              child: TextField(

                onChanged: (value){
                  filterSearchResults(value);

                },

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.amber,),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear,color: Colors.amber,),
                      onPressed: () {
                        // editingController.clear();
                      },

                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.separated(
                    controller: _scrollController,
                    itemCount: dummyUserList?.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder:(context,index){
                      return ListTile(
                        title: Text('${dummyUserList[index]?.fullName}'),
                        subtitle: Text('${dummyUserList[index].roleType}'),
                        onTap: (){
                          Navigator.pushNamed(context, Screens.EmpDetail,
                              arguments: dummyUserList[index]);
                        },
                        leading:  Hero(
                          tag: '${dummyUserList[index].employeeId}',
                          child: ClipRRect(
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: _randomColor.randomColor(colorHue: ColorHue.orange),
                              ),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(dummyUserList[index]?.fullName!=null&& dummyUserList[index]?.fullName!=''?
                                  '${dummyUserList[index]?.fullName.substring(0, 1) + dummyUserList[index]?.fullName.split(" ").last.substring(0, 1)}'.toUpperCase():'',
                                      style: TextStyle(color: AppColors.white)),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
      
      
      
      

  }
  void filterSearchResults(String query) {
    List<EmployeeDataList> dummySearchList = [];
    dummySearchList.addAll(userList);
    if(query.isNotEmpty) {
      List<EmployeeDataList> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.fullName.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        dummyUserList.clear();
        dummyUserList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        dummyUserList.clear();
        dummyUserList.addAll(userList);
      });
    }

  }


  opendFilterDialog(BuildContext context) {
    int empID,cmpId;
    empBlock.fetchRoll();
    empBlock.fetchEmptype();
    empBlock.fetchCompanyType();
    List<int> selectedDepartment = [];
    List<RoleCountData> rollTypeList=[];
    Scaffold body = Scaffold(
      backgroundColor: AppColors.background.withOpacity(0.1),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          height: Utility.screenHeight(context) * .63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: textStyleWhite12px400w,
                      ),
                      InkWell(
                        child: Image.asset(Images.CloseIcon),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Department ',
                        style: textStyleWhite12px400w,
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                      ),
                    ])),
                SizedBox(
                  height: 5.0,
                ),
                StreamBuilder(
                  stream: empBlock.rolltype,
                    builder: (context,AsyncSnapshot<GetRollTypeResponse> data){
                        if(data.hasData)
                          {
                            return   DropdownButtonFormField<RoleCountData>(
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: AppColors.dropbg,
                              ),
                              dropdownColor: Colors.white,
                              onChanged: (RoleCountData value) {
                                setState(() {
                                  print('Team Id ****$value');
                                  selectedDepartment.clear();
                                  selectedDepartment.add(value.roleId);
                                });
                              },
                              hint: Text('Team'),
                                 icon: new Image.asset(Images.DropIcon),
                              items: data.data.roleCountData
                                  .map((RoleCountData data) => DropdownMenuItem(
                                child: Text(data.roleName),
                                value: data,
                              ))
                                  .toList(),
                            );
                          }
                        else
                          {
                              return Center(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SpinKitThreeBounce(
                                  color: AppColors.red,
                                ),
                              ));
                          }
                }),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Employee Type ',
                        style: textStyleWhite12px400w,
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                      ),
                    ])),
                SizedBox(
                  height: 5.0,
                ),
                StreamBuilder(
                   stream: empBlock.emptype,
                    builder: (context,AsyncSnapshot<GetEmpTypeResponse> emptype){
                         if(emptype.hasData)
                           {
                             return   DropdownButtonFormField<EmployeeTypeData>(
                               decoration: InputDecoration(
                                 contentPadding:
                                 EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.white, width: 2),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.white, width: 2),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 filled: true,
                                 fillColor: AppColors.dropbg,
                               ),
                               dropdownColor: Colors.white,
                               onChanged: (EmployeeTypeData value) {
                                 setState(() {
                                   empID=value.employeeTypeId;
                                   print('Team Id ****$value');
                                 });
                               },
                               hint: Text('Team'),
                               icon: new Image.asset(Images.DropIcon),
                               items: emptype.data.employeeTypeData
                                   .map((EmployeeTypeData data) => DropdownMenuItem(
                                 child: Text(data.employeeTypes),
                                 value: data,
                               ))
                                   .toList(),
                             );
                           }
                         else
                           {
                             return Center(child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: SpinKitThreeBounce(
                                 color: AppColors.red,
                               ),
                             ));
                           }
                }),


                SizedBox(
                  height: 20.0,
                ),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Company',
                        style: textStyleWhite12px400w,
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                      ),
                    ])),
                SizedBox(
                  height: 5.0,
                ),


                StreamBuilder(
                  stream: empBlock.companytype,
                    builder: (context,AsyncSnapshot<GetCompanyType> companyData){
                    if(!companyData.hasData)
                      {
                        return Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SpinKitThreeBounce(
                            color: AppColors.red,
                          ),
                        ));
                      }
                    else
                      {
                       return DropdownButtonFormField<CompanyData>(
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: AppColors.dropbg,
                          ),
                          dropdownColor: Colors.white,
                          onChanged: (CompanyData value) {
                            setState(() {
                                cmpId=value.companyId;
                            });
                          },
                          hint: Text('Employee name'),
                          icon: new Image.asset(Images.DropIcon),
                          items: companyData.data.companyData
                              .map((CompanyData data) => DropdownMenuItem(
                            child: Text(data.companyName),
                            value: data,
                          ))
                              .toList(),
                        );
                      }


                }),

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: AppColors.colorPrimary,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          Navigator.pop(context);
                          _presenter.postFilter(context, selectedDepartment, empID, cmpId);

                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: OutlineButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        highlightedBorderColor: AppColors.colorPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    showDialog<String>(
        context: context,
        builder: (context) {
          return
            body;
        });
  }


  Future<EmployeeListResponse> postFilter(List<int> selectedDepartment, int empID, int cmpId) async {
    ApiController _repository = ApiController.getInstance();

    var map={'department':selectedDepartment,'employeeTypeId':empID,'companyId':cmpId};


    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.UserFilter,body: map,headers: await Utility.header())
        ..then((Response res) async {
          Utility.log('tag', res);
          Utility.log('>>>',jsonDecode(res.toString()) );


          Dialogs.hideLoader(context);

          EmployeeListResponse employeeListResponse= EmployeeListResponse.fromJson(res.data);
          if(employeeListResponse.statusReason??false)
            {

              dummyUserList.addAll(employeeListResponse.employeeDataList);
            //  _home(context, dummyUserList);
            }


        }
        ).catchError((e) async {
          Utility.log('tag', e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }




  }

  @override
  onError(String message) {
   Utility.showErrorToast(context, message);
  }

  @override
  void onUserListFetch(EmployeeListResponse response) {

    dummyUserList=response.employeeDataList;
    userList.addAll(dummyUserList);
    setState(() {

    });
  }




}




