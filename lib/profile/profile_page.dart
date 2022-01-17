import 'package:flutter/material.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
      child: Column(
      children: [
      Header(headerText: 'Profile',),
    Expanded(
      child:
    ListView(
    children: [
     Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
                 margin: EdgeInsets.all(10.0),
                 padding: EdgeInsets.all(5.0),
                 child: Text('-Personal Information',style: TextStyle(fontSize: 18.0,color: Colors.red,fontWeight: FontWeight.bold),)),
             Row(
               children: [
                 Image.asset(Images.ProfileUserIcon),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         RevButton(
                           height: 30.0,
                           text: 'Upload  profile Picture',
                           textStyle: textStyleWhite14px600w,
                           color: AppColors.colorPrimary,
                           borderColor: AppColors.colorPrimary,
                           radius: 50.0,
                           padding: EdgeInsets.all(3.0),
                           onTap: () async {

                           },
                         ),

                         SizedBox(height: 5.0,),

                         RevButton(
                           height: 30.0,
                           text: 'Delete',
                           textStyle: textStyleDark16px600w,
                           color: AppColors.white,
                           borderColor: AppColors.colorPrimary,
                           radius: 50.0,
                           onTap: () async {
                             Navigator.pop(context);
                           },
                         ),
                       ],),
                   ),
                 )
               ],
             ),

             SizedBox(height: 20,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Flexible(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                           'First name',style: TextStyle(fontSize: 15)
                       ),
                       SizedBox(height: 5.0,),
                       Text('Lovely' , style
                           : TextStyle(fontSize: 15,color: AppColors.SubText)
                         ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                       SizedBox(height: 5.0,),

                     ],
                   ),
                 ),
                 SizedBox(width: 10,),
                 Flexible(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                           'Last name      ',style: TextStyle(fontSize: 15)
                       ),
                       SizedBox(height: 5.0,),
                       Text('sharma  ',
                           style: TextStyle(fontSize: 15,color: AppColors.SubText)
                       ,maxLines: 2,overflow: TextOverflow.ellipsis),
                     ],
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Flexible(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                           'Gender',style: TextStyle(fontSize: 15)
                       ),
                       SizedBox(height: 5.0,),
                       Text('Female ', style
                           : TextStyle(fontSize: 15,color: AppColors.SubText)
                         ,),
                       SizedBox(height: 5.0,),

                     ],
                   ),
                 ),
                 SizedBox(width: 10,),
                 Flexible(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                           'Mobile number',style: TextStyle(fontSize: 15)
                       ),
                       SizedBox(height: 5.0,),
                       InkWell(
                         child: Text('+91 9876543210', style: TextStyle(fontSize: 15,color: AppColors.SubText)),
                         onTap: (){
                           // _showDatePicker(context,1);
                         },
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 25.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                 children: [
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             'E-mail  ',style: TextStyle(fontSize: 15)
                         ),
                         SizedBox(height: 5.0,),
                         Text('lsharma@moreyeas.com', style
                             : TextStyle(fontSize: 15,color: AppColors.SubText)
                           ,),
                         SizedBox(height: 5.0,),
                      Container()

                       ],
                     ),
                   ),


                 ],
               ),
             ),
             SizedBox(height: 20,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 25.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             'Address',style: TextStyle(fontSize: 15)
                         ),
                         SizedBox(height: 5.0,),
                         InkWell(
                           child: Text('111, exp street, exp nagar, Indore, MP', style
                               : TextStyle(fontSize: 15,color: AppColors.SubText)
                             ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                           onTap: (){

                           },
                         ),
                         SizedBox(height: 5.0,),
                        Container()
                       ],
                     ),
                   ),


                 ],
               ),
             ),
             Container(height: 1.0,color: AppColors.grey,
             margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),),
             Container(

                 padding: EdgeInsets.all(5.0),
                 child: Text('--Official Details',style: TextStyle(fontSize: 18.0,color: Colors.red,fontWeight: FontWeight.bold),)),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             'Designation',style: TextStyle(fontSize: 15)
                         ),
                         SizedBox(height: 5.0,),
                         InkWell(
                           child: Text('Human Resource Manager', style
                               : TextStyle(fontSize: 15,color: AppColors.SubText)
                             ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                           onTap: (){

                           },
                         ),
                         SizedBox(height: 5.0,),

                       ],
                     ),
                   ),
                   SizedBox(width: 10,),
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             'Company name',style: TextStyle(fontSize: 15)
                         ),
                         SizedBox(height: 5.0,),
                         InkWell(
                           child: Text('MoreYeahs IT Technologies Pvt Ltd', style: TextStyle(fontSize: 15,color: AppColors.SubText),
                             maxLines: 2,overflow: TextOverflow.ellipsis,),
                           onTap: (){
                             // _showDatePicker(context,1);
                           },
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 20,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             'Joining date',style: TextStyle(fontSize: 15)
                         ),
                         SizedBox(height: 5.0,),
                         InkWell(
                           child: Text('22 Jan 2016', style
                               : TextStyle(fontSize: 15,color: AppColors.SubText)
                             ,),
                           onTap: (){

                           },
                         ),
                         SizedBox(height: 5.0,),

                       ],
                     ),
                   ),


                 ],
               ),
             ),
             SizedBox(height: 20.0,),
             RevButton(
               height: 44.0,
               text: 'Change Password',
               textStyle: textStyleWhite14px600w,
               color: AppColors.colorPrimary,
               borderColor: AppColors.colorPrimary,
               radius: 50.0,
               padding: EdgeInsets.all(8.0),
               onTap: () async {
                 Navigator.pop(context);
               },
             ),

           ],
         ),
       ),
     )

    ],),
    )
    ]),
    )
    );
  }
}
