import 'package:booking_hotel_ui/model/review.dart';
import 'package:equatable/equatable.dart';

class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List<Review> reviewList;
  const ReviewLoaded({required this.reviewList});
}

class ReviewError extends ReviewState {
  final String? error;
   const ReviewError({ required this.error});
}
