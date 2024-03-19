import 'package:equatable/equatable.dart';

abstract class RoomEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetListRoom extends RoomEvent {}
