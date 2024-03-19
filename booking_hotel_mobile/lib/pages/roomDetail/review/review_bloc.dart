import 'package:booking_hotel_ui/model/review.dart';
import 'package:booking_hotel_ui/pages/roomDetail/review/review_event.dart';
import 'package:booking_hotel_ui/pages/roomDetail/review/review_state.dart';
import 'package:booking_hotel_ui/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewBLoc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBLoc() : super(ReviewInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetListReview>((event, emit) async {
      try {
        emit(ReviewLoading());
        final List<Review> reviewList = await apiRepository.fetchReviewList();
        emit(ReviewLoaded(reviewList: reviewList));
        // if (roomList[0].error != null) {
        //   emit(RoomError(error: roomList[0].error));
        // }
      } on NetWorkError {
        emit(const ReviewError(
            error: "Failed to fetch data is your device online"));
      }
    });
  }
}