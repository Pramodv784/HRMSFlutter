import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:hrms/leave_request/model/ProfileModel.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class AddLeaveRequest extends StatefulWidget {
   AddLeaveRequest({Key key}) : super(key: key);

  @override
  _AddLeaveRequest createState() => _AddLeaveRequest();
}

class _AddLeaveRequest extends State<AddLeaveRequest>
   {
  DateTime _end_date,_start_date;
  var text=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
        children: [
          Expanded(
            child: ListView(
            children: [
            Header(headerText: 'Add Leave Rquest',),
    Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Request Details',style: textStyleWhite12px400w,),
                   SizedBox(height: 20.0,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Flexible(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             RichText(
                                 text: TextSpan(children: [
                                   TextSpan(
                                     text: 'From Date ',
                                     style: textStyleWhite12px400w,
                                   ),
                                   TextSpan(
                                     text: '*',
                                     style: TextStyle(color: AppColors.red, fontSize: 16.0),
                                   ),
                                 ])
                             ),
                             SizedBox(height: 5.0,),
                             InkWell(
                               child: Container(
                                   padding: EdgeInsets.symmetric(horizontal: 20.0),
                                   width: Utility.screenWidth(context),
                                   height: 52.0,
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3.0),
                                     color: AppColors.dropbg,
                                     border: Border.all(
                                       width: 1,
                                       color: AppColors.grey,
                                       style: BorderStyle.solid,
                                     ),
                                   ),
                                   child: Text(_start_date!=null
                                       ?Utility.formatDate(_start_date.toString()):'dd/mm/yyyy', style
                                       : TextStyle(fontSize: 15)
                                     ,)
                               ),
                               onTap: (){
                                 _start_date = DateTime.now();
                                 _showDatePicker(context,0);
                               },
                             ),


                           ],
                         ),
                       ),
                       SizedBox(width: 10,),
                       Flexible(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             RichText(
                                 text: TextSpan(children: [
                                   TextSpan(
                                     text: 'To Date ',
                                     style: textStyleWhite12px400w,
                                   ),
                                   TextSpan(
                                     text: '*',
                                     style: TextStyle(color: AppColors.red, fontSize: 16.0),
                                   ),
                                 ])
                             ),
                             SizedBox(height: 5.0,),
                             InkWell(
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                                 width: Utility.screenWidth(context),
                                 height: 52.0,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(3.0),
                                   color: AppColors.dropbg,
                                   border: Border.all(
                                     width: 1,
                                     color: AppColors.grey,
                                     style: BorderStyle.solid,
                                   ),
                                 ),
                                 child: Text(_end_date!=null
                                     ?Utility.formatDate(_end_date.toString()):'dd/mm/yyyy', style: TextStyle(fontSize: 15)),

                               ),
                               onTap: (){
                                 _showDatePicker(context,1);
                               },
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 10.0,),
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     width: Utility.screenWidth(context),
                     height: 52.0,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(3.0),
                       color: Color(0xFF616576),
                       border: Border.all(
                         width: 1,
                         color: AppColors.grey,
                         style: BorderStyle.solid,
                       ),
                     ),
                     child: Text(_start_date!=null&&_end_date!=null
                         ?'${daysBetween(_start_date,_end_date)} days'.toString():'0 days',
                         style: TextStyle(fontSize: 15,color: AppColors.white)),

                   ),
                   SizedBox(height: 10.0,),
                   RichText(
                       text: TextSpan(children: [
                         TextSpan(
                           text: 'Leave Title ',
                           style: textStyleWhite12px400w,
                         ),
                         TextSpan(
                           text: '*',
                           style: TextStyle(color: AppColors.red, fontSize: 16.0),
                         ),
                       ])
                   ),
                   SizedBox(height: 5.0,),
                   SizedBox(
                     width: Utility.screenWidth(context),
                     child: InputField(
                       placeHolderText: 'Enter leave title',
                       errorMessage: 'Please Enter leave  title',
                       inputType: InputType.ONLY_WORDS,
                     ),
                   ),
                  SizedBox(height: 10.0,),
                   RichText(
                       text: TextSpan(children: [
                         TextSpan(
                           text: 'Select Team ',
                           style: textStyleWhite12px400w,
                         ),
                         TextSpan(
                           text: '*',
                           style:
                           TextStyle(color: AppColors.red, fontSize: 16.0),
                         ),
                       ])),
                   SizedBox(
                     height: 5.0,
                   ),
                   DropdownButtonFormField<String>(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(
                           horizontal: 20, vertical: 20.0),
                       enabledBorder: OutlineInputBorder(
                         borderSide:
                         BorderSide(color: AppColors.grey, width: 1),
                         borderRadius: BorderRadius.circular(3),
                       ),
                       border: OutlineInputBorder(
                         borderSide:
                         BorderSide(color: Colors.white, width: 2),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       filled: true,
                       fillColor: AppColors.dropbg,
                     ),
                     dropdownColor: Colors.white,
                     onChanged: (String value) {
                       setState(() {
                         //_selected = value;

                       });
                     },
                     hint: Text('Available leave type'),
                     icon: new Image.asset(Images.DropIcon),
                     items:  ['leave type'].map((String items) {
                       return DropdownMenuItem(
                         value: items,
                         child: Text(items),
                       );
                     }).toList(),
    ),
                   SizedBox(height: 10.0,),
                   Text(
                     'Notify ',
                     style: textStyleWhite12px400w,
                   ),
                 SizedBox(height: 5.0,),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 20.0),
                   width: Utility.screenWidth(context),

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(3.0),
                     color: AppColors.dropbg,
                     border: Border.all(
                         width: 1.0,
                         color:AppColors.grey
                     ),
                   ),
                   child: ChipsInput<ProfileModel>(
                     decoration:InputDecoration(
                       border: InputBorder.none,
                       hintText: ''
                     ),
                      findSuggestions: getList,
                     onChanged: _onChanged,
                     chipBuilder: (BuildContext context,
                         ChipsInputState<ProfileModel> state, ProfileModel profile){
                       return InputChip(label: Text(profile.name),
                         onDeleted: () => state.deleteChip(profile),
                         onSelected: (_) => _onChipTapped(profile),
                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                       );
                     },
                     suggestionBuilder:  (BuildContext context,
                         ChipsInputState<ProfileModel> state, ProfileModel profile) {
                       return ListTile(
                         key: ObjectKey(profile),

                         title: Text(profile.name),

                         onTap: () => state.selectSuggestion(profile),
                       );
                     },
                      ),
                 ),
                   SizedBox(height: 15.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       RichText(
                           text: TextSpan(children: [
                             TextSpan(
                               text: 'Note',
                               style: textStyleWhite12px400w,
                             ),
                             TextSpan(
                               text: '*',
                               style: TextStyle(color: AppColors.red, fontSize: 16.0),
                             ),
                           ])),
                       Text('${text}/200 words',
                         style: textStyleWhite12px400w,
                       ),
                     ],
                   ),
                   SizedBox(height: 5.0,),
                   Container(
                     height:100.0,
                     child: TextFormField(
                       minLines: null,
                       maxLines: null,
                       expands: true,
                       maxLength: 200,
                       textAlignVertical: TextAlignVertical.top,
                       textInputAction: TextInputAction.newline,
                       keyboardType: TextInputType.multiline,
                       onChanged: (vale){
                         text=vale.length;
                         setState(() {
                         });
                       },
                       decoration: InputDecoration(
                         hintText: 'Please enter reason for applying leave',
                         hintStyle: TextStyle(
                             color: AppColors.grey
                         ),
                         border: InputBorder.none,
                           counterStyle: TextStyle(height: double.minPositive,),
                           counterText: ""
                         ),
                       ),
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(3.0),
                       color: AppColors.dropbg,
                       border: Border.all(
                           width: 1.0,
                           color:AppColors.grey
                       ),
                     ),
                     ),
                 ],
               ),
             ),
            ),
    ),


    ]),

          ),
          bottomButton()
        ],
      ),
    ));

  }
  Container bottomButton() {
    return Container(
      height: 80.0,
      width: Utility.screenWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(0, -6),
          )
        ],
      ),
      child: Expanded(
        child: RevButton(
          width: 55.0,
          text: 'Request Leave',
          radius: 50.0,
          borderColor: AppColors.colorPrimary,
          textStyle: textStyleWhite14px600w,
          onTap: () {

            //Navigator.pushNamed(context, Screens.EmpFeedBack);
          },
        ),
      ),
    );
  }
  void _showDatePicker(ctx,int i) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    var now = DateTime.now();
    var today= new DateTime(now.year, now.month, now.day);
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(

                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (val) {

                      if(i==0)
                      {
                        _start_date = val;
                      }
                      else
                      {
                        _end_date=val;
                      }
                    }
                ),
              ),

              // Close the modal
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {});
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        ));
  }
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
  Future<List<ProfileModel>> getList(String query) async{
    if(query.length!=0)
      {
        return profileList.where((element) {
          return element.name.contains(query);
        }).toList(growable:false);
      }
    else
      {
        return const <ProfileModel>[];
      }

  }
  void _onChanged(List<ProfileModel> data) {
    print('onChanged $data');
  }
  void _onChipTapped(ProfileModel profile) {
    print('$profile');
  }
}
