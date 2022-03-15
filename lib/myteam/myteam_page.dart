import 'package:flutter/material.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/myteam/team_presenter.dart';
import 'package:hrms/myteam/team_view.dart';
import 'package:hrms/myteam/working_remotely_item.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import '../res/Fonts.dart';
import 'model/GetMyTeamResposne.dart';
class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key key}) : super(key: key);

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> implements TeamView{

  TeamPresenter _presenter;
  List<OnLeave> listItem=[];
  List<Widget> onLeaveList=[];

  @override
  void initState() {
    _presenter=TeamPresenter(this);
    _presenter.getTeam(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(

          children: [
            Header(headerText: 'My Team',),
            Expanded(child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'On Leave Today',
                            style: textStyleBlackRegular12pxW700,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              child: onLeaveList.length > 0
                                  ? Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  ...onLeaveList,
                                ],
                              )
                                  : Text('No data'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

           /*     Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Working Remotely',
                            style: textStyleBlackRegular12pxW700,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                child: todayleaveList.length > 0
                                  ? Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  ...todayleaveList,
                                ],
                              )
                                  : Text('No data'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
              ],
            )

      )

          ],
        ),
      )
    );
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

  @override
  void onTeamFecthed(GetMyTeamResposne response) {
        for(OnLeave data in response.data.onLeave)
          {
            onLeaveList.add(CardWorkingRemotely(data));
          }


       setState(() {

       });
  }
}
