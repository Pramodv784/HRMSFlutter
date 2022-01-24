import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/feed_question_presenter.dart';
import 'package:hrms/feedback/feed_question_view.dart';
import 'package:hrms/feedback/select_emp/feed_presenter.dart';
import 'package:hrms/feedback_history/card_feed_history.dart';
import 'package:hrms/feedback_history/model/feedback_history_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Header.dart';

import 'card/card_feed_question.dart';

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
                                          questionList[i]),
                                    ),
                                  ],
                                  backgroundColor: AppColors.red,
                                  collapsedBackgroundColor: AppColors.red,
                                  iconColor: AppColors.white,
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
          ))
        ])));
  }

  _buildExpandableContent(DataCategory dataCategory) {
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
                CardFeedQuestion(question, ques++,this),
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
    // TODO: implement onFeedQuestionFecthed
    questionList.clear();
    questionList.addAll(response.dataCategory);
    setState(() {});
  }

  @override
  void click(String rating, int pos) {
    print('item Click *** $rating  position ${pos}');
   // questionListAnis.add(Quenstions(scoreRating: rating,));

  }
}
