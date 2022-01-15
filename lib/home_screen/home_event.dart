import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class AvegeScoreEvent extends HomeEvent{
  final int input;
  AvegeScoreEvent({this.input});
  @override
  // TODO: implement props
  List<Object> get props => [input];
}