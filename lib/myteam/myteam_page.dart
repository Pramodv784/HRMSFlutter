import 'package:flutter/material.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/myteam/model/get_team_response.dart';
import 'package:hrms/myteam/team_presenter.dart';
import 'package:hrms/myteam/team_view.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import '../res/Fonts.dart';
class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key key}) : super(key: key);

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> implements TeamView{

  TeamPresenter _presenter;
  List<CAD> listItem=[];

  @override
  void initState() {
    _presenter=TeamPresenter(this);
  //  _presenter.getTeam(context, 0);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            Header(headerText: 'My Team',),
            Expanded(child:/* ListView(
              children: [
                Padding(
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
                            'On Leave Today',
                            style: textStyleBlackRegular12pxW700,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                            *//*  child: todayleaveList.length > 0
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
                                  : Text('No data'),*//*
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
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
                              *//*  child: todayleaveList.length > 0
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
                                  : Text('No data'),*//*
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )*/
              ListView.builder(
                itemCount: listItem.length,
                  itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listItem[index].ae.toString()),
                      );
              }))

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
  void onTeamFecthed(GetTeamResponse response) {
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));
       listItem.add(CAD(ae: response.data.cad.ae));

       setState(() {

       });
  }
}
