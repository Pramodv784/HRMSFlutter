import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/home_screen/home_event.dart';
import 'package:hrms/home_screen/home_state.dart';
import 'package:hrms/home_screen/model/home_avg_score_response.dart';

import '../main.dart';


class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() :super(HomeInitailState());

 @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is AvegeScoreEvent){
      yield HomeLoadingState();
      yield*avergeScore(event);
    }


  }
  Stream<HomeState> avergeScore(AvegeScoreEvent event) async* {
    HomeAvgScoreResponse response=await repository.getDashBard(event.input);
    yield HomeSucessState(response: response);


  }
}