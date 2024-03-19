import 'package:equatable/equatable.dart';

abstract class ReviewEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class GetListReview extends ReviewEvent {}