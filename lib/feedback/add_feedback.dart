import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/feed_question_presenter.dart';
import 'package:hrms/feedback/feed_question_view.dart';
import 'package:hrms/feedback/model/add_feedback_response.dart';
import 'package:hrms/feedback/select_emp/feed_presenter.dart';
import 'package:hrms/feedback/card/card_feed_history.dart';
import 'package:hrms/feedback_history/model/feedback_history_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

import 'card/card_feed_question.dart';
import 'feedback_request.dart';

class AddFeedback extends StatefulWidget {
  int roleId=0,selectedId=0;
   AddFeedback(this.roleId,this.selectedId,{Key key}) : super(key: key);

  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback>
    implements FeedQuestionView, ItemClick {
  FeedQuestionPresenter _presenter;

  List<DataCategory> questionList = [];
  List<Quenstions> questionListAnis = [];
  FeedbackRequest _feedbackRequest =FeedbackRequest();
  List<FBScore> scoreList=[];

  @override
  void initState() {
    _presenter = FeedQuestionPresenter(this);
    getuserId();
    super.initState();
  }

  void getuserId() async {
     var userData = await (AuthUser.getInstance()).getCurrentUser();
    _presenter.getQuestion(context, widget.roleId, widget.selectedId,  userData.userId??0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Column(children: [
          Header(
            headerText: 'Add Feedback ',
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [AppColors.black, AppColors.black]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(0.0, 1.5),
                              blurRadius: 1.5,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Text(
                        'Employee Feedback',
                        style: textStyleWhite20px400wB,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: questionList.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Divider(
                                height: 17.0,
                                color: Colors.white,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: ExpansionTile(
                                  onExpansionChanged: (data) {
                                    setState(() {});
                                  },
                                  title: CardFeedHistoy(questionList[i]),
                                  children: <Widget>[
                                    Column(
                                      children: _buildExpandableContent(
                                          questionList[i],i),
                                    ),
                                  ],
                                  backgroundColor: AppColors.red,
                                  collapsedBackgroundColor: AppColors.red,
                                  iconColor: AppColors.white,
                                  textColor: AppColors.white,
                                  collapsedIconColor: AppColors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ),
              bottomButton(),
            ])));
  }
  Container bottomButton() {
    return Container(
      height: 80.0,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RevButton(
              height: 55.0,
              text: 'Cancel',
              textStyle: textStyleDark16px600w,
              color: AppColors.grey,
              radius: 50.0,
              borderColor: AppColors.grey,
              onTap: () async {
                // opendDialog();
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: 'Next',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {
                  if(scoreList.length>0)
                    {
                      Navigator.pushNamed(context, Screens.AddEmpFeedRemark,arguments: _feedbackRequest);
                    }
                  else
                    {
                      Utility.showToast(context, 'please provide rating');
                    }

              },
            ),
          ),
        ],
      ),
    );
  }
  _buildExpandableContent(DataCategory dataCategory,int listpos) {
    List<Widget> columnContent = [];
    int ques = 0;
    for (Quenstions question in dataCategory.quenstions)
      columnContent.add(
        Container(
          color: AppColors.white,
          child: new ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardFeedQuestion(question, ques++,listpos,this),
                //],
                //),
              ],
            ),
            //  leading: new Icon(vehicle.icon),
          ),
        ),
      );

    return columnContent;
  }

  @override
  void onFeedQuestionFecthed(FeedQuestionModel response) {
    print('question response***${response.dataCategory[0]}');
    if(response.dataCategory==null && response.dataCategory.isNotEmpty)
      {
        Utility.showErrorToast(context, 'Question not found');
      }
    questionList.clear();
    questionList.addAll(response.dataCategory);
    setState(() {});
  }

  @override
  void click(int rating, int pos,int listpos) {
    print('item Click *** $rating  position ${pos}');
   // questionListAnis.add(Quenstions(scoreRating: rating,));
    final index = scoreList.indexWhere((element) =>
    element.questionId == questionList[listpos]?.quenstions[pos]?.questionId);
    if (index >= 0) {
      print('Using indexWhere: ${index}');
      scoreList[index]=FBScore(categoryId: questionList[listpos]?.categoryTypeId ,
          questionId: questionList[listpos]?.quenstions[pos]?.questionId,questionScore:
          rating);
    }else{
      print('');
      scoreList.add(FBScore(categoryId: questionList[listpos]?.categoryTypeId ,
          questionId: questionList[listpos]?.quenstions[pos]?.questionId,questionScore:
          rating));
    }

    _feedbackRequest?.categoryTypeId=(questionList[listpos]?.categoryTypeId);
    _feedbackRequest?.ratedByEmpId=questionList[listpos]?.userId ;
    _feedbackRequest?.receiverEmployeeId=widget.selectedId;
    /*_feedbackRequest?.fBScore=[FBScore(categoryId: questionList[listpos]?.categoryTypeId ,
        questionId: questionList[listpos]?.quenstions[pos]?.questionId,questionScore:
        rating)];*/
    _feedbackRequest?.fBScore=scoreList;

     print('scorelist***${_feedbackRequest?.fBScore?.length}');

    print('request*****${_feedbackRequest.toString()}');
    print('request List*****${scoreList.length}');
    print('request List item*****${scoreList[0]?.questionScore}');



  }

  @override
  void onAddFeedResponseFecthed(AddFeedbackResponse response) {
    // TODO: implement onAddFeedResponseFecthed
  }
  @override
  void onError(String error) {
    Utility.showErrorToast(context, error);
    Navigator.pop(context);
  }
}
