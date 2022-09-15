class Rating {
  dynamic rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    dynamic rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'] as int?,
    );
  }
}
