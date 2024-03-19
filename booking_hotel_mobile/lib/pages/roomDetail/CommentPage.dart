import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/gen/color.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/model/review.dart';
import 'package:booking_hotel_ui/pages/roomDetail/review/review_bloc.dart';
import 'package:booking_hotel_ui/pages/roomDetail/review/review_event.dart';
import 'package:booking_hotel_ui/pages/roomDetail/review/review_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class Comment {
  final String username;
  final String text;

  Comment({required this.username, required this.text});
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];
  final ReviewBLoc _reviewBLoc = ReviewBLoc();
  final ScrollController _listViewController = ScrollController();
  @override
  void initState() {
    _reviewBLoc.add(GetListReview());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
            BlocProvider(
              create: (context) => _reviewBLoc,
              child: BlocBuilder<ReviewBLoc, ReviewState>(
                  builder: (context, state) {
                if (state is ReviewError) {
                  return Center(child: Text(state.error!));
                } else if (state is ReviewInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReviewLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReviewLoaded) {
                  return Visibility(
                    visible:
                        state is ReviewLoaded && state.reviewList.isNotEmpty,
                    child: Scrollbar(
                      controller: _listViewController,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: _listViewController,
                          scrollDirection: Axis.vertical,
                          itemCount: state.reviewList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Review current = state.reviewList[index];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ...List.generate(
                                    current.ratings!.toInt(),
                                    (index) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 12,
                                        )),
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${current.comment.toString()}',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
            )
          ],
        ),
      ),
    );
  }
}
