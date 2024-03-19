import 'package:booking_hotel_ui/pages/Home/bloc/room/room_event.dart';

class SearchEvent extends RoomEvent {
  final String searchTerm;

  SearchEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}