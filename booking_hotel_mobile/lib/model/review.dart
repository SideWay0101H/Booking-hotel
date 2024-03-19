class Review {
  int? id;
  int? ratings;
  String? comment;
  String? error;
  String? createAt;
  String? updateAt;

  Review(
      {this.id,
      this.ratings,
      this.comment,
      this.error,
      this.createAt,
      this.updateAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ratings = json['ratings'];
    comment = json['comment'];
    error = json['error'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ratings'] = ratings;
    data['comment'] = comment;
    data['error'] = error;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    return data;
  }

   Review.withError(String message) {
    error = message;
  }
}




