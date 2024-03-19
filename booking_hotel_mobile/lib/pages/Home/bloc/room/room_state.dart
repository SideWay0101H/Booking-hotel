import 'package:booking_hotel_ui/model/room.dart';
import 'package:equatable/equatable.dart';

class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<Room> roomList;
  const RoomLoaded({required this.roomList});

}

class RoomError extends RoomState {
  final String? error;
   const RoomError({ required this.error});
}
