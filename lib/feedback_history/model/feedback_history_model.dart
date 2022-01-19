import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackHistoryModel {
  final String title;
  final int avgScore;
  List<SubItem> contents = [];


  FeedbackHistoryModel(this.avgScore,this.title, this.contents);
}
class SubItem{
  final String feed;
  final int score;


  SubItem(this.feed, this.score);
}

List<FeedbackHistoryModel> feedHistory = [
  new FeedbackHistoryModel(12,
    'Development',
      subList

  ),
  new FeedbackHistoryModel(14,
    'Human Nature ',
    subList,

  ),
  new FeedbackHistoryModel(24,
    'Category ',
      subList

  ),
];
List<SubItem> subList=[
  SubItem('How much points you will give him for code quality?', 12),
  SubItem('How much points you will give him for code quality?', 12),
  SubItem('How much points you will give him for code quality?', 12),
  SubItem('How much points you will give him for code quality?', 12),
  SubItem('How much points you will give him for code quality?', 12),
];