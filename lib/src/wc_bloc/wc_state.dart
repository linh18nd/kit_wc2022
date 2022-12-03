import 'package:equatable/equatable.dart';
import 'package:kit_wc2022/src/models/football_match.dart';

class WCState extends Equatable {
  final List<FootballMatch> footballMatchs;
  final String time;
  const WCState({required this.footballMatchs, required this.time});

  @override
  List<Object> get props => [footballMatchs, time];
}

class WCStateLoading extends WCState {
  WCStateLoading(String time) : super(footballMatchs: [], time: time);
  @override
  List<Object> get props => ["WCStateLoading"];
}
