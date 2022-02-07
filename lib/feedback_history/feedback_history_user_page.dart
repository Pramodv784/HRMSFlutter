import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/feedback_history/card/card_history.dart';
import 'package:hrms/feedback/card/card_feed_history.dart';
import 'package:hrms/feedback_history/feedhistory_presenter.dart';
import 'package:hrms/feedback_history/feedhistory_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import '../user/AuthUser.dart';
import '../utility/InputField.dart';
import 'model/feedback_history_model.dart';

class FeedbackUserHistory extends StatefulWidget {
  const FeedbackUserHistory({Key key}) : super(key: key);

  @override
  _FeedbackUserHistoryState createState() => _FeedbackUserHistoryState();
}

class _FeedbackUserHistoryState extends State<FeedbackUserHistory>
    implements FeedHistoryView {
  bool checkList = false;
  FeedHistoryPresenter _presenter;
  List<Widget> userWidgetList=[];
  List<FeedbackDatas> userList = [];
  FeedHistoryResponse _response;


  @override
  void initState() {
    _presenter = FeedHistoryPresenter(this);
    getuserId();
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    _presenter.getFeedHistory(context, userData?.userId ?? 0);

    print(
        'login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

        child: Column(
            children: [
              Header(headerText: 'Feedback History',),
              Expanded(child:
              ListView(children: [
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: InputField(
                      placeHolderText: 'Search',
                      errorMessage: 'Please enter first name',
                      inputType: InputType.ONLY_WORDS,
                      rightIcon: Images.SearchIcon,

                      onTextChange: (String val) =>  {}
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(5.0),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Feedback    ${_response?.feedbackDatas?.length.toString()}',style: TextStyle(fontSize: 18.0,color: Colors.red,fontWeight: FontWeight.bold),),
                                InkWell(child: Image.asset(Images.FilterIcon),
                                  onTap: (){
                                   // opendFilterDialog();
                                  },)
                              ],
                            )
                        ),
                        Container(
                          height:30,
                          alignment: Alignment.center,
                          color: AppColors.grey,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Employee name'),
                              Text('Team lead'),
                              Text('Feedback type'),
                              Text('Action'),
                            ],
                          ),
                        ),
                        //CardGoal(),
                        ...userWidgetList
                      ],
                    ),
                  ),
                ),

              ],)
                ,)
              ,]),
      ),
    );
  }



  @override
  void onFeedHistoryFecthed(FeedHistoryResponse response) {
    // print('response list **** ${response.feedbackDatas[0].dataCategories}');

      if(response.feedbackDatas!=null)
        {
          for(int i=0;i<response.feedbackDatas.length;i++)
            {
              userWidgetList.add(CardHistory(response.feedbackDatas[i]));
            }
          _response=response;
          setState(() {});
        }


  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
    // TODO: implement onError
    throw UnimplementedError();
  }
}
