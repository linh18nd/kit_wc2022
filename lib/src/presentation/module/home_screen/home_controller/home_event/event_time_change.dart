import 'package:equatable/equatable.dart';

abstract class WCEvent extends Equatable {}

class WCEventTimeChanged extends WCEvent {
  final String time;
  WCEventTimeChanged({required this.time});

  @override
  List<Object> get props => [time];
}
