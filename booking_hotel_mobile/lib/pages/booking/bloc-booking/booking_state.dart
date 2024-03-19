import 'package:equatable/equatable.dart';

class BookingState extends Equatable {
  final int quantity;
  final String check_in;
  final String check_out;
  const BookingState(
      { required this.quantity, this.check_in = "", this.check_out = ""});

  @override
  List<Object?> get props => [
    quantity,
    check_in,
    check_out
  ];

  BookingState copyWith({
    String? check_in,
    String? check_out,
    int? quantity
  }) {
    return BookingState(
      quantity: quantity ?? this.quantity,
      check_in: check_in ?? this.check_in,
      check_out: check_out ?? this.check_out);
  }
}
