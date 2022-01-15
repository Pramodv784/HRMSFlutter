import 'package:equatable/equatable.dart';

import 'model/home_avg_score_response.dart';

class HomeState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class HomeInitailState extends HomeState{}
class HomeLoadingState extends HomeState{}

class HomeSucessState extends HomeState{
final HomeAvgScoreResponse response;
HomeSucessState({this.response});
@override
  // TODO: implement props
  List<Object> get props => [response];

}
class HomeFailurState extends HomeState{
  final String message;
  HomeFailurState({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}