import 'package:flutter/material.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/myteam/team_presenter.dart';
import 'package:hrms/myteam/team_view.dart';
import 'package:hrms/utility/Utility.dart';
class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key key}) : super(key: key);

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> implements TeamView{

  TeamPresenter _presenter;

  @override
  void initState() {
   //  _presenter=TeamPresenter(this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  onError(String message) {
   Utility.showErrorToast(context, message);
  }

  @override
  void onFeedHistoryFecthed(FeedHistoryResponse response) {
    setState(() {

   });
  }
}
